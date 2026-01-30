#!/usr/bin/env bash

STACK_TYPE='fdn'

if [[ -z $STACK_NAME ]]; then
	echo "No stackname provided"
	exit 1
fi

STACK_NAME+="-$STACK_TYPE"

rain deploy foundation.yml -y "$STACK_NAME"
