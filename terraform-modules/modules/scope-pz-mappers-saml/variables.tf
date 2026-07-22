variable "realm_id" {
  type    = string
  default = ""
}

variable "bcsc_environment" {
  type    = string
  default = "sit"
}

variable "sit_privacy_zone_scopes" {
  type = map(string)
  default = {
    "urn:ca:bc:gov:health:mocksit" : "Health (Citizen)",
    "urn:ca:bc:gov:fin:ctz:pz:sit" : "Finance (Citizen)",
    "urn:ca:bc:gov:educ:sit" : "Education (Citizen)",
    "urn:ca:bc:gov:healthprovider:sit" : "Health (Provider)",
    "urn:ca:bc:gov:justice:sit" : "Justice (Citizen)",
    "urn:ca:bc:gov:nrs:ctz:pz:sit" : "Natural Resources (Citizen)",
    "urn:ca:bc:gov:bcpsa:ctz:pz:sit" : "BC Public Service Agency (Citizen)",
    "urn:ca:bc:sbc:ctz:pz:sit" : "Citizens' Services (Citizen)",
    "urn:ca:bc:gov:tran:pro:pz:sit" : "Transportation (Professional)",
    "urn:ca:bc:gov:social:sit" : "Social (Citizen)",
    "urn:ca:bc:gov:nrs:pro:sit" : "Natural Resources (Professional)",
    "urn:ca:bc:gov:citz:pro:sit" : "Citizens' Services (Professional)",
    "urn:ca:bc:gov:buseco:sit" : "Business and Economy (Citizen)",
    "urn:ca:bc:gov:educprofessional:sit" : "Education (Professional)",
    "urn:ca:bc:gov:tran:citz:pz:sit" : "Transportation (Citizen)",
    "urn:ca:bc:gov:buseco:pro:sit" : "Business and Economy (Professional)"
  }
}

variable "test_privacy_zone_scopes" {
  type = map(string)
  default = {
    "urn:ca:bc:gov:health:mockidtest" : "Health (Citizen)",
    "urn:ca:bc:gov:buseco:test" : "Business and Economy (Citizen)",
    "urn:ca:bc:bcassessment:ctz:pz:test" : "BC Assessment (Citizen)",
    "urn:ca:bc:gov:buseco:pro:test" : "Business and Economy (Professional)",
    "urn:ca:bc:gov:fin:ctz:pz:test" : "Finance (Citizen)",
    "urn:ca:bc:gov:fin:pro:pz:test" : "Finance (Professional)",
    "urn:ca:bc:sbc:ctz:pz:test" : "Citizens' Services (Citizen)",
    "urn:ca:bc:gov:social:prof:test" : "Social (Professional)",
    "urn:ca:bc:elections:ctz:pz:test" : "Elections BC (Citizen)",
    "urn:ca:bc:gov:justice:prof:test" : "Justice (Professional)",
    "urn:ca:bc:gov:tran:citz:pz:test" : "Transportation (Citizen)",
    "urn:ca:bc:gov:educ:test" : "Education (Citizen)",
    "urn:ca:bc:gov:healthprovider:test" : "Health (Provider)",
    "urn:ca:bc:gov:justice:test" : "Justice (Citizen)",
    "urn:ca:bc:gov:nrs:ctz:pz:test" : "Natural Resources (Citizen)",
    "urn:ca:bc:gov:bcpsa:ctz:pz:test" : "BC Public Service Agency (Citizen)",
    "urn:ca:bc:gov:tran:pro:pz:test" : "Transportation (Professional)",
    "urn:ca:bc:gov:social:test" : "Social (Citizen)",
    "urn:ca:bc:gov:nrs:pro:test" : "Natural Resources (Professional)",
    "urn:ca:bc:gov:citz:pro:test" : "Citizens' Services (Professional)",
    "urn:ca:bc:gov:educprofessional:test" : "Education (Professional)"
  }
}

variable "prod_privacy_zone_scopes" {
  type = map(string)
  default = {
    "urn:ca:bc:gov:nrs:ctz:pz:prod" : "Natural Resources (Citizen)",
    "urn:ca:bc:sbc:ctz:pz:prod" : "Citizens' Services (Citizen)",
    "urn:ca:bc:gov:educprofessional:prod" : "Education (Professional)",
    "urn:ca:bc:gov:buseco:prod" : "Business and Economy (Citizen)",
    "urn:ca:bc:gov:justice:prd" : "Justice (Citizen)",
    "urn:ca:bc:gov:bcpsa:ctz:pz:prod" : "BC Public Service Agency (Citizen)",
    "urn:ca:bc:gov:justice:prof:prd" : "Justice (Professional)",
    "urn:ca:bc:gov:buseco:pro:prod" : "Business and Economy (Professional)",
    "urn:ca:bc:gov:fin:ctz:pz:prod" : "Finance (Citizen)",
    "urn:ca:bc:gov:fin:pro:pz:prod" : "Finance (Professional)",
    "urn:ca:bc:gov:tran:citz:pz:prod" : "Transportation (Citizen)",
    "urn:ca:bc:gov:health:prd" : "Health (Citizen)",
    "urn:ca:bc:gov:healthprovider" : "Health (Provider)",
    "urn:ca:bc:gov:educ" : "Education (Citizen)",
    "urn:ca:bc:gov:social:prod" : "Social (Citizen)",
    "urn:ca:bc:gov:social:prof:prod" : "Social (Professional)",
    "urn:ca:bc:gov:nrs:pro:prod" : "Natural Resources (Professional)",
    "urn:ca:bc:gov:tran:pro:pz:prod" : "Transportation (Professional)",
    "urn:ca:bc:gov:citz:pro:prod" : "Citizens' Services (Professional)",
    "urn:ca:bc:bcassessment:ctz:pz:prod" : "BC Assessment (Citizen)",
    "urn:ca:bc:elections:ctz:pz:prod" : "Elections BC (Citizen)"
  }
}
