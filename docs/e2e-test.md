# End-to-end testing

- The CI pipeline runs e2e tests on every new change.
- It has seven distinct steps to set up the environment and run the tests.
- For more details, see [.github/workflows/e2e-test.yml](../.github/workflows/e2e-test.yml) directory.

1. Setup required tools and packages to provide a testing environment in CI.
1. Start `Keycloak` instance using dockerfile and creates initial realms.
1. Create test `openid_client` Terraform scripts in the target directory.
1. Run `Terraform` scripts to create the clients in the `Keycloak` server.
1. Start `NodeJS` app server to log in to the `Keycloak` server.
1. Run `Cypress` tests to ensure that the `Terraform` scripts create resources as defined.
1. Store `Cypress` artifacts (video file) and update `GitHub Pages` branch.
