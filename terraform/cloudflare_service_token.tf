resource "cloudflare_zero_trust_access_service_token" "raspi-k3s-api" {
  name     = "raspi-k3s-api"
  zone_id  = local.cloudflare_zone_id
  duration = "60m"
}
