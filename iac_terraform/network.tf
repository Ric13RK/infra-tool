resource "google_compute_network" "vpc_network" {
  # name = "rishi-test-tf-network"
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "public_sb" {
  for_each = var.pub_network

  name    = each.value.name
  network = google_compute_network.vpc_network.self_link

  ip_cidr_range            = each.value.cidr
  region                   = each.value.region
  private_ip_google_access = true
}

# # resource "google_compute_subnetwork" "private_sb" {
# #   for_each = var.pub_network

# #   name                     = each.value.name
# #   network                  = google_compute_network.vpc_network.self_link

# #   ip_cidr_range            = each.value.cidr
# #   region                   = each.value.region
# #   private_ip_google_access = true
# # }

# resource "google_compute_subnetwork" "public_sb" {
#   name                     = "pub"
#   network                  = google_compute_network.vpc_network.self_link

#   ip_cidr_range            = "10.1.16.0/20"
#   region                   = "australia-southeast1"
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "private_sb" {
#   name                     = "pri"
#   network                  = google_compute_network.vpc_network.self_link

#   ip_cidr_range            = "10.1.16.0/20"
#   region                   = "australia-southeast1"
#   private_ip_google_access = true
# }