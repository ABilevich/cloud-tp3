# ---------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------

variable "bucket_name" {
    description = "Bucket name for S3 static website"
    type        = string
    default     = "w4rkahfwf4q93xgbolp9-itba-cloud-computing"
}

variable "path" {
    description = "Path for static resources"
    type        = string
    default     = "../../code"
}