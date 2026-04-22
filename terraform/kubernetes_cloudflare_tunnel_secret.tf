resource "kubernetes_secret_v1" "cloudflare_tunnel_token" {
  metadata {
    name      = "cloudflare-tunnel-token"
    namespace = kubernetes_namespace_v1.cloudflare.metadata[0].name
  }
  type = "Opaque"
  data = {
    token = data.cloudflare_zero_trust_tunnel_cloudflared_token.raspi_k3s_api.token
  }
}
