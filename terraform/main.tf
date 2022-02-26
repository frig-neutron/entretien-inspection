locals {
  project_id                = "inspection-dev-7b978"
  firebase_admin_account_id = "firebase-admin"
  firebase_admin_email      = "${local.firebase_admin_account_id}@${local.project_id}.iam.gserviceaccount.com"
}
resource "google_project" "inspection" {
  name       = "inspection-dev"
  project_id = local.project_id

  billing_account = data.google_billing_account.default.id
}

resource "google_firebase_project" "inspection" {
# SA also needs to have editor for this
  depends_on = [google_project_service.firebase]
  # provider = google-beta.default
  provider = google-beta.firebase_admin
  project  = google_project.inspection.project_id
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

resource "google_firebase_web_app" "inspection" {
  provider = google-beta.firebase_admin
  project  = google_project.inspection.project_id
  display_name = "Inspection frontend DEV"
  
  depends_on = [google_firebase_project.inspection]
}

