locals {
  project_id                = "inspection-dev-7b978"
}

resource "google_project" "inspection" {
  name       = "inspection-dev"
  project_id = local.project_id

  billing_account = data.google_billing_account.default.id
}

data "google_billing_account" "default" {
  billing_account = "billingAccounts/011E93-94AD19-D2FF71"
}

