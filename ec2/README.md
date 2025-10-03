# Documentation
- [Cloud-Init](https://cloud-init.io/)
- [Cloud-Init upgrade, update and install packages](https://cloudinit.readthedocs.io/en/latest/reference/yaml_examples/package_update_upgrade.html)
- [EC2 UserData](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
- [AWS CLI ec2](https://docs.aws.amazon.com/cli/latest/reference/ec2/)
- [EC2 Metadata Categories](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html#instancedata-data-categories)
- [Access Instance Metadata for EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
- [Use Instance Metadata Service to access Instance Metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html)
- [EC2 Instance Type Naming Conventions](https://docs.aws.amazon.com/ec2/latest/instancetypes/instance-type-names.html)
- [AWS CLI ec2 get-console-screenshot](https://docs.aws.amazon.com/cli/latest/reference/ec2/get-console-screenshot.html)
- [Default Users](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/managing-users.html#ami-default-user-names)

# Instance Types
Amazon EC2 provides a variety of instance types so we can choose the type that best meets your requirements. Instance types are named based on their instance family and instance size. 
- The first position of the instance family indicates the series, for example `c`. 
- The second position indicates the generation, for example `7`. 
- The third position indicates the options, for example `gn`. After the period (`.`) is the instance size, such as `small` or `4xlarge`, or `metal` for bare metal instances.

<img width="1592" height="864" alt="image" src="https://github.com/user-attachments/assets/fee1cdd6-4977-41f9-9610-5f1cf9f7cad6" />

# Default Users
Each Linux instance launches with a default Linux system user. You can add users to your instance and delete users. The default user is determined by the AMI that was specified when you launched the instance.

| AMI | Default User |
| --- | ------------ |
| Amazon Linux | `ec2-user` |
| CentOS | `centos` or `ec2-user` |
| Debian | `admin` |
| Fedora | `fedora` or `ec2-user` |
| FreeBSD | `ec2-user` |
| RHEL | `root` or `ec2-user` |
| SUSE | `root` or `ec2-user` |
| Ubuntu | `ubuntu` |
| Oracle | `ec2-user` |
| Bitnami | `bitnami` |

# Pricing Models

| Pricing Model | Explanation | When to Use | Example |
| ------------- | ----------- | ----------- | ------- |
| **On-Demand Instances** | Pay per second/minute for compute capacity with no upfront commitment. | Best for short-term, unpredictable workloads or testing. | Running a dev/test environment or handling sudden traffic spikes. |
| **Reserved Instances (RI)** | Commit to a 1-year or 3-year term for significant savings (up to ~75%) compared to On-Demand. Options: Standard RI, Convertible RI, Scheduled RI. | Steady-state workloads with predictable usage. | Running production web servers continuously. |
| **Savings Plans** | Flexible alternative to RIs — commit to a consistent spend ($/hour) for 1 or 3 years in exchange for savings, across instance families, regions, or even Fargate/Lambda. | When you want cost savings but with flexibility in instance type/region. | Committing to $500/month of compute usage while workloads evolve. |
| **Spot Instances** | Bid for unused EC2 capacity at discounts up to 90%, but instances can be interrupted with short notice. | For fault-tolerant, flexible, or stateless workloads. | Big data analytics, rendering jobs, CI/CD pipelines. |
| **Dedicated Hosts / Instances** | Physical servers dedicated to a single customer, with visibility/control over sockets/cores. Often needed for licensing or compliance. | When you must use per-socket/per-core software licenses (e.g., Oracle, Windows Server) or meet strict compliance. | Running a database that requires license compliance or isolation. |
