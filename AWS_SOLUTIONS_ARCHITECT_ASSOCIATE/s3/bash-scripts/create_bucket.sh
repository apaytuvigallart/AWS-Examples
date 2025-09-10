#!/bin/bash
set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name region(optional, default: eu-west-1)"
    exit 1
fi

BUCKET_NAME=$1
REGION=${2:-eu-west-1}

aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"
