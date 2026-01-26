#!/usr/bin/env bash

read -p 'Input parent stack: ' STACK_NAME 
APP_STACK_NAME=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[].Outputs[?OutputKey==`ApplicationStackName`].OutputValue' --output text)
echo "Application stack is $APP_STACK_NAME"
