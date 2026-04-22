resource "cloudflare_zero_trust_access_application" "raspi_k3s_api" {
  domain               = "raspi-k3s-api.riya.work"
  type                 = "self_hosted"
  zone_id              = local.cloudflare_zone_id
  app_launcher_visible = false
  destinations = [{
    type = "public"
    uri  = "raspi-k3s-api.riya.work"
  }]
  policies = [{
    id         = cloudflare_zero_trust_access_policy.raspi_k3s_api.id
    precedence = 1
  }]
}

