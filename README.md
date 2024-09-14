
## SSH Key Pair Setup

Follow these steps to generate a public/private SSH key pair and use it within your Terraform configuration to access your EC2 instance.

### Step 1: Generate an SSH Key Pair

1. Open your terminal.
2. Run the following command, replacing `"your_email@example.com"` with your email:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
When prompted, save the key pair to the default location (~/.ssh/id_rsa), or specify a custom path.
Optionally, set a passphrase for added security, or press Enter to skip.
Step 2: Use the Public Key in Terraform
Locate your public key, typically saved as ~/.ssh/id_rsa.pub.

In your Terraform configuration, reference the public key file like this:

hcl

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
This setup allows Terraform to deploy EC2 instances with your SSH key pair, enabling secure login.

Step 3: Access Your EC2 Instance
Once your instance is deployed, connect to it using SSH:

bash

ssh -i ~/.ssh/id_rsa ec2-user@<EC2_INSTANCE_PUBLIC_IP>
Replace <EC2_INSTANCE_PUBLIC_IP> with the actual public IP address of your EC2 instance. Note also that because this is the default location, you can ssh without pointing to the priv key explicitly


# An alternate Approach
Note that you could still use the approach of creating the key in aws and then using it in your code. Defeats the goalm for IAC though. Just make sure to save the public key in .ssh as it is safer there and chmod 400 the file