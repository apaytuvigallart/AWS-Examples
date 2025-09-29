# Commands

## Allocate an Elastic IP
```sh
aws ec2 allocate-address --domain vpc
```
Use the `--network-border-group` option to select specific Availability Zones, Local Zones, or Wavelength Zones.


## Associate it to an EC2 instance
```sh
aws ec2 associate-address \
--instance-id i-1234567890abcdef0 \
--allocation-id eipalloc-123asd
```

If the instance has more than one network interface, you must specify a network interface ID by using the option `--network-interface-id`. [Note](https://docs.aws.amazon.com/cli/latest/reference/ec2/associate-address.html#:~:text=is%20UnauthorizedOperation%20.-,%2D%2Dnetwork%2Dinterface%2Did,-(string)) that you can either specify `--instance-id` or `--network-interface-id`.

## Disassociate it from an EC2 instance
```sh
aws ec2 disassociate-address \
--association-id eipalloc-123asd
```

## Deallocate (release) an Elastic IP
```sh
aws ec2 release-address \
--allocation-id eipalloc-123asd
```

## Associate and always attempt to reassociate it to the same EC2 instance
```sh
aws ec2 associate-address \
--instance-id i-1234567890abcdef0 \
--allocation-id eipalloc-123asd \
--allow-reassociation
```

## Recover an address
```sh
aws ec2 allocate-address \
--domain vpc \
--address "54.228.5.3"
```

## Use `Bring-Your-Own (BYO)` IPv4 pool
```sh
aws ec2 allocate-address \
--domain vpc \
--public-ipv4-pool ipv4pool-ec2-1234567890
```
