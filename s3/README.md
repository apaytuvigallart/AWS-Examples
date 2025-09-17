# Documentation
- [AWS CLI s3api](https://docs.aws.amazon.com/cli/latest/reference/s3api/)
- [AWS CLI s3](https://docs.aws.amazon.com/cli/latest/reference/s3/)
- [AWS SDK for Python](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html)
- [AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/AWS_S3.html)
- [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
- [S3 Actions](https://docs.aws.amazon.com/AmazonS3/latest/API/API_Operations_Amazon_Simple_Storage_Service.html)
- [Data encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingEncryption.html)

# Storage classes
<img width="1209" height="710" alt="image" src="https://github.com/user-attachments/assets/bdcf2b8e-d628-4ef1-9b97-41eed2818d5f" />

# Encryption comparison
Long explanation [here](https://repost.aws/questions/QUk2ruoTTVQAO5Db9B5rmmQw/what-are-the-use-cases-for-different-s3-encryption-options).

| Encryption Method | Use Case | Security Protection |
|-------------------|----------|---------------------|
| **[SSE-S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/specifying-s3-encryption.html) (Server-Side Encryption with Amazon S3-Managed Keys)** | Simple and integrated method where AWS manages encryption keys. Best for users who want encryption at rest but do not need control over keys. | Protects against unauthorized access to physical storage media (e.g., stolen or removed disks remain encrypted). |
| **[SSE-KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/specifying-kms-encryption.html) (Server-Side Encryption with AWS Key Management Service, Managed Keys)** | Adds security with AWS KMS: key rotation, centralized management, detailed access control. Best for users needing fine-grained control and auditing. | Protects against physical theft and unauthorized access within AWS. Key usage is logged, controlled, and auditable. |
| **[SSE-C](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html#specifying-s3-c-encryption) (Server-Side Encryption with Customer-Provided Keys)** | For users who want full control of their encryption keys while using AWS for storage. Customer provides keys with each HTTP request. | Protects against physical and insider threats. AWS does not store or manage keys, reducing risks from AWS staff. |
| **[DSSE-KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/specifying-dsse-encryption.html) (Dual-Layer Server-Side Encryption with AWS KMS Keys)** | For workloads with highly sensitive data requiring two independent layers of encryption. Both layers use different KMS keys for maximum protection. | Provides defense-in-depth: even if one encryption layer is compromised, the second layer remains secure. Meets stricter compliance/regulatory requirements. |
| **[CSE-KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingClientSideEncryption.html) (Client-Side Encryption with AWS KMS Managed Keys)** | For users needing complete control over encryption, performed client-side before uploading to S3. Uses AWS KMS for key management. | Protects against both internal and external threats. Ensures data is encrypted before AWS sees it. Provides highest level of control. |

- **SSE-S3**: Easiest to use, AWS-managed keys.  
- **SSE-KMS**: More security with key management and auditing.  
- **SSE-C**: Customer-managed keys, AWS doesn’t handle them.
- **DSSE-KMS**: Dual KMS-managed encryption layers, best for highly sensitive/compliance-driven data.  
- **CSE-KMS**: Full client-side control, strongest protection.  
