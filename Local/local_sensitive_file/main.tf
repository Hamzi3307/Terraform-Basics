resource "local_sensitive_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/files/foo.bar"
}