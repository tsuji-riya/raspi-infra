resource "cloudflare_zero_trust_tunnel_cloudflared" "raspi_k3s" {
  account_id    = local.cloudflare_account_id
  name          = "raspi-k3s"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspi_k3s" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_k3s.id

  config = {
    ingress = [
      {
        hostname = "raspi-k3s.riya.work"
        service  = "http://app-service.default.svc.cluster.local:80"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "raspi_k3s" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_k3s.id
}