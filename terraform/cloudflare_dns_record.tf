resource "cloudflare_dns_record" "raspi-k3s-api" {
  zone_id = local.cloudflare_zone_id
  name    = "raspi-k3s-api.riya.work"
  content   = "${cloudflare_zero_trust_tunnel_cloudflared.raspi-k3s-api_app.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  ttl = 1
}