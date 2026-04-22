resource "cloudflare_zero_trust_tunnel_cloudflared" "raspi_k3s_api" {
  account_id = local.cloudflare_account_id
  name       = "raspi-k3s-api"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspi_k3s_api_config" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_k3s_api.id

  config = {
    ingress = [
      {
        hostname = "raspi-k3s-api.riya.work"
        service  = "https://127.0.0.1:6443"
        original_request = {
          no_tls_verify = true
        }
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "raspi_k3s_api" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_k3s_api.id
}
