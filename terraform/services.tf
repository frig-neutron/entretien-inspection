resource "google_project_service" "firebase" {
  project = local.project_id
  service = "firebase.googleapis.com"
}
