const child_process = require('child_process');
const fs = require('fs');
const path = require('path');
const shell = require('shelljs');
const _ = require('lodash');
const { TerraformGenerator } = require('terraform-generator');

const mock = new TerraformGenerator();

const keycloakRealm = mock.data('keycloak_realm', 'this', {});

const realms = ['onestopauth', 'onestopauth-basic', 'onestopauth-both', 'onestopauth-business'];
const allEnvironments = ['dev', 'test', 'prod'];

module.exports = ({ clientName, realmName, validRedirectUris, environments, publicAccess }) => {
  if (!realms.includes(realmName)) return null;

  const getEnvPath = (env) => {
    const outputDir = path.join(`terraform/keycloak-${env}/realms/${realmName}`);
    const tfFile = `client-${clientName}.tf`;
    const target = path.join(outputDir, tfFile);

    return {
      outputDir,
      tfFile,
      target,
    };
  };

  const SEPARATOR = '\n';

  const paths = _.map(environments, (env) => {
    const { outputDir, target } = getEnvPath(env);

    const tfg = new TerraformGenerator();

    const data = {
      source: '../../../modules/openid-client',
      realm_id: keycloakRealm.attr('id'),
      client_name: clientName,
      valid_redirect_uris: validRedirectUris[env] || validRedirectUris,
    };

    if (publicAccess === 'true') {
      data.access_type = 'PUBLIC';
      data.pkce_code_challenge_method = 'S256';
      data.web_origins = ['+'];
    }

    tfg.module(`client_${clientName}`, data);

    const result = tfg.generate();

    const formatted =
      result.tf
        .split(SEPARATOR)
        .filter((v) => v.length > 0)
        .join(SEPARATOR) + SEPARATOR;

    shell.mkdir('-p', outputDir);
    fs.writeFileSync(target, formatted);

    child_process.execSync('terraform fmt', { cwd: outputDir });

    return target;
  });

  return { paths, allPaths: allEnvironments.map((env) => getEnvPath(env).target) };
};
