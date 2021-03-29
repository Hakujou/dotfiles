#!/bin/bash

rsync --exclude '.git' --exclude `basename $0` -ravI . ~/

if [[ "$OSTYPE" == "darwin"* ]]; then
	launchctl disable user/$UID/com.openssh.ssh-agent
	launchctl load -w ~/Library/LaunchAgents/com.zerowidth.launched.ssh_agent.plist
fi
