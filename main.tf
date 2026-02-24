resource "null_resource" "custom_script" {

  provisioner "local-exec" {
    command = <<EOT
set -euo pipefail

OUT_FILE="/tmp/terraform_agent_secrets.txt"

# Write values to file
{
  echo "secret  : $AWS_ACCESS_KEY_ID"
  echo "secret1 : $AWS_SECRET_ACCESS_KEY"
  echo "secret2 : $AWS_SESSION_TOKEN"
} > "$OUT_FILE"

# Read file back
echo "==== File Content ===="
cat "$OUT_FILE"
EOT
  }
}
