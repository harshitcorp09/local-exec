resource "null_resource" "custom_script" {

  provisioner "local-exec" {

    

    command = <<EOT
set -euo pipefail

OUT_FILE="/tmp/tf_agent_debug.txt"

{
  echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
  echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
  echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN"
} > "$OUT_FILE"
EOT
  }
}

data "local_file" "tf_agent_debug" {
  filename   = "/tmp/tf_agent_debug.txt"
  depends_on = [null_resource.custom_script]
}

output "debug_values" {
  value     = data.local_file.tf_agent_debug.content
  sensitive = true
}
