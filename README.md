# cloudwatch-agent-ssm

TODO : 
- Prerequisites
- Screenshots (console)
- Steps

- (Terraform)

## Prerequisites

1. Your EC2 instance has an IAM Role with policies `AmazonSSMManagedInstanceCore` and `CloudWatchAgentServerPolicy` attached

2. Install SSM Agent on the EC2 instance
```
sudo yum install -y https://s3.eu-west-3.amazonaws.com/amazon-ssm-eu-west-3/latest/linux_amd64/amazon-ssm-agent.rpm`
sudo systemctl start amazon-ssm-agent
```

3. Setup SSM
4. SSM -> Fleet Manager -> Distributor -> AmazonCloudWatchAgent
5. enable && start amazon-cloudwatch-agent

6. CloudWatch -> dashboard -> create dashboard -> ec2 widget

## Sample CloudWatch agent configuration file

```json
{
    "agent": {
        "run_as_user": "cwagent"
    },
    "metrics": {
        "append_dimensions": {
            "AutoScalingGroupName": "${aws:AutoScalingGroupName}",
            "ImageId": "${aws:ImageId}",
            "InstanceId": "${aws:InstanceId}",
            "InstanceType": "${aws:InstanceType}"
        },
        "metrics_collected": {
            "cpu": {
                "measurement": [
                    "cpu_usage_idle",
                    "cpu_usage_iowait",
                    "cpu_usage_user",
                    "cpu_usage_system"
                ],
                "metrics_collection_interval": 60,
                "totalcpu": true
            },
            "disk": {
                "measurement": [
                    "used_percent"
                ],
                "metrics_collection_interval": 60,
                "resources": [
                    "*"
                ]
            },
            "diskio": {
                "measurement": [
                    "io_time"
                ],
                "metrics_collection_interval": 60,
                "resources": [
                    "*"
                ]
            },
            "mem": {
                "measurement": [
                    "mem_used_percent"
                ],
                "metrics_collection_interval": 60
            },
            "net": {
                "measurement": [
                    "bytes_sent",
                    "bytes_recv",
                    "packets_sent",
                    "packets_recv"
                ],
                "metrics_collection_interval": 60
            },
            "swap": {
                "measurement": [
                    "swap_used_percent"
                ],
                "metrics_collection_interval": 60
            }
        }
    }
}
```
TODO : Cleanup

![placeholder image](images/placeholder.jpg)
