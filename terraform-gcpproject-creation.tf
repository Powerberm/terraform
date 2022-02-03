variable "project_name" {
    type = string
    default = "YOUR_PROJECT_NAME"
}

variable "project_id" {
    type = string
    default = "YOUR_PROJECT_ID"
}

variable "billing_account" {
    type = string
    default = "YOUR_BILLING_ACCOUNT_ID"
}

variable "org_id" {
    type = string
    default = "YOUR_ORGANIZATION_ID"
}

variable "folder_id" {
    default = YOUR_FOLDER_ID
}

variable "iam_email" {
    type = string
    default = "IAM_EMAIL"
}

resource "google_project" "create_project" {
  name       = var.project_name
  project_id = var.project_id
  folder_id  = var.folder_id
  billing_account = var.billing_account
}

resource "google_project_service" "enable_google_apis" {
  depends_on = [google_project.create_project]
  project = var.project_name
  for_each = toset([
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "datastore.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "cloudtrace.googleapis.com",
    "cloudapis.googleapis.com",
    "storage-api.googleapis.com",
    "clouddebugger.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "cloudbilling.googleapis.com",
    "sql-component.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "servicemanagement.googleapis.com",
    "serviceusage.googleapis.com"
  ])
  service = each.key
  disable_dependent_services = true
}

resource "google_project_iam_member" "assign_iam_role" {
  depends_on = [google_project_service.enable_google_apis]
  project = var.project_name
  role    = "roles/owner"
  member  = "user:${var.iam_email}"
}