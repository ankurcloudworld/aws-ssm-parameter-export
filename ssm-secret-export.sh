PARAMS=(
  "/myapp/secret/db-password"
  "/myapp/secret/api-key"
  "/myapp/secret/token"
  "/myapp/secret/stripe-key"
  "/myapp/secret/jwt-secret"
  "/myapp/secret/email-pass"
  "/myapp/secret/github-token"
)
 
# Clear temp file
TMP_FILE=$(mktemp)
 
for ((i=0; i<${#PARAMS[@]}; i+=10)); do
  batch=("${PARAMS[@]:i:10}")
  aws ssm get-parameters \
    --names "${batch[@]}" \
    --with-decryption \
    --query "Parameters[*].[Name,Value]" \
    --output text >> "$TMP_FILE"
done
 
# Format and print all as KEY=VALUE
sort "$TMP_FILE" | while read -r name value; do
  key=$(basename "$name")
  echo "$key=$value"
done
 
# Clean up
rm "$TMP_FILE"
