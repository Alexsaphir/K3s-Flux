resource "gitlab_instance_variable" "codecov-host-url" {
  key   = "CODECOV_HOST_URL"
  value = "https://codecov.${module.api.domain_name}"
}

resource "gitlab_instance_variable" "sonar-host-url" {
  key   = "SONAR_HOST_URL"
  value = "https://sonarqube.${module.api.domain_name}"

}
