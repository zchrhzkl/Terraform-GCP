# ================================================== VPC 01 ==================================================

# VPC 1
resource "google_compute_network" "vpc-01" {
  name = "${var.company}-app-${terraform.workspace}-vpc-1"
  auto_create_subnetworks = false
  description = "VPC for App ${terraform.workspace}"
}

# SUBNET 1
resource "google_compute_subnetwork" "vpc-01-subnet-1" {
  name          = "${var.company}-app-a-se1-app01-${terraform.workspace}-subnet-1"
  ip_cidr_range = "10.20.1.0/24"
  network       = google_compute_network.vpc-01.id
}

# SUBNET 2
resource "google_compute_subnetwork" "vpc-01-subnet-2" {
  name          = "${var.company}-app-a-se1-app01-${terraform.workspace}-subnet-2"
  ip_cidr_range = "10.20.2.0/24"
  network       = google_compute_network.vpc-01.id
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-01-allow-ssh" {
  name    = "vpc-01-services-allow-ssh"
  network = google_compute_network.vpc-01.id

  allow {
    protocol = "tcp"
    ports    = ["52606"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# FIREWALL RULE 2
resource "google_compute_firewall" "vpc-01-allow-prometheus" {
  name    = "vpc-01-allow-prometheus"
  network = google_compute_network.vpc-01.id

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  source_ranges = ["10.20.10.0/24"]
}

# FIREWALL RULE 3
resource "google_compute_firewall" "vpc-01-allow-icmp" {
  name    = "vpc-01-allow-icmp"
  network = google_compute_network.vpc-01.id
  
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.20.10.0/24"]
}

# ================================================== VPC 02 ==================================================

resource "google_compute_network" "vpc-02" {
  name = "company-app-k8s-vpc-1"
  auto_create_subnetworks = false
  description = "VPC for K8s production"
}

# SUBNET 1
resource "google_compute_subnetwork" "vpc-02-subnet-1" {
  name          = "${var.company}-app-a-se1-k8s-${terraform.workspace}-subnet-1"
  ip_cidr_range = "10.10.0.0/16"
  network       = google_compute_network.vpc-02.id

  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "10.11.0.0/16"
  }

  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = "10.12.0.0/16"
  }
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-02-allow-ssh" {
  name    = "vpc-02-allow-ssh"
  network = google_compute_network.vpc-02.id

  allow {
    protocol = "tcp"
    ports    = ["52606"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# FIREWALL RULE 2
resource "google_compute_firewall" "vpc-02-allow-prometheus" {
  name    = "vpc-02-allow-prometheus"
  network = google_compute_network.vpc-03.id

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  source_ranges = ["10.20.10.0/24"]
}

# FIREWALL RULE 3
resource "google_compute_firewall" "vpc-02-allow-icmp" {
  name    = "vpc-02-allow-icmp"
  network = google_compute_network.vpc-03.id
  
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.20.10.0/24"]
}

# ================================================== VPC 03 ==================================================

resource "google_compute_network" "vpc-03" {
  name = "${var.company}-app-czt-vpc-1"
  auto_create_subnetworks = false
  description = "VPC for Cloudflare Zero Trust"
}

# SUBNET 1
resource "google_compute_subnetwork" "vpc-03-subnet-1" {
  name          = "company-app-a-se1-czt-${terraform.workspace}-subnet-1"
  ip_cidr_range = "10.20.10.0/24"
  network       = google_compute_network.vpc-03.id
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-03-allow-ssh" {
  name    = "vpc-03-allow-ssh"
  network = google_compute_network.vpc-03.id

  allow {
    protocol = "tcp"
    ports    = ["52606"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# FIREWALL RULE 2
resource "google_compute_firewall" "vpc-03-allow-prometheus" {
  name    = "vpc-03-allow-prometheus"
  network = google_compute_network.vpc-03.id

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  source_ranges = ["10.20.10.0/24"]
}

# FIREWALL RULE 3
resource "google_compute_firewall" "vpc-03-allow-icmp" {
  name    = "vpc-03-allow-icmp"
  network = google_compute_network.vpc-03.id
  
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.20.10.0/24"]
}
