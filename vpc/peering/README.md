# Commands

## Create VPC Peering connection
```sh
aws ec2 create-vpc-peering-connection \
--vpc-id requester-vpc-id \
--peer-vpc-id accepter-vpc-id
```

## Accept VPC Peering connection
```sh
aws ec2 accept-vpc-peering-connection \
--vpc-peering-connection-id pcx-XXXXXXX
```

## Enable routing of traffic between the VPCs
```sh
aws ec2 create-route \
--route-table-id rtb-requester \
--destination-cidr-block accepter-vpc-cidr \
--vpc-peering-connection-id pcx-XXXXXXX

aws ec2 create-route \
--route-table-id rtb-accepter \
--destination-cidr-block requester-vpc-cidr\
--vpc-peering-connection-id pcx-XXXXXXX
```
