import boto3

def tag_ec2_instances(region_name, tag_key, tag_value):
    # Create an EC2 client
    ec2_client = boto3.client('ec2', region_name=region_name)

    # Describe EC2 instances
    try:
        response = ec2_client.describe_instances()
    except Exception as e:
        print(f"Error while describing instances: {e}")
        return

    # Collect all instance IDs
    instance_ids = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_ids.append(instance['InstanceId'])

    if not instance_ids:
        print("No EC2 instances found in this region.")
        return

    # Tag the instances
    try:
        ec2_client.create_tags(
            Resources=instance_ids,
            Tags=[
                {
                    'Key': tag_key,
                    'Value': tag_value
                }
            ]
        )
        print(f"Successfully added tag '{tag_key}: {tag_value}' to instances: {instance_ids}")

    except Exception as e:
        print(f"Error while tagging instances: {e}")

if __name__ == "__main__":
    # Define your AWS region and tag information
    region = 'us-east-1'  # Change this to your desired region
    key = 'Environment'    # Tag key
    value = 'Development'   # Tag value

    tag_ec2_instances(region, key, value)



    ### Note that this would only be relevant in a situation wherebyyou are working with existing instances that were not created with terraform. Else, it is better to go with terraform. Especially also as pyhton boto would not keep the state ###