#!/bin/bash

# Stop the proxy service
docker compose -f core/proxy/docker-compose.yml down

# Stop the monitoring service
docker compose -f core/monitoring/docker-compose.yml down

# Stop the Homer dashboard service
docker compose -f apps/homer/docker-compose.yml down

# Stop the Wetty service
docker compose -f apps/wetty/docker-compose.yml down

# Stop the Minecraft server service
docker compose -f apps/minecraft/docker-compose.yml down



