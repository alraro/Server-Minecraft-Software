#!/bin/bash

/home/alraro/Server-Minecraft-Software/scripts/check_prohibited.sh | awk -F '/' '{print $6}' | \
while IFS= read -r line; do
    packwiz remove "$line"
done
