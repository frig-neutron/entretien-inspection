resource "google_project" "inspection" {
  name       = "inspection-dev"
  project_id = "inspection-dev-7b978"

  billing_account = data.google_billing_account.default.id
}
