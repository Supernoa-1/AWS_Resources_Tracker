#!/bin/bash

#####################################
# Author - Mihir
# Date - 03-02-2026

# Version - V1

# This script will report the aws usage.
#
####################################

# Included Resouces:
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM User

# AWS S3: list buckets
echo "S3 Bucket Data:"
aws s3api list-buckets --query "Buckets[].{BucketName:Name,CreatedOn:CreationDate}" --output table

# AWS EC2: list intances
echo "Instances Data:"
aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[].Instances[].{Name: Tags[?Key=='Name']|[0].Value, OS: PlatformDetails, PublicIP: PublicIpAddress}" --output table

# AWS Lambda - list functions
echo "Functions Data:"
aws lambda list-functions

# AWS IAM: list users
echo "Users Data:"
aws iam list-users
