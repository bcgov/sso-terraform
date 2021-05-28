const express = require('express');
const session = require('express-session');
const MemoryStore = require('memorystore')(session);
const morgan = require('morgan');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const Keycloak = require('keycloak-connect');
const _ = require('lodash');

const {
  SESSION_SECRET,
  KEYCLOAK_REALM,
  KEYCLOAK_CLIENT_ID,
  KEYCLOAK_CLIENT_SECRET,
  KEYCLOAK_URL,
} = require('./config');

const THIRTY_DAYS = 30 * 24 * (60 * 60 * 1000);

const kcConfig = {
  realm: KEYCLOAK_REALM,
  'client-id': KEYCLOAK_CLIENT_ID,
  'auth-server-url': `${KEYCLOAK_URL}/auth`,
  'ssl-required': 'external',
  'public-client': true,
  'confidential-port': 0,
  secret: KEYCLOAK_CLIENT_SECRET,
};

const logger = morgan('combined');

const getIdentityProvider = (req) => {
  const idp = _.get(req, 'kauth.grant.id_token.content.identity_provider');
  return idp;
};

const initExpresss = async () => {
  const expressServer = express();

  expressServer.use(logger);
  expressServer.use(bodyParser.json());
  expressServer.use(bodyParser.urlencoded({ extended: false }));
  expressServer.use(cookieParser());

  const store = new MemoryStore({
    checkPeriod: THIRTY_DAYS,
  });

  expressServer.use(
    session({
      secret: SESSION_SECRET,
      resave: false,
      saveUninitialized: true,
      cookie: {
        maxAge: THIRTY_DAYS,
        httpOnly: true,
        secure: false,
      },
      store,
    })
  );

  const keycloak = new Keycloak({ store }, kcConfig);

  expressServer.use(
    keycloak.middleware({
      logout: '/logout',
      admin: '/',
    })
  );

  expressServer.post('/login', keycloak.protect(), (req, res) => {
    res.redirect(302, '/');
  });

  expressServer.get('/login', (req, res) => {
    res.redirect(302, '/');
  });

  expressServer.disable('x-powered-by');

  expressServer.set('trust proxy', 1);

  return expressServer;
};

module.exports = initExpresss;
