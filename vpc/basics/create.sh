#!/bin/bash

# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block 172.31.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=MyVPC}]' --query 'Vpc.VpcId' --output text)

# Enable DNS hostnames
aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-hostnames "{\"Value\":true}"

# Create Internet Gateway and attach to VPC
IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --vpc-id "$VPC_ID" --internet-gateway-id "$IGW_ID"

# Create Subnet
SUBNET_ID=$(aws ec2 create-subnet --vpc-id "$VPC_ID" --cidr-block 172.31.1.0/24 --availability-zone eu-west-1a --query 'Subnet.SubnetId' --output text)

# Enable Auto-assign Public IP on Subnet
aws ec2 modify-subnet-attribute --subnet-id "$SUBNET_ID" --map-public-ip-on-launch

# Create Route Table and Associate Subnet
RT_ID=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" --query 'RouteTables[0].RouteTableId' --output text)
ASSOCIATION_ID=$(aws ec2 associate-route-table --route-table-id "$RT_ID" --subnet-id "$SUBNET_ID" --query 'AssociationId' --output text)

# Create Route to Internet Gateway
aws ec2 create-route --route-table-id "$RT_ID" --destination-cidr-block 0.0.0.0/0 --gateway-id "$IGW_ID"

echo "VPC Creation Completed"
echo "./delete.sh $VPC_ID $IGW_ID $SUBNET_ID $ASSOCIATION_ID"
