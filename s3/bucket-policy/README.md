# Create bucket
```sh
aws s3 mb s3://my-bucket-policy-bucket-apg
```

## Add bucket-policy
```sh
aws s3api put-bucket-policy --bucket my-bucket-policy-bucket-apg --policy file://policy.json
```
> This example allows the user `somebody` from the AWS account `1234567890` to do the following in the s3 bucket `my-bucket-policy-bucket-apg` and its resources:
> - `ListBucket`: Grants permission to list some or all of the objects in an Amazon S3 bucket (up to 1000).
> - `GetObject`: Grants permission to retrieve objects from Amazon S3.
> - `PutObject`: Grants permission to add an object to a bucket
