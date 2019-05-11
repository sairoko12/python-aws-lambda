FROM lambci/lambda:build-python3.7

# Your env vars
# AWS settings is optional for deploy
ENV AWS_REGION your_aws_region
ENV AWS_ACCESS_KEY_ID your_aws_key_id
ENV AWS_SECRET_ACCESS_KEY your_aws_secret_key
# optional on aws settings
ENV AWS_SESSION_TOKEN your_aws_session_token

# On your root lambda code
# You can customize the ignored files on .dockerignore
COPY . .

RUN pip install -r requirements.txt --target .

# Assumes you have a .lambdaignore file with a list of files you don't want in your zip
RUN cat .lambdaignore | xargs zip -9qyr lambda.zip . -x
