# Info

You can access EC2 metadata information from the Metadata Service (MDS) via a special endpoint. The endpoint address:
- `IPv4`: `http://169.254.169.254/latest/meta-data/`
- `IPv6`: `http://[fd00:ec2::254]/latest/meta-data/`

There are two versions of Metadata Service
- **Instance Metadata Service Version 1 (IMDSv1)**: request/response method
- **Instance Metadata Service Version 2 (IMDSv2)**: session-oriented method

Instance Metadata categories [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html#instancedata-data-categories).

# Commands

## IMDSv1
```sh
curl http://169.254.169.254/latest/meta-data
```

## IMDSv2
```sh
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data
```
