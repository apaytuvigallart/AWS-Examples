## Create bucket
```sh
aws s3 mb s3://metadata-bucket-aleix-123
```

## Create new file
```sh
echo "Hello World" > hello.txt
```

## Upload file with metadata
```sh
aws s3api put-object --bucket metadata-bucket-aleix-123 --key hello.txt --body hello.txt --content-type plain/text --metadata key_1=value_1,key_2=value_2
```

> Note that the metadata keys don't start with `x-amz-meta-` when we create them

## Get Metadata through head object
```sh
aws s3api head-object --bucket metadata-bucket-aleix-123 --key hello.txt
```

> The output would be something like
> "Metadata": {
>   "key_1": "value_1",
>   "key_2": "value_2"
> }
> If we check the metadata in the UI, the keys start with `x-amz-meta-`
