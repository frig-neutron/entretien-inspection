data "google_billing_account" "default" {
  billing_account = "billingAccounts/011E93-94AD19-D2FF71"
}

resource "google_billing_budget" "seatbelt" {
  billing_account = data.google_billing_account.default.id
  amount {
    specified_amount {
      currency_code = "CAD"
      units         = "20"
    }
  }
  threshold_rules {
    threshold_percent = 0.5
  }
}
