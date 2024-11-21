variable "location" {
  type        = string
  description = "Location to deploy resources."
}

variable "name" {
  type        = string
  description = "Resource group name"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}