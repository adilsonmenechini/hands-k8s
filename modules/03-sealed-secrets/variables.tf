variable "chart_version" {
  type        = string
  description = "version of the helm chart"
  default     = "fake-version"
}

variable "host" {
  type        = string
  default = "fake-localshost"
}

variable "client_certificate" {
  type        = string
  default = "fake-client-certificate"
}

variable "client_key" {
  type        = string
  default = "fake-client-key"
}

variable "cluster_ca_certificate" {
  type        = string
  default = "fake-cluster-ca-certificate"
}
