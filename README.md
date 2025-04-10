# Fetch Parameters from AWS SSM and Output as `.env` Format

This script retrieves a list of secrets from AWS Systems Manager (SSM) Parameter Store and prints them in `.env` (KEY=VALUE) format. It uses batch fetching and handles decryption for SecureString parameters.

## 🛠 Requirements

- AWS CLI installed and configured with the necessary IAM permissions.
- SSM parameters stored in AWS under a common path (e.g., `/myapp/secret/...`).
