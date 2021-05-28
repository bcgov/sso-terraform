const KcAdminClient = require('keycloak-admin').default;

const KEYCLOAK_URL = process.env.KEYCLOAK_URL || 'http://127.0.0.1:8080';
const KEYCLOAK_USERNAME = process.env.KEYCLOAK_USERNAME || 'admin';
const KEYCLOAK_PASSWORD = process.env.KEYCLOAK_PASSWORD || 'Pa55w0rd';
const KEYCLOAK_CLIENT = process.env.KEYCLOAK_CLIENT || 'admin-cli';

const kcAdminClient = new KcAdminClient({ baseUrl: `${KEYCLOAK_URL}/auth` });

async function main() {
  try {
    await kcAdminClient.auth({
      grantType: 'password',
      clientId: 'admin-cli',
      username: KEYCLOAK_USERNAME,
      password: KEYCLOAK_PASSWORD,
    });

    const createRealm = (realm) => kcAdminClient.realms.create({ realm });

    const payload = await Promise.all(
      ['onestopauth', 'onestopauth-business', 'onestopauth-basic', 'onestopauth-both'].map(createRealm)
    );

    console.log(payload);
  } catch (err) {
    console.error(err);
  }
}

main();
