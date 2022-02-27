# Firebase API requires that we talk to it via service account
# 
# Impersonating this service account using the firebase_admin aliased provider.

locals {
  firebase_admin_account_id = "firebase-admin"
  firebase_admin_email      = "${local.firebase_admin_account_id}@${local.project_id}.iam.gserviceaccount.com"
}

provider "google-beta" {
  alias        = "firebase_admin"
  access_token = data.google_service_account_access_token.firebase_admin.access_token
}

resource "google_project_service" "firebase" {
  # This runs using normal user creds
  project = local.project_id
  service = "firebase.googleapis.com"
}

resource "google_service_account" "firebase_admin" {
  account_id = local.firebase_admin_account_id
  project    = google_project.inspection.project_id
}

resource "google_project_iam_binding" "firebase_admin" {

  project = google_project.inspection.project_id
  role    = "roles/firebase.admin"
  members = [
    "serviceAccount:${google_service_account.firebase_admin.email}"
  ]
}

# GCP won't let me do some stuff unless I use an SA so I have to impersonate it
data "google_service_account_access_token" "firebase_admin" {
  provider               = google.impersonation
  target_service_account = local.firebase_admin_email
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "1200s"
}

resource "google_firebase_project" "inspection" {
# SA also needs to have editor for this
  depends_on = [google_project_service.firebase]
  # provider = google-beta.default
  provider = google-beta.firebase_admin
  project  = google_project.inspection.project_id
}

resource "google_firebase_web_app" "inspection" {
  provider = google-beta.firebase_admin
  project  = google_project.inspection.project_id
  display_name = "Inspection frontend DEV"
  
  depends_on = [google_firebase_project.inspection]
}
