const KcAdminClient = require('keycloak-admin').default;

const kcAdminClient = new KcAdminClient({ baseUrl: `${process.env.KEYCLOAK_URL}/auth` });

async function main() {
  try {
    await kcAdminClient.auth({
      grantType: 'password',
      clientId: 'admin-cli',
      username: process.env.KEYCLOAK_USERNAME,
      password: process.env.KEYCLOAK_PASSWORD,
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
