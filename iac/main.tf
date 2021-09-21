# GitHub secrets
data "aws_secretsmanager_secret" "github_secret" {
  name = var.github_secret_name
}

data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = data.aws_secretsmanager_secret.github_secret.id
}

# Docker secrets
data "aws_secretsmanager_secret" "docker_secret" {
  name = var.docker_secret_name
}

data "aws_secretsmanager_secret_version" "docker_creds" {
  secret_id = data.aws_secretsmanager_secret.docker_secret.id
}

# Backend Pipeline
module "backend_pipeline" {
  source = "./backend_pipeline"
  application_name = var.application_name
  pipeline_bucket_name = "${var.application_name}-codepipeline"
  codebuild_bucket_name = "${var.application_name}-codebuild"
  github_org = "LukeMwila"
  repository_name = "fleet-git-ops-pipeline"
  branch_name = var.branch_name
  environment     = var.environment
  github_token = jsondecode(data.aws_secretsmanager_secret_version.github_token.secret_string)["GitHubPersonalAccessToken"]
  docker_hub_id = jsondecode(data.aws_secretsmanager_secret_version.docker_creds.secret_string)["DOCKER_ID"]
  docker_hub_password = jsondecode(data.aws_secretsmanager_secret_version.docker_creds.secret_string)["DOCKER_PW"]
}