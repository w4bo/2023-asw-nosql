#!/bin/bash
set -exo

. ./build.sh

if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

. ./download.sh
. ./stop.sh

docker-compose up --build -d --remove-orphans
./wait-for-it.sh ${MONGO_URL}:${MONGO_PORT} --strict --timeout=10 -- echo "MongoDB is up"
sleep 20
npm test -- --detectOpenHandles
