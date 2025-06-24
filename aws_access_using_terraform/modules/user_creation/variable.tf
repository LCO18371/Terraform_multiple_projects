variable "cli_users" {
  type    = set(string)
  default = ["cli_user1", "cli_user2"]
}

variable "console_users" {
  type    = set(string)
  default = ["console_user1"]
}
