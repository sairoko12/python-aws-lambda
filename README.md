# python-aws-lambda
Dockerfile for test and deploy your lambda code in a real aws linux environment

## Usage
First step build the docker image

```bash
# Execute on your root project
docker build -t my_fancy_aws_lambda .

# For test code options see the next link https://github.com/lambci/docker-lambda#run-examples
```

That's it all!

## Deploy code on aws
Need add your aws access on environments variables in the Dockerfile

```bash
# Execute on your root project
docker build -t my_fancy_aws_lambda .

# Once time on your container bash
aws --region us-east-2 lambda update-function-code --function-name my_fancy_aws_lambda --zip-file fileb://lambda.zip

# You can customize aws vpc options from container
aws --region aws-region lambda update-function-configuration --function-name my_fancy_aws_lambda --vpc-config SubnetIds=subnet-ID,subnet-ID,subnet-ID,SecurityGroupIds=sg-ID
```
