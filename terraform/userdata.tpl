#!/bin/bash

# Replace placeholders with actual secrets
export SECRET_USERNAME="{{username}}"
export SECRET_PASSWORD="{{password}}"

# Use the secrets as needed
echo "Username: $SECRET_USERNAME"
echo "Password: $SECRET_PASSWORD"
