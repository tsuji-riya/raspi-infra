variable "cloudflare_api_token" {
  description = "API token used for Cloudflare API authentication"
  type        = string
  sensitive   = true
}

variable "kubernetes_client_certificate" {
  description = "Kubernetes client certificate for authentication"
  type        = string
  sensitive   = true
}

variable "kubernetes_client_key" {
  description = "Kubernetes client key for authentication"
  type        = string
  sensitive   = true
}

variable "kubernetes_cluster_ca_certificate" {
  description = "Kubernetes cluster CA certificate for authentication"
  type        = string
  sensitive   = true
}
