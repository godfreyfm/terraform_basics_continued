import boto3
import schedule

# Documentation: https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2/client/describe_volumes.html
def create_volume_snapshots():
  ec2_client = boto3.client('ec2', region_name="us-east-1")
  volumes = ec2_client.describe_volumes(
    Filters=[
        {
            'Name': 'tag',
            'Values': [
                'prod','staging']
        },
    ]
  )
  print(volumes['Volumes'])
  for volume in volumes['Volumes']:
    new_snapshot = ec2_client.create_snapshot(
      volumeId=volume['VolumeId']
    )
    print(new_snapshot)

# Introducing a schedular for the function above.
schedule.every().day.do(create_volume_snapshots)

while True:
   schedule.run_pending()