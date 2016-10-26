#!/bin/bash

echo "Reloading Jenkins Connections..."

curl -s http://159.203.196.76:8080/computer/api/json | /usr/local/bin/jq -r '.computer[] | select(.offline) | .displayName' | xargs -n 1 -I {} bash -c "echo {}; source /Users/brunovolpato/shared/.functions; jenkinsnoderestart {}"
