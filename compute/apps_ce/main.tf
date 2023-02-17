# ================================================== Compute Engine 01 ==================================================

resource "google_compute_instance" "vm_instance_public" {
  name         = var.ce_name
  machine_type = "f1-micro"
  hostname     = var.ce_hostname
  tags         = ["ssh","https","app01"]
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
    access_config { }
  }
}
