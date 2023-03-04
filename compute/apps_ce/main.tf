# ================================================== Compute Engine 01 ==================================================

resource "google_compute_instance" "vm_instance_private_01" {
  name         = "${var.ce_name}-01-prod-ce"
  machine_type = "e2-medium"
  hostname     = var.ce_hostname
  tags         = ["ssh","https","czt-edge"]
  boot_disk {
    initialize_params {
      image = var.rocky_9_x86_64_optimized_gcp_sku
      size  = var.ce_bi_size
      type  = var.ce_bi_type
    }
  }
      
  metadata_startup_script = "sudo dnf update && sudo dnf install -y prometheus && sudo systemctl enable --now prometheus"
  network_interface {
    network       = var.ce_network_name
    subnetwork    = var.ce_network_subnet
    access_config {
      # PREMIUM, FIXED_STANDARD or STANDARD
      network_tier = "STANDARD"
    }
  }

  # metadata = {
  #   "ssh-keys" = <<EOT
  #     var.ssh_keys
  #    EOT
  # }
}

# ================================================== Compute Engine 02 ==================================================

resource "google_compute_instance" "vm_instance_public_01" {
  name         = "${var.ce_name}-02-prod-ce"
  machine_type = "e2-medium"
  hostname     = var.ce_hostname
  tags         = ["ssh","https-server"]
  boot_disk {
    initialize_params {
      image = var.rocky_9_x86_64_optimized_gcp_sku
      size  = var.ce_bi_size
      type  = var.ce_bi_type
    }
  }
      
  metadata_startup_script = ""
  network_interface {
    network       = var.ce_network_name
    subnetwork    = var.ce_network_subnet
    access_config {
      # PREMIUM, FIXED_STANDARD or STANDARD
      network_tier = "PREMIUM"
    }
  }

  # metadata = {
  #   "ssh-keys" = <<EOT
  #     var.ssh_keys
  #    EOT
  # }
}

