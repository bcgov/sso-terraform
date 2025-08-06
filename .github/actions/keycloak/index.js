const core = require('@actions/core');
const { context } = require('@actions/github');
const run = require('./run');

process.on('unhandledRejection', handleError);
main().catch(handleError);

async function main() {
  const devKeycloakUrl = core.getInput('dev-keycloak-url', { required: true });
  const testKeycloakUrl = core.getInput('test-keycloak-url', { required: true });
  const prodKeycloakUrl = core.getInput('prod-keycloak-url', { required: true });
  const devUsername = core.getInput('dev-username', { required: true });
  const testUsername = core.getInput('test-username', { required: true });
  const prodUsername = core.getInput('prod-username', { required: true });
  const devPassword = core.getInput('dev-password', { required: true });
  const testPassword = core.getInput('test-password', { required: true });
  const prodPassword = core.getInput('prod-password', { required: true });
  const tasks = core.getInput('tasks', { required: true });

  const result = await run({
    context,
    args: {
      devKeycloakUrl,
      testKeycloakUrl,
      prodKeycloakUrl,
      devUsername,
      testUsername,
      prodUsername,
      devPassword,
      testPassword,
      prodPassword,
      tasks,
    },
  });
  core.setOutput('result', JSON.stringify(result));
}

function handleError(err) {
  console.error(err);
  core.setFailed(`Unhandled error: ${err}`);
}
