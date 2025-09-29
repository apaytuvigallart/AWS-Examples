# Ingress vs Egress
- Ingress helps to control what traffic can enter the instance. For example, allow SSH from 203.0.113.0/24
- Egress helps to control what traffic the instance can send out. For example, allow all outbound

# Commands

## Create SG
```sh
aws ec2 create-security-group \
--group-name MySecurityGroup \
--description "My security group" \
--vpc-id vpc-059xx3b7
```

## Add rules
```sh
aws ec2 authorize-security-group-ingress \
--group-id sg-0fca8xxc4 \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0
```

## Associate EC2 Instance to Security Group
```sh
aws ec2 modify-instance-attribute \
--instance-id i-whatever \
--groups sg-0fca8xxc4
```

## Remove SC
```sh
aws ec2 delete-security-group \
--group-id sg-0fca8xxc4
```
