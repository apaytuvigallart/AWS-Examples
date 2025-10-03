# Actions
| Action | Explanation |
| ------ | ----------- |
| `LAUNCH` | Create and start and EC2 instance based on AMI. |
| `STOP` | Turn off but not delete the current EC2 instance. |
| `START` | Turn back on a previously stopped EC2 instance. |
| `TERMINATE` | Delete the EC2 instance. |
| `REBOOT` | Performs a Soft reboot. |
| `RETIRE` | Notifies when an instance is scheduled for retirement due to hardware failure or end of life; it must be replaced or migrated. |
| `RECOVER` | Automatically recovers a failed instance on new hardware if enabled, keeping the instance ID and other configurations. |

# States
| State | Explanation |
| ----- | ----------- |
| `PENDING` | The instance is preparing to enter the running state. An instance enters the pending state when it is launched or when it is started after being in the stopped state. |
| `RUNNING` | The instance is running and ready for use. |
| `STOPPING` | The instance is preparing to be stopped. |
| `STOPPED` | The instance is shut down and cannot be used. The instance can be started at any time. |
| `SHUTTING-DOWN` | The instance is preparing to be terminated. |
| `TERMINATED` | The instance has been permanently deleted and cannot be started. |

# Commands

## Change Termination Protection
Prevent the instance from being terminated (Default is off)

```sh
aws ec2 modify-instance-attribute \
--instance-id i-1234567890abcdef0 \
--disable-api-termination
```

## Change Stop Protection
Prevent the instance from being stopped (Default is off)

```sh
aws ec2 modify-instance-attribute \
--instance-id i-1234567890abcdef0 \
--disable-api-stop
```

## Shutdown Behavior
What should happen if the instance is shut down to either Stop or Terminate (Default is Stop)

```sh
aws ec2 modify-instance-attribute \
--instance-id i-1234567890abcdef0 \
--instance-initiated-shutdown-behavior terminate
```

## Auto-Recovery Behavior
Whether to automatically recover an instance when a system status check failure occurs (Default is enabled)

```sh
aws ec2 modify-instance-maintenance-options \
--instance-id i-0abcdef1234567890 \
--auto-recovery disabled
```
