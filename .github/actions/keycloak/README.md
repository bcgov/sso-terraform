## Purpose

This common action covers one of the limitations of Terraform, such that there is no way to control existing resources, and it ensures the target Keycloak instances are provisioned as:

1. `review profile config` execution of the default authentication flow `first broker login` is disabled.
1. `Browser - Conditional OTP` execution of the default authentication flow `Browser` in `Prod` environment is enforced.
