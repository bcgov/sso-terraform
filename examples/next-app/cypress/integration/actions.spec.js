/// <reference types="cypress" />

describe('Test Keycloak client GitHub IDP', () => {
  Cypress.Cookies.debug(true);
  Cypress.Cookies.defaults({
    preserve: 'session_id',
  })

  const appUrl = Cypress.env('APP_URL') || 'http://127.0.0.1:3000';
  const ghUsername = Cypress.env('GH_USERNAME') || 'testuser';
  const ghPassword = Cypress.env('GH_PASSWORD') || 'testuser';

  beforeEach(() => {
    // before each test, we can automatically preserve the
    // 'session_id' and 'remember_token' cookies. this means they
    // will not be cleared before the NEXT test starts.
    //
    // the name of your cookies will likely be different
    // this is an example
    Cypress.Cookies.preserveOnce('logged_in', 'user_session', '_gh_sess');
  });

  it('can login via GitHub IDP', () => {
    cy.visit(appUrl, {
      onBeforeLoad(win) {
        cy.stub(win.navigator, 'cookieEnabled', true).as('cookieEnabled');
      },
    });
    cy.get('#login').click();

    cy.get('#social-github').click();

    cy.get('#login_field').clear().type('asdf');
    cy.get('#password').clear().type(ghPassword);
    cy.get('input[type=submit]').click();
  });
});
