output "cloudflare_raspi_k3s_tunnel_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.raspi_k3s.token
  sensitive = true
}