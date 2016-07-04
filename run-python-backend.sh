#!/usr/bin/env bash

source /etc/profile

ENV_PATH="/home/vagrant/.virtualenvs/python-backend"

echo "Setting up virtualenv"
if [[ ! -f "$ENV_PATH" ]]; then
    mkdir -p "$ENV_PATH"
    virtualenv "$ENV_PATH"
fi

source "$ENV_PATH/bin/activate"
pip install -r /src/python-backend/requirements.txt

echo "Starting python backend"
cd /src/python-backend
# Give away PID so signals get passed to the right process
exec python backend.py
