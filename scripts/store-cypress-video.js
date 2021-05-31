// This module runs in GitHub Action `github-script`
// see https://github.com/actions/github-script#run-a-separate-file
module.exports = ({ github, context }) => {
  return context;
};
