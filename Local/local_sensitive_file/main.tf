variable "name" {
  default = "Ali"
  type = string
}
resource "local_sensitive_file" "foo" {
  content  = "Hello Mr. ${var.name}"
  filename = "${path.module}/files/foo.bar"
}