# Go to local-state-tf before using remote

# name the terraform-tf as terraform.tf and run this now
resource "local_file" "state" {
  content = "This configuration uses local state"
  filename = "${path.module}/${var.remote-state}"
}