import boto3
import schedule

ec2_client = boto3.client('ec2', region_name="us-east-1")

# ec2_resource = boto3.resource('ec2', region_name="us-east-1")

# reservations = ec2_client.describe_instances()

# for reservation in reservations['Reservations']:
#     instances = reservation['Instances']
#     for instance in instances:
#         print(f"Instance {instance['InstanceId']} is {instance['State']['Name']}")


def check_instance_schedule():
  statuses = ec2_client.describe_instance_status(
     IncludeAllInstances=True # If left out, the default behavior is to exclude.
  )
  for status in statuses['InstanceStatuses']:
      ins_status = status['InstanceStatus']['Status']
      ins_state = status['InstanceState']['Name']
      sys_status = status['SystemStatus']['Status']
      print(f"Instance {status['InstanceId']}: state is {ins_state}, status is {ins_status}, and system status is {sys_status}")
  print("####################################################\n")

# Introducing a schedular for the function above.
schedule.every(5).seconds.do(check_instance_schedule)

while True:
   schedule.run_pending()