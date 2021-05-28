/// <reference types="cypress" />

describe('Create a new application', () => {
  it('can submit an application', () => {
    cy.visit('http://127.0.0.1:3000');
    cy.get('#login').click();

    cy.get('#username').clear().type('testuser');
    cy.get('#password').clear().type('testuser');
    cy.get('#kc-login').click();

    // cy.get('#social-github').click();
  });
});
