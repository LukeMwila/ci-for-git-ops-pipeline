variable "application_name" {
  description = "The name of the application"
  type = string
}

variable build_timeout {
  type        = string
  default     = "10"
  description = "Build time out duration"
}

variable "repository_name" {
  description = "Name of git repository"
  type = string
}

variable "github_org" {
  type = string
}

variable "github_token" {
  description = "Github token"
  type = string
}

variable "docker_hub_id" {
  description = "Name of github token"
  type = string
}

variable "docker_hub_password" {
  description = "Name of github token"
  type = string
}

variable "branch_name" {
  default = "develop"
  type = string
}

variable pipeline_bucket_name {
  type        = string
  default     = "euw1-lfm-pipeline-bucket"
  description = "S3 bucket for pipeline artifacts"
}

variable codebuild_bucket_name {
  type        = string
  default     = "euw1-lfm-codebuild-bucket"
  description = "S3 bucket for build cache"
}

variable bucket_acl {
  type        = string
  default     = "private"
  description = "Bucket ACL (Access Control Listing)"
}

variable "environment" {
  description = "Applicaiton environment"
  default = "dev"
  type = string
}

variable "codebuild_image" {
  description = "CodeBuild Container base image"
  default = "aws/codebuild/standard:4.0"
  type = string
}