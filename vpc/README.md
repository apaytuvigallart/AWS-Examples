# Documentation
- [AWS CLI ec2](https://docs.aws.amazon.com/cli/latest/reference/ec2/)
- [AWS CLI ec2 create-default-vpc](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-default-vpc.html)
- [AWS CLI ec2 create-network-acl](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-acl.html)
- [AWS CLI ec2 describe-network-acls](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-network-acls.html)
- [AWS CLI ec2 create-security-group](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-security-group.html)
- [AWS CLI ec2 allocate-address](https://docs.aws.amazon.com/cli/latest/reference/ec2/allocate-address.html)

# Stateful vs Stateless
## Stateful
Stateful network traffic handling is the default behavior of Security Groups in AWS VPC. A stateful Security Group allows inbound traffic for a specific rule and automatically allows the corresponding outbound traffic, regardless of whether an explicit outbound rule is defined.

The stateful nature of security groups means that once a connection is established, the return traffic is automatically allowed, simplifying the configuration and management of network rules. In a stateful security group, you only need to define the inbound rules to control traffic flow, and the outbound traffic is implicitly allowed.

## Stateless
Stateless network traffic handling is the default behavior of network ACLs in AWS VPC. A stateless network ACL requires explicit rules for both inbound and outbound traffic.

Each rule in a stateless network ACL controls either inbound or outbound traffic, and there is no automatic allowance of return traffic like in stateful security groups. With stateless network ACLs, you need to define both inbound and outbound rules to control the flow of traffic accurately.

## Key differences
| Type | Simplicity | Level | Evaluation | Example |
| ---- | ---------- | ----- | ---------- | ------- |
| Stateful | It allows return traffic automatically. | Instance level | It evaluates rules first and the most permissive one is applied | Security Groups |
| Stateless | It requires explicit rules for both inbound and outbound traffic | Subnet level | It processes rules in a sequential order based on a rule number, from lowest to highest | NACL |

In summary, stateful and stateless refer to the handling of network traffic in AWS VPC. Stateful security groups allow return traffic automatically, simplifying rule management, while stateless network ACLs require explicit rules for both inbound and outbound traffic. Understanding these concepts is essential for effectively securing and managing network traffic within your AWS VPC.
