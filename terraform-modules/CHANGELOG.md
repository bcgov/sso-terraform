# Change Log

## Jun 08, 2023

- Disable `logout_redirect_uri_delegator` from all `base-realms`

## Mar 28, 2023

- Remove duplicate audience mapper from SAML response

## Jan 25, 2023

- Backchannel logout (`backchannel_supported`) turned off for parent realm azure idp and standard realm azure idp in prod prod
- Full name mapper disabled from being added to tokens in prod prod

## Jan 24, 2023

- `full_name` mapper under `scope-name-mappers` is disabled from adding to token and userinfo response for prod dev and prod test

## Jan 17, 2023

- Backchannel logout (`backchannel_supported`) turned off for parent realm azure idp and standard realm azure idp in prod dev and prod test

## June 19, 2023

- Added new user_principal_name attribute for clients using Azure IDIR

## June 20, 2023

- Added profile and email scopes to the azureidir identity provider in the parent realm

## June 19, 2025

- Moved into a sub-folder of sso-terraform repo
