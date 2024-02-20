# resource "aws_iam_user" "users" {
#   name = "mary"
#   tags = {
#     Description = "Technical Lead"
#   }
# }

resource "aws_iam_user" "users" {
  name = var.project-sapphire-users[count.value]
  count = length(var.project-sapphire-users)
}