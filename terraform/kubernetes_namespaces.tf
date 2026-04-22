resource "kubernetes_namespace_v1" "cloudflare" {
  metadata {
    name = "cloudflare"
  }
}