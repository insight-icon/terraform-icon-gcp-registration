
variable "gcp_project_name" {
  description = "The display name of the gcp project to create - required for cloud / content provider = gcp"
  type        = string
  default     = "icon-testing"
}

variable "gcp_project_id" {
  description = "The name of the gcp project to create - required for cloud / content provider = gcp"
  type        = string
  default     = "icon-testing"
}

variable "gcp_website_location" {
  description = "(Optional, Default: 'US') The GCS location"
  type        = string
  default     = "US"
}

variable "gcp_website_storage_class" {
  description = "The Storage Class of the new bucket. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE"
  type        = string
  default     = "STANDARD"
}

data "google_client_config" "current" {
  count = var.details_endpoint == "" && ! var.skip_registration ? 1 : 0
}

resource "google_compute_address" "this" {
  count = var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  name = local.bucket_name
}

resource "google_storage_bucket" "this" {
  count = var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  name     = local.bucket_name
  location = "US"

  force_destroy = true

  versioning {
    enabled = true
  }

  labels = var.labels
}

resource "google_storage_default_object_acl" "website_acl" {
  count = var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  provider    = google-beta
  bucket      = join("", google_storage_bucket.this.*.id)
  role_entity = ["READER:allUsers"]
}

resource "google_storage_bucket_object" "logo_256" {
  count = var.logo_256 != "" && var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  bucket = join("", google_storage_bucket.this.*.id)
  name   = basename(var.logo_256)
  source = var.logo_256
}

resource "google_storage_bucket_object" "logo_1024" {
  count = var.logo_1024 != "" && var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  bucket = join("", google_storage_bucket.this.*.id)
  name   = basename(var.logo_1024)
  source = var.logo_1024
}

resource "google_storage_bucket_object" "logo_svg" {
  count = var.logo_svg != "" && var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  bucket = join("", google_storage_bucket.this.*.id)
  name   = basename(var.logo_svg)
  source = var.logo_256
}

resource "google_storage_bucket_object" "details_json" {
  count = var.details_endpoint == "" && ! var.skip_registration ? 1 : 0

  bucket  = join("", google_storage_bucket.this.*.id)
  name    = "details.json"
  content = module.registration.details_content
}

