provider "aws" {

  
}


provider "vault" {
    address = "http://54.89.130.97:8200"
    skip_child_token = true
    auth_login {
      path = "auth/approle/login" // app-role mechanism
 // fetch it from terminal
 // vault read auth/approle/role/terraform/role-id
 // vault write -f auth/approle/role/terraform/secret-id

      parameters = {
        role_id = "6e3c2dd2-84b1-91f1-8a14-a4493cb87a3c"
        secret_id = "47d71447-84fe-9845-b3c5-975a08374bf0"
      }
    }
  
}


// to retrieve info from vault
# data "" "name" {
  
# }



data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}