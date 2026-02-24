resource "null_resource" "custom_script" {

  provisioner "local-exec" {
    command = <<EOT
  echo "secret : $AWS_ACCESS_KEY_ID"
  echo "secret1 : $AWS_SECRET_ACCESS_KEY"
  echo "secret2 : $AWS_SESSION_TOKEN"
EOT
  }
}
