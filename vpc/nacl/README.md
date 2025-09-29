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
