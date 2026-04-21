resource "cloudflare_dns_record" "raspi_k3s" {
  zone_id = local.cloudflare_zone_id
  name    = "raspi-k3s.riya.work"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.raspi_k3s.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  ttl     = 1
}
