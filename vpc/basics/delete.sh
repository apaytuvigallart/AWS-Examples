#!/bin/bash

VPC_ID=$1
IGW_ID=$2
SUBNET_ID=$3
ASSOCIATION_ID=$4

# Delete VPC and associated resources
aws ec2 detach-internet-gateway --internet-gateway-id "$IGW_ID" --vpc-id "$VPC_ID"
aws ec2 delete-internet-gateway --internet-gateway-id "$IGW_ID"
aws ec2 disassociate-route-table --association-id "$ASSOCIATION_ID"
aws ec2 delete-subnet --subnet-id "$SUBNET_ID"
aws ec2 delete-vpc --vpc-id "$VPC_ID"

echo "VPC Deletion Completed"
