const fs = require('fs');
const _ = require('lodash');
const generateClients = require('./generate-clients');
const axios = require('axios');
const API_URL = 'https://gcp9dahm4c.execute-api.ca-central-1.amazonaws.com/test/actions?status=create';
const axiosConfig = { headers: { Authorization: process.env.GH_SECRET } };

// This module runs in GitHub Action `github-script`
// see https://github.com/actions/github-script#run-a-separate-file-with-an-async-function
module.exports = async ({ github, context }) => {
  const { payload } = context;
  const { inputs, repository } = payload;
  const owner = repository.owner.login;
  const repo = repository.name;

  let { requestId, clientName, realmName, validRedirectUris, environments, publicAccess } = inputs;

  try {
    console.log(requestId, clientName, realmName, validRedirectUris, environments, publicAccess);

    validRedirectUris = JSON.parse(validRedirectUris);
    environments = JSON.parse(environments);

    const info = generateClients({
      clientName,
      realmName,
      validRedirectUris,
      environments,
      publicAccess,
    });

    if (!info) throw Error('failed in client creation');

    const { paths, allPaths } = info;

    const mainRef = await github.git.getRef({ owner, repo, ref: `heads/${repository.default_branch}` }).then(
      (res) => res.data,
      (err) => null
    );

    if (!mainRef) {
      console.error('no main branch');
    }

    const prBranchName = `request/${clientName}-${new Date().getTime()}`;

    await github.git.createRef({ owner, repo, ref: `refs/heads/${prBranchName}`, sha: mainRef.object.sha });

    console.log(allPaths);

    // check the number of existing files to check the mode; create, update and delete
    const allPathSHAs = await Promise.all(allPaths.map((path) => getSHA({ ref: prBranchName, path })));

    console.log(allPathSHAs);

    const existingCount = _.compact(allPathSHAs).length;
    console.log(existingCount);

    let mode;
    if (existingCount === 0) {
      if (paths.length === 0) {
        throw Error('no clients to create');
      }

      mode = 'add';
    } else {
      if (paths.length === 0) {
        mode = 'delete';
      } else {
        mode = 'update';
      }
    }

    console.log('mode', mode);

    // delete the files first before creating ones
    for (let x = 0; x < allPaths.length; x++) {
      const path = allPaths[x];
      await github.repos
        .deleteFile({
          owner,
          repo,
          sha: await getSHA({ ref: prBranchName, path }),
          branch: prBranchName,
          path,
          message: `chore: remove a client file for ${clientName}`,
        })
        .then(
          (res) => res.data,
          (err) => null
        );
    }

    console.log(paths);

    // create the requested client files
    for (let x = 0; x < paths.length; x++) {
      const path = paths[x];
      await github.repos.createOrUpdateFileContents({
        owner,
        repo,
        sha: await getSHA({ ref: prBranchName, path }),
        branch: prBranchName,
        path,
        message: `feat: add a client file for ${clientName}`,
        content: fs.readFileSync(path, { encoding: 'base64' }),
      });
    }

    let pr = await github.pulls.create({
      owner,
      repo,
      base: repository.default_branch,
      head: prBranchName,
      title: `request: ${mode} client files for ${clientName}`,
      body: `
  #### Project Name: \`${_.startCase(clientName)}\`
  #### Target Realm: \`${realmName}\`
  #### Environments: \`${environments.join(', ')}\`
  ${environments.map(
    (env) => `<details><summary>Show Details for ${env}</summary>
  \`\`\`<ul>✔️Valid Redirect Urls${(validRedirectUris[env] || validRedirectUris || []).map(
    (url) => `<li>${url}</li>`
  )}</ul>\`\`\`
  </details>`
  )}`,
      maintainer_can_modify: false,
    });

    const {
      data: { number },
    } = pr;

    await github.issues.addLabels({
      owner,
      repo,
      issue_number: number,
      labels: ['auto_generated']
    })

    axios.put(API_URL, { prNumber: number, prSuccess: true, id: requestId, actionNumber: context.runId }, axiosConfig);
    return pr;
  } catch (err) {
    console.log(err);
    axios.put(API_URL, { prNumber: null, prSuccess: false, id: requestId, actionNumber: context.runId }, axiosConfig);
    throw err;
  }

  async function getSHA({ ref, path }) {
    const data = await github.repos.getContent({ owner, repo, ref, path }).then(
      (res) => res.data,
      (err) => null
    );

    return data && data.sha;
  }
};
