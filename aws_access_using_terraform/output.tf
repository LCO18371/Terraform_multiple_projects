output "username" {
  value = { for k, v in aws_iam_user.iam_user : k => v.name }
}
output "passwords" {
  value = { for k, v in aws_iam_user_login_profile.credentials : k => v.password }
  sensitive = true
}