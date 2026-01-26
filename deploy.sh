#!/bin/bash

# Create necessary Docker networks
docker network create proxy_net || true
docker network create minecraft-net || true

# Start the proxy service
docker compose -f core/proxy/docker-compose.yml up -d

# Start the monitoring service
docker compose -f core/monitoring/docker-compose.yml up -d

# Start the Homer dashboard service
docker compose -f apps/homer/docker-compose.yml up -d

# Start the Wetty service
docker compose -f apps/wetty/docker-compose.yml up -d

# Start the Minecraft server service
docker compose -f apps/minecraft/docker-compose.yml up -d
