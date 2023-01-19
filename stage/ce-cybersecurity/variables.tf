# GCP authentication file

## Define GCP Project Name
variable "gcp_project" {
  type        = string
  description = "GCP authentication file"
}

## Define GCP Region
variable "gcp_region" {
  type        = string
  description = "GCP authentication file"
}

## Define GCP Zone
variable "gcp_zone" {
  type        = string
  description = "GCP region"
}

## Define GCP Auth
variable "gcp_auth_file" {
  type        = string
  description = "GCP project name"
}

# GCP Compute Engine Variables

## GCP Instance Variables
variable "ce_name" {
  type        = string
  description = "Compute Engine Instance Name"
  default     = "csshield-demo-vm"
}

variable "ce_hostname" {
  type        = string
  description = "Compute Engine Instance Hostname"
  default     = "vm.soc.ip"
}

## GCP Compute Engine Boot Image Variables
variable "ce_bi_size" {
  type        = string
  description = "Compute Engine Boot Instance Size"
}

variable "ce_bi_type" {
  type        = string
  description = "Compute Engine Boot Instance Type"
}

## GCP Compute Engine Boot Image Variables
variable "ce_network_name" {
  type        = string
  description = "Compute Engine Instance Network Name"
}

variable "ce_network_subnet" {
  type        = string
  description = "Compute Engine Instance Network Subnet"
}