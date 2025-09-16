# Commands

## Create Bucket
```sh
aws s3api create-bucket --bucket my-example-bucket-abc1 --region us-east-1
```

## List Buckets
```sh
aws s3api list-buckets --query "Buckets[].Name"
```

## Upload a single Object
```sh
aws s3 cp test.txt s3://my-example-bucket-abc1
```

## Upload multiple Objects to specific folder using sync
```sh
aws s3 sync test/ s3://my-example-bucket-abc1/test
```

## Download a single Object
```sh
aws s3 cp s3://my-example-bucket-abc1/test/another.txt .
```

## Download multiple Objects
```sh
aws s3 sync s3://my-example-bucket-abc1/test/ ./test
```

## List Objects
```sh
aws s3api list-objects --bucket my-example-bucket-abc1 --query "Contents[].Key"
```

## Delete Object
```sh
aws s3 rm s3://my-example-bucket-abc1/test.txt
```

## Delete all Objects in a Bucket recursively
```sh
aws s3 rm s3://my-example-bucket-abc1/ --recursive
```

## Delete empty Bucket
```sh
aws s3api delete-bucket --bucket my-example-bucket-abc1
```

## Get Object Metadata
```sh
aws s3api head-object --bucket my-example-bucket-abc1 --key file.txt
```

## Enable Versioning on a Bucket
```sh
aws s3api put-bucket-versioning --bucket my-example-bucket-abc1 --versioning-configuration Status=Enabled
```
