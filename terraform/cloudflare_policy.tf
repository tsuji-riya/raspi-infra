resource "cloudflare_zero_trust_access_policy" "raspi-k3s-api" {
  account_id = local.cloudflare_account_id
  name       = "raspi-k3s-api"
  decision   = "non_identity"
  include = [
    {
      service_token = {
        token_id = cloudflare_zero_trust_access_service_token.raspi-k3s-api.id
      }
    }
  ]
}

