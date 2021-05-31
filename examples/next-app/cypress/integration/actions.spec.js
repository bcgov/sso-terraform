/// <reference types="cypress" />

// This workflow doesn't work well in a CI environment,
// due to the anti-fraud detection mechanism of GitHub.
describe('Test Keycloak client GitHub IDP', () => {
  const appUrl = Cypress.env('APP_URL') || 'http://localhost:3000';
  const keycloakUrl = Cypress.env('KEYCLOAK_URL') || 'http://localhost:8080';
  const ghUsername = Cypress.env('GH_USERNAME') || 'testuser';
  const ghPassword = Cypress.env('GH_PASSWORD') || 'testuser';

  it('can login via GitHub IDP', () => {
    cy.visit(appUrl);
    cy.get('#login').click();

    cy.url().should('contain', keycloakUrl);

    cy.get('#social-github').click();

    cy.url().should('contain', 'https://github.com/login?');

    cy.get('#login_field').clear().type(ghUsername);
    cy.get('#password').clear().type(ghPassword);
    cy.get('input[type=submit]').click();

    cy.screenshot()
  });
});
