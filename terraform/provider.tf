
provider "google" {
}

provider "google" {
  alias = "impersonation"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

provider "google-beta" {
  alias = "default"
}

provider "google-beta" {
  alias        = "firebase_admin"
  access_token = data.google_service_account_access_token.firebase_admin.access_token
}

# GCP won't let me do some stuff unless I use an SA so I have to impersonate it
data "google_service_account_access_token" "firebase_admin" {
  provider               = google.impersonation
  target_service_account = local.firebase_admin_email
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "1200s"
}
