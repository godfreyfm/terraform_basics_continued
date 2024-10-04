import boto3
import schedule

ec2_client = boto3.client('ec2', region='us-east-1')

snapshots = ec2_client.describe_snapshots(
    owner='self'
)
print(snapshots['Snapshots'])