const _ = require('lodash');
const KcAdminClient = require('keycloak-admin').default;

const KEYCLOAK_URL = process.env.KEYCLOAK_URL || 'http://localhost:8080';
const KEYCLOAK_USERNAME = process.env.KEYCLOAK_USERNAME || 'admin';
const KEYCLOAK_PASSWORD = process.env.KEYCLOAK_PASSWORD || 'Pa55w0rd';
const KEYCLOAK_CLIENT = process.env.KEYCLOAK_CLIENT || 'admin-cli';

const CI_PROVIDER_REALM = process.env.CI_PROVIDER_REALM || 'ciprovider';
const CI_PROVIDER_CLIENT_ID = process.env.CI_PROVIDER_CLIENT_ID || 'providerclient';
const CI_PROVIDER_CLIENT_SECRET = process.env.CI_PROVIDER_CLIENT_SECRET || 'Pa55w0rd';
const CI_PROVIDER_USER_NAME = process.env.CI_PROVIDER_USER_NAME || 'testuser';

const targetRealms = [
  'onestopauth',
  'onestopauth-business',
  'onestopauth-basic',
  'onestopauth-both',
  CI_PROVIDER_REALM,
];

const CI_BROKER_REALM = targetRealms[0];

const idpAlias = 'keycloak-oidc';

const kcAdminClient = new KcAdminClient({ baseUrl: `${KEYCLOAK_URL}/auth` });

async function main() {
  try {
    await kcAdminClient.auth({
      grantType: 'password',
      clientId: KEYCLOAK_CLIENT,
      username: KEYCLOAK_USERNAME,
      password: KEYCLOAK_PASSWORD,
    });

    const createRealm = async (realm) => {
      await kcAdminClient.realms.create({ realm, enabled: true });
      return kcAdminClient.authenticationManagement.createFlow({
        alias: 'IDIR redirector',
        realm,
        providerId: realm,
        topLevel: true,
        builtIn: false,
      });
    };

    const realms = await kcAdminClient.realms.find();

    // Create missing required realms
    const realmsToCreate = _.difference(targetRealms, _.map(realms, 'realm'));

    console.log('Realms to create: ', realmsToCreate);

    const payload = await Promise.all(realmsToCreate.map(createRealm));

    console.log(payload);

    // Create provider Realm's client in confidential type
    const pclients = await kcAdminClient.clients.find({ realm: CI_PROVIDER_REALM });
    const pclient = pclients.find((v) => v.clientId === CI_PROVIDER_CLIENT_ID);

    if (!pclient) {
      console.log(`creating provider client ${CI_PROVIDER_CLIENT_ID}...`);

      await kcAdminClient.clients.create({
        realm: CI_PROVIDER_REALM,
        clientId: CI_PROVIDER_CLIENT_ID,
        surrogateAuthRequired: false,
        enabled: true,
        secret: CI_PROVIDER_CLIENT_SECRET,
        alwaysDisplayInConsole: false,
        clientAuthenticatorType: 'client-secret',
        redirectUris: [`${KEYCLOAK_URL}/auth/realms/${CI_BROKER_REALM}/broker/keycloak-oidc/endpoint`],
        webOrigins: [],
        notBefore: 0,
        bearerOnly: false,
        consentRequired: false,
        standardFlowEnabled: true,
        implicitFlowEnabled: false,
        directAccessGrantsEnabled: true,
        serviceAccountsEnabled: false,
        publicClient: false,
        frontchannelLogout: false,
        protocol: 'openid-connect',
        attributes: {
          'saml.assertion.signature': 'false',
          'saml.multivalued.roles': 'false',
          'saml.force.post.binding': 'false',
          'saml.encrypt': 'false',
          'oauth2.device.authorization.grant.enabled': 'false',
          'backchannel.logout.revoke.offline.tokens': 'false',
          'saml.server.signature': 'false',
          'saml.server.signature.keyinfo.ext': 'false',
          'use.refresh.tokens': 'true',
          'exclude.session.state.from.auth.response': 'false',
          'oidc.ciba.grant.enabled': 'false',
          'saml.artifact.binding': 'false',
          'backchannel.logout.session.required': 'true',
          'client_credentials.use_refresh_token': 'false',
          saml_force_name_id_format: 'false',
          'saml.client.signature': 'false',
          'tls.client.certificate.bound.access.tokens': 'false',
          'saml.authnstatement': 'false',
          'display.on.consent.screen': 'false',
          'saml.onetimeuse.condition': 'false',
        },
        authenticationFlowBindingOverrides: {},
        fullScopeAllowed: true,
        nodeReRegistrationTimeout: -1,
        defaultClientScopes: ['web-origins', 'profile', 'roles', 'email'],
        optionalClientScopes: ['address', 'phone', 'offline_access', 'microprofile-jwt'],
        access: { view: true, configure: true, manage: true },
      });
    }

    // Create a test user in provider Realm
    const tusers = await kcAdminClient.users.find({ realm: CI_PROVIDER_REALM });
    const tuser = tusers.find((v) => v.username === CI_PROVIDER_USER_NAME);

    if (!tuser) {
      console.log(`creating provider user ${CI_PROVIDER_USER_NAME}...`);

      await kcAdminClient.users.create({
        realm: CI_PROVIDER_REALM,
        username: CI_PROVIDER_USER_NAME,
        enabled: true,
        totp: false,
        emailVerified: false,
        firstName: CI_PROVIDER_USER_NAME,
        lastName: CI_PROVIDER_USER_NAME,
        email: `${CI_PROVIDER_USER_NAME}@example.com`,
        disableableCredentialTypes: [],
        requiredActions: [],
        notBefore: 0,
        credentials: [
          {
            type: 'password',
            value: CI_PROVIDER_USER_NAME,
          },
        ],
        access: {
          manageGroupMembership: true,
          view: true,
          mapRoles: true,
          impersonate: true,
          manage: true,
        },
      });
    }

    // Create Keycloak IDP if not exists
    const kidp = await kcAdminClient.identityProviders.findOne({ realm: CI_BROKER_REALM, alias: idpAlias });

    if (!kidp) {
      console.log(`creating realm idp ${CI_PROVIDER_USER_NAME}...`);
      const idpurl = `${KEYCLOAK_URL}/auth/realms/${CI_PROVIDER_REALM}/protocol/openid-connect`;

      await kcAdminClient.identityProviders.create({
        realm: CI_BROKER_REALM,
        alias: idpAlias,
        displayName: 'Keycloak OIDC',
        providerId: idpAlias,
        enabled: true,
        trustEmail: false,
        storeToken: false,
        addReadTokenRoleOnCreate: false,
        authenticateByDefault: false,
        linkOnly: false,
        firstBrokerLoginFlowAlias: 'first broker login',
        config: {
          authorizationUrl: `${idpurl}/auth`,
          tokenUrl: `${idpurl}/token`,
          logoutUrl: `${idpurl}/logout`,
          userInfoUrl: `${idpurl}/userinfo`,
          syncMode: 'IMPORT',
          clientAuthMethod: 'client_secret_basic',
          clientId: CI_PROVIDER_CLIENT_ID,
          clientSecret: CI_PROVIDER_CLIENT_SECRET,
          backchannelSupported: 'false',
          useJwksUrl: 'true',
          loginHint: 'false',
        },
      });
    }
  } catch (err) {
    console.error(err);
  }
}

main();
