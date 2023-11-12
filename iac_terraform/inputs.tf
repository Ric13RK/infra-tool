variable "project" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "network_name" {
  default = "rishi-test-tf-network"
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
  description = "description"
}


variable "pub_network" {
  type = map(
    object({
      name   = string
      cidr   = string
      region = string
    })
  )
  default = {
    "australia-southeast1" = {
      name   = "australia-southeast1-test"
      cidr   = "10.152.0.0/20"
      region = "australia-southeast1"
    },
    "europe-west1" = {
      name   = "europe-west1-test"
      cidr   = "10.128.0.0/20"
      region = "europe-west1"
    },
    "us-central1" = {
      name   = "us-central1-test"
      cidr   = "10.128.0.0/20"
      region = "us-central1"
    }
  }
  description = "network (subnet) information"
}
