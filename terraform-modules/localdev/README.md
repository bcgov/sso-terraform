# SSO Terraform Modules Local Test

This directory provides a local development environment for the Terraform modules located in [modules](../modules).

To start a local keycloak instance to test changes against, run:

- `podman-compose up`

This will run a keycloak instance on port 8080 and a postgres instance on 5433 (in case a local is running on 5432). See the [podman-compose.yaml](./podman-compose.yaml) file for the default environment configuration, and to change the base image. Note that the authentication flows in the modules depend on our custom authenticators, so ensure to use an image from our [sso-keycloak packages](https://github.com/bcgov/sso-keycloak/pkgs/container/sso) if changing the base image.

To apply the module changes to your local instance, create a file `values.auto.tfvars` and add the following:

```
username="admin"
password="admin"
keycloak_url="http://localhost:8080"
```

Then from another terminal run:

- `terraform init`
- `terraform apply`

On the first apply, you may hit some 404 errors such as:

```
Error: error sending POST request to /auth/admin/realms/master/identity-provider/instances/idir/mappers: 404 Not Found. Response body: {"error":"HTTP 404 Not Found","error_description":"For more on this error consult the server log at the debug level."}
```

This is due to api calls running too quickly before the parent resource was completed. Rerun the modules to complete creation.

## Reapplying

If you would like to test out reapplying from scratch, you can stop the compose and delete your local database volume to clear all data:

- `podman-compose down`
- `podman volume rm localdev_postgres_data`

Then restart to have a fresh database.
