const _ = require('lodash');
const KcAdminClient = require('keycloak-admin').default;

const KEYCLOAK_URL = process.env.KEYCLOAK_URL || 'http://localhost:8080';
const KEYCLOAK_USERNAME = process.env.KEYCLOAK_USERNAME || 'admin';
const KEYCLOAK_PASSWORD = process.env.KEYCLOAK_PASSWORD || 'Pa55w0rd';
const KEYCLOAK_CLIENT = process.env.KEYCLOAK_CLIENT || 'admin-cli';
const GH_OAUTH_CLIENT_ID = process.env.GH_OAUTH_CLIENT_ID || '';
const GH_OAUTH_CLIENT_SECRET = process.env.GH_OAUTH_CLIENT_SECRET || '';

const targetRealms = ['onestopauth', 'onestopauth-business', 'onestopauth-basic', 'onestopauth-both'];

const kcAdminClient = new KcAdminClient({ baseUrl: `${KEYCLOAK_URL}/auth` });

async function main() {
  try {
    await kcAdminClient.auth({
      grantType: 'password',
      clientId: KEYCLOAK_CLIENT,
      username: KEYCLOAK_USERNAME,
      password: KEYCLOAK_PASSWORD,
    });

    const createRealm = (realm) => kcAdminClient.realms.create({ realm, enabled: true });

    const realms = await kcAdminClient.realms.find();

    // Create missing required realms
    const realmsToCreate = _.difference(targetRealms, _.map(realms, 'realm'));

    console.log('Realms to create: ', realmsToCreate);

    const payload = await Promise.all(realmsToCreate.map(createRealm));

    console.log(payload);

    // Create GitHub IDP if not exists
    const idps = await kcAdminClient.identityProviders.find({ realm: targetRealms[0] });

    const ghIdp = idps.find((v) => v.alias === 'github');

    if (!ghIdp) {
      await kcAdminClient.identityProviders.create({
        realm: targetRealms[0],
        alias: 'github',
        providerId: 'github',
        enabled: true,
        updateProfileFirstLoginMode: 'on',
        trustEmail: false,
        storeToken: false,
        addReadTokenRoleOnCreate: false,
        authenticateByDefault: false,
        linkOnly: false,
        firstBrokerLoginFlowAlias: 'first broker login',
        config: {
          syncMode: 'IMPORT',
          clientSecret: GH_OAUTH_CLIENT_SECRET,
          clientId: GH_OAUTH_CLIENT_ID,
          useJwksUrl: 'true',
        },
      });
    }
  } catch (err) {
    console.error(err);
  }
}

main();
