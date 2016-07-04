#!/usr/bin/env bash

source /etc/profile

export GOPATH="/src/gopath"

echo "Updating pusud"
go get -u github.com/PuSuEngine/pusud

echo "Copying settings"
cp /src/settings.yaml "$GOPATH/bin/settings.yaml"

echo "Starting pusud"
cd /src/gopath/bin

# Give away PID so when this script is killed pusud dies
exec ./pusud
