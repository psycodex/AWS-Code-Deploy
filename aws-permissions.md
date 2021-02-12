#Permissions


## Creating Deploy Service Role

aws iam create-role --role-name CodeDeployServiceRole --assume-role-policy-document file://CodeDeploy-Trust.json

### Attach deploy permissions
aws iam attach-role-policy --role-name CodeDeployServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole
aws iam attach-role-policy --role-name CodeDeployServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSCodeDeployRoleForLambdaLimited
aws iam attach-role-policy --role-name CodeDeployServiceRole --policy-arn arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS

### Confirm deploy permissions role
aws iam get-role --role-name CodeDeployServiceRole --query "Role.Arn" --output text


## Creating Ec2 Instance Role

aws iam create-role --role-name CodeDeploy-EC2-Instance-Profile --assume-role-policy-document file://CodeDeploy-EC2-Trust.json

### Put role policy to give the role permissions

aws iam put-role-policy --role-name CodeDeploy-EC2-Instance-Profile --policy-name CodeDeploy-EC2-Permissions --policy-document file://CodeDeploy-EC2-Permissions.json

### Attach role policy to give SSM permissions to update codedeploy agent.

aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore --role-name CodeDeploy-EC2-Instance-Profile

### Create instance profile 

aws iam create-instance-profile --instance-profile-name CodeDeploy-EC2-Instance-Profile
aws iam add-role-to-instance-profile --instance-profile-name CodeDeploy-EC2-Instance-Profile --role-name CodeDeploy-EC2-Instance-Profile