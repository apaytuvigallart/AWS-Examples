# Commands

## Create NACL
```sh
aws ec2 create-network-acl \
--vpc-id vpc-0f2fef01ca7e6013e
```

## Create entry
```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-003552ddd688a26c9 \
--ingress \
--rule-number 100 \
--protocol tcp \
--port-range From=80,To=80 \
--cidr-block 0.0.0.0/0 \
--rule-action allow
```

## List VPC associaton IDs
```sh
aws ec2 describe-network-acls --filters "Name=vpc-id, Values=vpc-0f2fef01ca7e6013e"
```

## Associate NACL to a Subnet
```sh
aws ec2 replace-network-acl-association \
--association-id aclassoc-0c9cb5ab0c9ca9104 \
--network-acl-id acl-003552ddd688a26c9
```

> Note that a Subnet can only be associated to one NACL
