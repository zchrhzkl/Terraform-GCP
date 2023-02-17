variable "rocky_8_x86_64_sku" {
  type        = string
  description = "SKU for Rocky Linux 8 x86_64"
  default     = "rocky-linux-cloud/rocky-linux-8"
}

variable "rocky_8_x86_64_optimized_gcp_sku" {
  type        = string
  description = "SKU for Rocky Linux 8 x86_64 Optimized GCP"
  default     = "rocky-linux-cloud/rocky-linux-8-optimized-gcp"
}

variable "rocky_9_x86_64_sku" {
  type        = string
  description = "SKU for Rocky Linux 8 x86_64"
  default     = "rocky-linux-cloud/rocky-linux-9"
}

variable "rocky_9_x86_64_optimized_gcp_sku" {
  type        = string
  description = "SKU for Rocky Linux 9 x86_64 Optimized GCP"
  default     = "rocky-linux-cloud/rocky-linux-9-optimized-gcp"
}

variable "rocky_8_arm64_optimized_gcp_sku" {
  type        = string
  description = "SKU for Rocky Linux 8 arm64 Optimized GCP"
  default     = "rocky-linux-cloud/rocky-linux-8-optimized-gcp-arm64 "
}

variable "rocky_9_arm64_sku" {
  type        = string
  description = "SKU for Rocky Linux 9 arm64"
  default     = "rocky-linux-cloud/rocky-linux-9-arm64 "
}

variable "rocky_9_arm64_optimized_gcp_sku" {
  type        = string
  description = "SKU for Rocky Linux 9 arm64 Optimized GCP"
  default     = "rocky-linux-cloud/rocky-linux-9-optimized-gcp-arm64 "
}