# enable compute API
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

# enable container google API 
resource "google_project_service" "container" {
  service = "container.googleapis.com"
}
resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
}


# VPC with autocreate subnet false
resource "google_compute_network" "vpc" {
  name                            = "${var.project}-vpc"
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = false
  mtu                             = var.mtu
  delete_default_routes_on_create = false
}

# create private subnet 
resource "google_compute_subnetwork" "private-subnet" {
  name                     = "${var.project}-private-subnet"
  ip_cidr_range            = var.ip_cidr_range_subnet
  region                   = var.region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = var.pod-range
    ip_cidr_range = var.ip_pod-range
  }
  secondary_ip_range {
    range_name    = var.service-range
    ip_cidr_range = var.ip_service-range
  }
}

# router confguration 
resource "google_compute_router" "router" {
  name    = "${var.project}-router"
  region  = var.region
  network = google_compute_network.vpc.id
}


# NAt
resource "google_compute_router_nat" "nat" {
  name   = "${var.project}-nat"
  router = google_compute_router.router.name
  region = var.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = "${var.project}-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

  #  depends_on = [google_project_service.compute]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

