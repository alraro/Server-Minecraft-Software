#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Uso: $0 <nombre_imagen> <tag>" >&2
  
  exit 1
fi

sudo chown -R 1000:1000 server_pack
sudo docker buildx build --platform linux/amd64,linux/arm64 -t alraro/$1:$2 --push .
