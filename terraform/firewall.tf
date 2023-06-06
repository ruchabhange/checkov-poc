resource "google_compute_firewall" "default-hc-https" {
    direction               = "INGRESS"
    disabled                = false
    name                    = "demo-ingress"
    network                 = google_compute_network.default.name
    priority                = 1000
    project                 = var.project_id
    source_ranges           = [
        "130.211.0.0/22",
        "35.191.0.0/16",
    ]

    allow {
        ports    = [
            "31271",
        ]
        protocol = "tcp"
    }
}

