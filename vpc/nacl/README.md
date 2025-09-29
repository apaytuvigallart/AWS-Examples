# Ingress vs Egress
- Ingress helps to control traffic coming into the subnet (from outside to subnet). For example, allow HTTp from 0.0.0.0/0 (allows external clients reach resources in the subnet).
- Egress helps to control traffic leaving the subnet (from subnet to outside). For example, allow HTTPS to 0.0.0.0/0 (allows instances in the subnet connect to the internet).

# Commands

## Create NACL
```sh
aws ec2 create-network-acl \
--vpc-id vpc-0fxxe
```

## Create entry
```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-00xx9 \
--ingress \
--rule-number 100 \
--protocol tcp \
--port-range From=80,To=80 \
--cidr-block 0.0.0.0/0 \
--rule-action allow
```

## List VPC associaton IDs
```sh
aws ec2 describe-network-acls --filters "Name=vpc-id, Values=vpc-0fxxe"
```

## Associate NACL to a Subnet
Note that a Subnet can only be associated to one NACL

```sh
aws ec2 replace-network-acl-association \
--association-id aclassoc-0c9xx04 \
--network-acl-id acl-00xx9
```
