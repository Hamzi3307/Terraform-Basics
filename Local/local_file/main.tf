resource "local_file" "foo" {
  content = "How a local file works"
  filename = "./files/test.txt"
  file_permission = 0644
} 

resource "local_file" "name" {
  content = "path.module: ${path.module}"
  filename = "./files/file.txt"
}

