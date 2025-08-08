const KcAdminClient = require('@keycloak/keycloak-admin-client').default;

module.exports = async function run({ context, args }) {
  const tasks = (args.tasks || '').split(' ');

  const getKcAdminClient = async (env) => {
    const kcAdminClient = new KcAdminClient({
      baseUrl: args[`${env}KeycloakUrl`] + '/auth',
      realmName: 'master',
      requestConfig: {
        /* Axios request config options https://github.com/axios/axios#request-config */
        timeout: 60000,
      },
    });

    await kcAdminClient.auth({
      grantType: 'password',
      clientId: 'admin-cli',
      username: args[`${env}Username`],
      password: args[`${env}Password`],
    });

    return kcAdminClient;
  };

  const updateReviewProfileConfig = async (env) => {
    const kcAdminClient = await getKcAdminClient(env);
    const realms = await kcAdminClient.realms.find();

    for (let x = 0; x < realms.length; x++) {
      const realm = realms[x].realm;

      const execs = await kcAdminClient.authenticationManagement.getExecutions({
        realm,
        flow: 'first broker login',
      });
      const reviewProfileExe = execs.find((exe) => exe.alias === 'review profile config');
      await kcAdminClient.authenticationManagement.updateExecution(
        { realm, flow: 'first broker login' },
        {
          ...reviewProfileExe,
          requirement: 'DISABLED',
        },
      );
    }
  };

  const enforceBrowserConditionalOtp = async (env) => {
    const kcAdminClient = await getKcAdminClient(env);

    const realm = 'master';
    const search = { realm, flow: 'browser' };
    const execs = await kcAdminClient.authenticationManagement.getExecutions(search);

    const otpExe = execs.find((exe) => exe.displayName === 'Browser - Conditional OTP');
    await kcAdminClient.authenticationManagement.updateExecution(search, {
      ...otpExe,
      requirement: 'REQUIRED',
    });
  };

  const createMasterViewer = async (env) => {
    const realm = 'master';
    const viewer = 'master-viewer';

    const kcAdminClient = await getKcAdminClient(env);
    const existingRole = await kcAdminClient.roles.findOneByName({ name: viewer, realm });

    // create the `viewer` role if not exists
    if (!existingRole) {
      await kcAdminClient.roles.create({
        name: viewer,
        description: viewer,
        clientRole: false,
        containerId: 'master',
      });
    }

    // find all client roles that has viewer privileges for each realm
    const clients = await kcAdminClient.clients.find({ realm });
    const compositeRoles = [];
    await Promise.all(
      clients.map(async (client) => {
        if (!client.clientId.endsWith('-realm')) return;

        const roles = await kcAdminClient.clients.listRoles({ realm, id: client.id });
        roles.forEach((role) => {
          if (role.name.startsWith('view-') || role.name.startsWith('query-')) {
            compositeRoles.push(role);
          }
        });
      }),
    );

    // assign composite roles to the `viewer` role
    const role = await kcAdminClient.roles.findOneByName({ realm, name: viewer });
    await kcAdminClient.roles.createComposite({ roleId: role.id }, compositeRoles);
  };

  const deleteUnusedClientScopes = async (env) => {
    const kcAdminClient = await getKcAdminClient(env);
    await kcAdminClient.clientScopes.delByName({ realm: 'standard', name: 'role_list' }).catch(() => null);
  };

  try {
    const taskMap = {
      'update-review-profile-config': () => Promise.all(['dev', 'test', 'prod'].map(updateReviewProfileConfig)),
      'delete-unused-client-scopes': () => Promise.all(['dev', 'test', 'prod'].map(deleteUnusedClientScopes)),
      'enforce-browser-conditional-otp': () => Promise.all(['prod'].map(enforceBrowserConditionalOtp)),
      'create-master-viewer': () => Promise.all(['dev', 'test', 'prod'].map(createMasterViewer)),
    };

    for (let x = 0; x < tasks.length; x++) {
      const task = taskMap[tasks[x]];
      if (!task) continue;

      await task();
    }

    return true;
  } catch (err) {
    console.error(err);
    return false;
  }
};
