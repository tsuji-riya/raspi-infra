terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

locals {
  cloudflare_zone_id    = "3ad0619381ef2fcb5a1bbca6a88b782d"
  cloudflare_account_id = "c4ae140fd7a6950a6e72ffb33207f473"
}

variable "cloudflare_api_token" {
  description = "API token used for Cloudflare API authentication"
  type        = string
  sensitive   = true
}

variable "tunnel_secret" {
  description = "Tunnel secret (32 bytes base64)"
  type        = string
  sensitive   = true
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

this is invalid code