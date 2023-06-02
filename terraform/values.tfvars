# specify required values needed for terraform 
project              = "checkov-demo"
project_id           = "xxxxxxxx"
cluster_name         = "checkov-demo"
region               = "us-central1"
routing_mode         = "REGIONAL"
zones                = ["us-central1-a", "us-central1-b"]
mtu                  = "1460"
ip_k8s-pod-range     = "10.20.0.0/16"
ip_k8s-service-range = "10.30.0.0/16"
ip_cidr_range_subnet = "10.10.0.0/16"
