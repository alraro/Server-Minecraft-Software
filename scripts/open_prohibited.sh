#!/bin/bash

/home/alraro/Server-Minecraft-Software/scripts/check_prohibited.sh | sed 's:/files/:/download/:g' | \
while IFS= read -r line; do
    echo "Abriendo URL modificada: $line"
    firefox "$line"
done
