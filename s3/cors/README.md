# Commands for Website 1

## Create bucket
```sh
aws s3 mb s3://cors-apg-123
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-apg-123 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-apg-123 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-apg-123 --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-apg-123
```

## View the website and see if the index.html is there.
http://cors-apg-123.s3-website-eu-west-1.amazonaws.com/

# Commands for Website 2

## Create bucket
```sh
aws s3 mb s3://cors-apg-456
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-apg-456 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-apg-456 --policy file://bucket-policy-2.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-apg-456 --website-configuration file://website.json
```

## Upload javascript file
```sh
aws s3 cp hello.js s3://cors-apg-456
```

## Create API Gateway with mock response and then test the endpoint
1. Go to API Gateway and create a REST API.
2. Create a resource under the resource path `/`, say `hello`.
3. Create a new method.
    - Select `POST` as Method type.
    - Select `Mock` as Integration type.
4. Enable CORS for the `/hello` resource. Make sure you check the Method type `POST`.
5. Select the `POST` method under `/hello` and edit the `Mapping template` from `Integration response`. A simply `{"message": "Hello world"}` is enough.
6. Deploy API. Select a new stage, say `prod`.

```sh
curl -X POST -H "Content-Type: application/json" https://qu7h2awglk.execute-api.eu-west-1.amazonaws.com/prod/hello
```

## Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket cors-apg-123 --cors-configuration file://cors.json
```

## Make sure it works
- Open http://cors-apg-123.s3-website-eu-west-1.amazonaws.com/.
- Right click and `Inspect`.
- Check `Network` and make sure there isn't any CORS error.
- Check `Console` and make sure the mock is returned.

## Cleanup
Make sure to remove all the stuff.
