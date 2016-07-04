#!/usr/bin/env bash

source /etc/profile
export GOPATH="/src/gopath"

echo "Updating dependencies"
go get -u github.com/PuSuEngine/gopusu

echo "Starting go backend"
cd /src/go-backend

go build backend.go
# Give away PID so when this script is killed pusud dies
exec ./backend
