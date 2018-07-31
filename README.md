## This Terraform repo is used to create a EC2 instance. Following resources are created:
 - TF state in this repo is saved in S3
 - VPC with one Public and Private Subnets
 - An Internet Gateway for internet traffic
 - Security group attached to the EC2 instance that allows (ingress) ssh traffic on port 22 and all other extrenal traffic (egress) thru Internet gateway
 - Route table in the VPC attached to the public subnet.
 - Keypair resource to ssh into the EC2 instance.
 - Note: If you want additional public and private subnets, you can do so by uncommenting TF stanzas in vpc.tf

## Steps to execute
 - First exec `terraform init -backend-config=./backendConfigs/dev`
    This command with initialize TF and sets up the S3 backed to save the TF state. **MAKE SURE** to supply access keys in ./backendConfigs/dev file
 - Then execute `terraform plan`
 - Then execute `terraform apply` if plan output is satisfactory
 - To SSH into the running EC2 instance do the following
    - Pick the public DNS OR IP address of the EC2 instance from the AWS EC2 console
    - Exec the following command
      `ssh -i <PATH TO YOUR PEM FILE> ec2-user@<PUBLIC IP ADDRESS OF THE EC2 INSTANCE>`

# TO create Public/Private key pair for EC2 instance, use ssh-keygen tool
`ssh-keygen -f mykey`

# TO create Public key from an EXISTING private key
`ssh-keygen -f ~/.ssh/mypersonal_keypair.pem -y > ~/.ssh/mypersonal_keypair.pub`