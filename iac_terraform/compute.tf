# resource "google_compute_instance" "vm_instance" {
#   name         = "rishi-test-tf-instance"
#   machine_type = "f1-micro"

#   tags = ["foo0t", "bar0t"]

#   boot_disk {
#     initialize_params {
#       image = "cos-cloud/cos-stable"
#     }
#   }

#   network_interface {
#     network = google_compute_network.vpc_network.name
#     access_config {
#     }
#   }

#   labels = {
#     foo0l = "bar0l"
#   }

#   metadata = {
#     foo0m = "bar0m"
#   }
# }

# variable "network_prefix" {
#   type    = string
#   default = "test-rishi"
# }


# resource "google_compute_network" "default" {
#   name                    = var.network_prefix
#   auto_create_subnetworks = "false"
# }

# resource "google_compute_subnetwork" "group1" {
#   name                     = "${var.network_prefix}-sb-1"
#   ip_cidr_range            = "10.126.0.0/20"
#   network                  = google_compute_network.default.self_link
#   region                   = "australia-southeast1"
#   private_ip_google_access = true
# }

# # Router and Cloud NAT are required for installing packages from repos (apache, php etc)
# resource "google_compute_router" "group1" {
#   name    = "${var.network_prefix}-gw-group1"
#   network = google_compute_network.default.self_link
#   region  = "australia-southeast1"
# }

# # module "cloud-nat-group1" {
# #   source     = "terraform-google-modules/cloud-nat/google"
# #   version    = "1.4.0"
# #   router     = google_compute_router.group1.name
# #   project_id = var.project
# #   region     = var.group1_region
# #   name       = "${var.network_prefix}-cloud-nat-group1"
# # }

# resource "google_compute_subnetwork" "group2" {
#   name                     = "private-${var.network_prefix}-sb-2"
#   ip_cidr_range            = "10.127.0.0/20"
#   network                  = google_compute_network.default.self_link
#   region                   = "australia-southeast1"
#   private_ip_google_access = true
# }

# # Router and Cloud NAT are required for installing packages from repos (apache, php etc)
# resource "google_compute_router" "group2" {
#   name    = "${var.network_prefix}-gw-group2"
#   network = google_compute_network.default.self_link
#   region  = "australia-southeast1"
# }

# # module "cloud-nat-group2" {
# #   source     = "terraform-google-modules/cloud-nat/google"
# #   version    = "1.4.0"
# #   router     = google_compute_router.group2.name
# #   project_id = var.project
# #   region     = var.group2_region
# #   name       = "${var.network_prefix}-cloud-nat-group2"
# # }

# # # [START cloudloadbalancing_ext_http_gce]
# # module "gce-lb-http" {
# #   source  = "GoogleCloudPlatform/lb-http/google"
# #   version = "~> 5.1"
# #   name    = var.network_prefix
# #   project = var.project
# #   target_tags = [
# #     "${var.network_prefix}-group1",
# #     module.cloud-nat-group1.router_name,
# #     "${var.network_prefix}-group2",
# #     module.cloud-nat-group2.router_name
# #   ]
# #   firewall_networks = [google_compute_network.default.name]

# #   backends = {
# #     default = {

# #       description                     = null
# #       protocol                        = "HTTP"
# #       port                            = 80
# #       port_name                       = "http"
# #       timeout_sec                     = 10
# #       connection_draining_timeout_sec = null
# #       enable_cdn                      = false
# #       security_policy                 = null
# #       session_affinity                = null
# #       affinity_cookie_ttl_sec         = null
# #       custom_request_headers          = null
# #       custom_response_headers         = null

# #       health_check = {
# #         check_interval_sec  = null
# #         timeout_sec         = null
# #         healthy_threshold   = null
# #         unhealthy_threshold = null
# #         request_path        = "/"
# #         port                = 80
# #         host                = null
# #         logging             = null
# #       }

# #       log_config = {
# #         enable      = true
# #         sample_rate = 1.0
# #       }

# #       groups = [
# #         {
# #           group                        = module.mig1.instance_group
# #           balancing_mode               = null
# #           capacity_scaler              = null
# #           description                  = null
# #           max_connections              = null
# #           max_connections_per_instance = null
# #           max_connections_per_endpoint = null
# #           max_rate                     = null
# #           max_rate_per_instance        = null
# #           max_rate_per_endpoint        = null
# #           max_utilization              = null
# #         },
# #         {
# #           group                        = module.mig2.instance_group
# #           balancing_mode               = null
# #           capacity_scaler              = null
# #           description                  = null
# #           max_connections              = null
# #           max_connections_per_instance = null
# #           max_connections_per_endpoint = null
# #           max_rate                     = null
# #           max_rate_per_instance        = null
# #           max_rate_per_endpoint        = null
# #           max_utilization              = null
# #         },
# #       ]

# #       iap_config = {
# #         enable               = false
# #         oauth2_client_id     = ""
# #         oauth2_client_secret = ""
# #       }
# #     }
# #   }
# # }