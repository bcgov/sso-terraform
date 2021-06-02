require('dotenv').config({ path: __dirname + '/../.env.local' });

module.exports = {
  HOST_NAME: process.env.HOST || '0.0.0.0',
  PORT: process.env.PORT || 3000,
  SESSION_SECRET: process.env.SESSION_SECRET || 'verysecuresecret',
  KEYCLOAK_REALM: process.env.KEYCLOAK_REALM || '',
  KEYCLOAK_CLIENT_ID: process.env.KEYCLOAK_CLIENT_ID || '',
  KEYCLOAK_CLIENT_SECRET: process.env.KEYCLOAK_CLIENT_SECRET || '',
  KEYCLOAK_URL: process.env.KEYCLOAK_URL || 'http://localhost:8080',
};
