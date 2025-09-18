# Commands

## Create bucket and folder
```sh
aws s3 mb s3://splitting-apg-123
mkdir splitted
```

## Create a file and then, split the file. Add the file type
```sh
split -b 10000000B -d huge_file.txt ./splitted/split_lorem_
for file in ./splitted/split_lorem_*; do
    mv "$file" "$file.txt";
done
```

## Create a multipart upload
```sh
aws s3api create-multipart-upload --bucket splitting-apg-123 --key "huge_file.txt"
```

## Upload parts
```sh
i=1
for file in ./splitted/split_lorem_*; do
    aws s3api upload-part \
        --bucket splitting-apg-123 \
        --key "huge_file.txt" \
        --part-number $i \
        --body $file \
        --upload-id "ZWwXXXBojRc"
    i=$((i + 1))
done
```

## Create multipart-upload JSON file with the correct structure
See examples [here](https://docs.aws.amazon.com/cli/latest/reference/s3api/complete-multipart-upload.html#examples).

## Complete multipart upload
```sh
aws s3api complete-multipart-upload \
    --multipart-upload file://multipart-upload.json \
    --bucket splitting-apg-123 \
    --key "huge_file.txt" \
    --upload-id "ZWwXXXBojRc"
```
