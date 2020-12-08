#!/bin/bash
set -ex
#MAILCATCHER
source ~/env/mailcatcher.env
export DOMAIN
export USERNAME
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)

# Do the job
docker network create --attachable --driver=overlay mailcatcher || true
docker stack deploy \
	--prune \
	-c mailcatcher.yml \
	mailcatcher
