# Commands

## Create bucket
```sh
aws s3 mb s3://my-encrypted-bucket-apg-123
```
> Server-side encryption with Amazon S3 managed keys (SSE-S3) is set by default if we don't specify a different one. Same thing happens when you upload a file.

## Create a file and copy it to my bucket - SSE-S3
```sh
echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://my-encrypted-bucket-apg-123
```

## Create a file and copy it to my bucket - SSE-KMS
You can use `aws s3`

```sh
echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://my-encrypted-bucket-apg-123 --sse aws:kms --sse-kms-key-id xxx-22-sss-444-4122
```

Or `aws s3api`
```sh
echo "Hello world" > hello.txt
aws s3api put-object --bucket my-encrypted-bucket-apg-123 --key hello.txt --body hello.txt --server-side-encryption aws:kms --ssekms-key-id 46ebbaf9-49a3-4c32-8dc3-f038ca1d08b2
```

## Create a file and copy it to my bucket - SSE-C
```sh
echo "Hello world" > hello.txt
openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://my-encrypted-bucket-apg-123 --sse-c AES256 --sse-c-key fileb://ssec.key
aws s3 cp s3://my-encrypted-bucket-apg-123/hello.txt hello-downloaded.txt --sse-c AES256 --sse-c-key fileb://ssec.key
```

Note that, if you try to download the file without specifying `--sse-c` and `--sse-c-key`, you'll get `fatal error: An error occurred (400) when calling the HeadObject operation: Bad Request`.
