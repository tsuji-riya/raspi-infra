resource "cloudflare_zero_trust_tunnel_cloudflared" "raspi-k3s-api_app" {
  account_id    = local.cloudflare_account_id
  name          = "raspi-k3s-api"
  tunnel_secret = var.tunnel_secret
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspi-k3s-api_config" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi-k3s-api_app.id

  config = {
    ingress = [
      {
        hostname = "raspi-k3s-api.riya.work"
        service  = "ssh://127.0.0.1:22"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "raspi-k3s-api_token" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi-k3s-api_app.id
}

output "cloudflare_tunnel_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.raspi-k3s-api_token.token
  sensitive = true
}