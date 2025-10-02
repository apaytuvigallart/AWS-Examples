You can provide a script to EC2 UserData to have Cloud Init automatically run on first boot.

You can provide a bash script:

```sh
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<html><h1>Hello Cloud!</h1></html>" > /var/www/html/index.html
```

You can provide a cloud config YAML file:

```yaml
#cloud-config
package_upgrade: true
packages:
  - httpd
runcmd:
  - [ systemctl, start, httpd.service ]
  - [ systemclt, enable, httpd.service ]
  - [ sh, -c, "echo '<html><body><h1>Hello Cloud!</h1></body></html>' > /var/www/html/index.html" ]
```

Scripts must be `base64` when directly using the API, The AWS CLI and Console will automatically encode to `base64`.

Via the AWS CLI, you can pass a file:

```sh
aws ec2 run-instances \
--image-id ami-0abcdf1234567890 \
--count 1 \
--instance-type t2.micro \
--security-group-ids sg-1234567890abcdef0 \
--subnet-id subnet-12345678 \
--user-data file://path/to/your/userdata-script.sh
```

Or you can provide the script inline

```sh
aws ec2 run-instances \
--image-id ami-0abcdf1234567890 \
--count 1 \
--instance-type t2.micro \
--security-group-ids sg-1234567890abcdef0 \
--subnet-id subnet-12345678 \
--user-data '#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<html><h1>Hello Cloud!</h1></html>" > /var/www/html/index.html'
```

Using EC2 Metadata, you can get the script via `wget` or `curl` at the following `http://169.254.169.254/latest/user-data`
