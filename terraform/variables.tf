#### Defining variables to use it recurrsive through out the terraform code ###
variable "project_id" {
  type        = string
  description = "Project ID of the project"
}
variable "region" {
  type        = string
  description = "Region"
}
variable "project" {
  type        = string
  description = "Project ID of the project"
}
variable "routing_mode" {
  type        = string
  description = "Define routing_mode"
}
variable "mtu" {
  type        = string
  default     = "1460"
  description = "Define mtu"
}
variable "cluster_name" {
  type        = string
  description = "Define Cluster Name"
}
variable "zones" {
  type        = list(string)
  description = "The zone to host the cluster in (required if is a zonal cluster)"
}
variable "k8s-pod-range" {
  type        = string
  description = "Define k8s-pod-ip range name"
}
variable "k8s-service-range" {
  type        = string
  description = "Define k8s-service ip range name"
}
variable "ip_cidr_range_subnet" {
  description = "The subnetwork ip cidr block range."
}

variable "ip_k8s-pod-range" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_k8s-service-range" {
  description = "The cidr ip range to use for pods"
  default     = "10.24.0.0/14"
}
variable "artifact_registry" {
  description = "List of gcr repositories according to service"
  type        = list(string)
}

variable "service_port" {
  description = "Node port for ingress"
  type        = number
}

variable "service_port_name" {
  description = "Name of service port"
  type        = string
}

variable "clouddns_zone" {
  description = "Name of clouddns_zone"
  type        = string
}
