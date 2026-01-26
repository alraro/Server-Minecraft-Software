#!/bin/bash

sudo docker compose down -f ../docker-compose.yml
sudo docker compose up -d -f ../docker-compose.yml
