# ================================================== VPC 01 ==================================================

# VPC 1
resource "google_compute_network" "vpc-01" {
  name = "pensieve-css-prod-vpc-1"
  auto_create_subnetworks = false
  description = "VPC for CS Shield production"
}

#SUBNET 1
resource "google_compute_subnetwork" "vpc-01-subnet-1" {
  name          = "pensieve-css-a-se1-prod-subnet-1"
  ip_cidr_range = "10.20.1.0/24"
  network       = google_compute_network.vpc-01.id
}

#SUBNET 2
resource "google_compute_subnetwork" "vpc-01-subnet-2" {
  name          = "pensieve-css-a-se1-prod-subnet-2"
  project       = "csshield"
  ip_cidr_range = "10.20.2.0/24"
  network       = google_compute_network.vpc-01.id
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-01-allow-ssh" {
  name    = "vpc-01-services-allow-ssh"
  project = "csshield"
  network = google_compute_network.vpc-01.id

  allow {
    protocol = "tcp"
    ports    = ["52606"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-01-allow-opensearch" {
  name    = "vpc-01-allow-opensearch"
  project = "csshield"
  network = google_compute_network.vpc-01.id


  allow {
    protocol = "tcp"
    ports    = ["9200"]
  }
  
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.20.1.0/24", "10.20.2.0/24"]
}

# ================================================== VPC 02 ==================================================

resource "google_compute_network" "vpc-02" {
  name = "pensieve-css-k8s-vpc-1"
  project       = "csshield"
  auto_create_subnetworks = false
  description = "VPC for K8s production"
}

# SUBNET 1
resource "google_compute_subnetwork" "vpc-02-subnet-1" {
  name          = "pensieve-css-a-se1-k8s-subnet-1"
  project       = "csshield"
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
  project = "csshield"
  network = google_compute_network.vpc-02.id

  allow {
    protocol = "tcp"
    ports    = ["52606"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# FIREWALL RULE 1
resource "google_compute_firewall" "vpc-02-allow-opensearch" {
  name    = "vpc-02-allow-opensearch"
  project = "csshield"
  network = google_compute_network.vpc-02.id

  allow {
    protocol = "tcp"
    ports    = ["9200"]
  }
  
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.10.0.0/16", "10.11.0.0/16", "10.12.0.0/16"]
}
