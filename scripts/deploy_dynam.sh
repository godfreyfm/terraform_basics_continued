#!/bin/bash

# Variables
TABLE_NAME="terraform-lock-table"
REGION="us-east-1"  # Specify your preferred region
ROLE_ARN="arn:aws:iam::339713112197:role/terraform_role"  # Replace with your actual role ARN
SESSION_NAME="CreateDynamoDBSession"

# Assume the role
CREDENTIALS=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "$SESSION_NAME")

# Extract temporary credentials
export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r '.Credentials.SessionToken')

# Create DynamoDB table
aws dynamodb create-table \
    --table-name "$TABLE_NAME" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$REGION"

# Check if creation was successful
if [ $? -eq 0 ]; then
    echo "DynamoDB table '$TABLE_NAME' created successfully in region '$REGION'."
else
    echo "Failed to create DynamoDB table '$TABLE_NAME'."
fi
