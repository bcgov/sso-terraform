/// <reference types="cypress" />

// This workflow doesn't work well in a CI environment,
// due to the anti-fraud detection mechanism of GitHub.
describe('Test Keycloak client via Keycloak OIDC IDP', () => {
  const appUrl = Cypress.env('APP_URL') || 'http://localhost:3000';
  const keycloakUrl = Cypress.env('KEYCLOAK_URL') || 'http://localhost:8080';
  const testUsername = Cypress.env('TEST_USERNAME') || 'testuser';

  it('can login via Keycloak OIDC IDP', () => {
    cy.visit(appUrl);
    cy.get('#login').click();

    cy.url().should('contain', keycloakUrl);

    cy.get('#social-keycloak-oidc').click();

    cy.url().should('contain', 'client_id=providerclient');

    cy.get('#username').clear().type(testUsername);
    cy.get('#password').clear().type(testUsername);
    cy.get('#kc-login').click();

    cy.url().should('contain', appUrl);

    cy.get(`span#idp`).contains('keycloak-oidc');

    cy.screenshot();
  });
});
