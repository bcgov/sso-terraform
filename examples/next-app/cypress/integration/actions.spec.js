/// <reference types="cypress" />

describe('Test Keycloak client GitHub IDP', () => {
  const appUrl = Cypress.env('APP_URL') || 'http://127.0.0.1:3000';
  const ghUsername = Cypress.env('GH_USERNAME') || '';
  const ghPassword = Cypress.env('GH_PASSWORD') || '';

  it('can login via GitHub IDP', () => {
    cy.visit(appUrl);
    cy.get('#login').click();

    cy.get('#social-github').click();

    cy.get('#login_field').clear().type(ghUsername);
    cy.get('#password').clear().type(ghPassword);
    cy.get('input[type=submit]').click();
  });
});
