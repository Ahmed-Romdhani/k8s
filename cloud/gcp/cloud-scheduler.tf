resource "google_cloud_scheduler_job" "genuis-job" {
  name         = "genuis-terraform-tutorial"
  description  = "Hello World every 2minutes"
  schedule     = "0/2 * * * *"
  http_target {
    http_method = "GET"
    uri = google_cloudfunctions_function.function.https_trigger_url
    oidc_token {
      service_account_email = "terraform-sa-email"
    }
}
