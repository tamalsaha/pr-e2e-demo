#!/bin/bash

url="/repos/$GITHUB_REPOSITORY/pulls/$PR_NUMBER/reviews"
pr_approved=$(hub api $url | jq --raw-output '[.[].state] | contains(["APPROVED"])')
[$pr_approved == "true"] || { echo "pr $PR_NUMBER is not approved!"; exit 1; }

if [ $result == "false" ]; then
	exit 1;
fi
