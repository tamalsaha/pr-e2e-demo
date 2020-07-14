#!/bin/bash

url="/repos/$GITHUB_REPOSITORY/pulls/$PR_NUMBER/reviews"

result=$(hub api $url | jq --raw-output '[.[].state] | contains(["APPROVED"])')

if [ $result == "false" ]; then
	exit 1;
fi
