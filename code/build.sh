#!/bin/bash
set -exo
if [ ! -f ".env" ]; then
    cp .env.example .env
else
    echo ".env exists"
fi
npm install
