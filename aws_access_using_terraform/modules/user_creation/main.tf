locals {
  all_users = toset(concat(
    tolist(var.cli_users),
    tolist(var.console_users)
  ))
}


resource "aws_iam_user" "iam_user" {
  for_each = local.all_users

  name = each.value
}

resource "aws_iam_user_login_profile" "credentials" {
  for_each = var.console_users

  user                    = aws_iam_user.iam_user[each.value].name
  password_reset_required = true
}
resource "aws_iam_user_policy" "s3_policy" {
  for_each = var.console_users
  name = "testing-s3"
  user = aws_iam_user.iam_user[each.key].name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "iam:ChangePassword"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}


# resource "aws_iam_access_key" "credentials" {
#   for_each = var.iam_users

#   user = aws_iam_user.iam_user[each.key].name
# }

