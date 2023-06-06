### Defining variables to use it recurrsive through out the terraform code ###
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
variable "name" {
  type        = string
  description = "Project ID of the project"
}
variable "private-subnet-cidr" {
  type        = string
}
variable "pub-subnet-cidr" {
  type        = string
}
