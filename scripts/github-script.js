const fs = require('fs');
const _ = require('lodash');
const generateClients = require('./generate-clients');

// This module runs in GitHub Action `github-script`
// see https://github.com/actions/github-script#run-a-separate-file-with-an-async-function
module.exports = async ({ github, context }) => {
  const { payload } = context;
  const { inputs, repository } = payload;

  const owner = repository.owner.login;
  const repo = repository.name;

  let { projectName, identityProviders, validRedirectUrls, environments } = inputs;
  projectName = _.kebabCase(projectName);
  identityProviders = JSON.parse(identityProviders);
  validRedirectUrls = JSON.parse(validRedirectUrls);
  environments = JSON.parse(environments);

  const { realm, paths } = generateClients({
    projectName,
    identityProviders,
    validRedirectUrls,
    environments,
  });

  try {
    const mainRef = await github.git
      .getRef({
        owner,
        repo,
        ref: `heads/${repository.default_branch}`,
      })
      .then(
        (res) => res.data,
        (err) => null
      );

    if (!mainRef) {
      console.error('no main branch');
    }

    const prBranchName = `request/${projectName}`;

    let prRef = await github.git
      .getRef({
        owner,
        repo,
        ref: `heads/${prBranchName}`,
      })
      .then(
        (res) => res.data,
        (err) => null
      );

    if (!prRef) {
      await github.git.createRef({
        owner,
        repo,
        ref: `refs/heads/${prBranchName}`,
        sha: mainRef.object.sha,
      });
    }

    for (let x = 0; x < paths.length; x++) {
      await github.repos.createOrUpdateFileContents({
        owner,
        repo,
        sha: await getSHA({
          ref: prBranchName,
          path: paths[x],
        }),
        branch: prBranchName,
        path: paths[x],
        message: `feat: add a client file for ${projectName}`,
        content: fs.readFileSync(paths[x], { encoding: 'base64' }),
      });
    }

    await github.pulls
      .create({
        owner,
        repo,
        base: repository.default_branch,
        head: prBranchName,
        title: `request: add client files for ${projectName}`,
        body: `
#### Project Name: \`${_.startCase(projectName)}\`
#### Identity Providers: \`${identityProviders.join(', ')}\`
#### Target Realm: \`${realm}\`
#### Environments: \`${environments.join(', ')}\`
${environments.map(
  (env) => `<details><summary>Show Details for ${env}</summary>
\`\`\`<ul>✔️Valid Redirect Urls${(validRedirectUrls[env] || validRedirectUrls || []).map(
    (url) => `<li>${url}</li>`
  )}</ul>\`\`\`
</details>`
)}`,
        maintainer_can_modify: false,
      })
      .catch(() => null);
  } catch (e) {
    console.log(e);
  }

  async function getSHA({ ref, path }) {
    const data = await github.repos
      .getContent({
        owner,
        repo,
        ref,
        path,
      })
      .then(
        (res) => res.data,
        (err) => null
      );

    return data && data.sha;
  }
};
