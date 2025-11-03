#!/bin/bash

sudo docker compose logs | \
grep "Please go to" | \
awk -F ' ' '{print $6} ' | \
awk '!seen[$0]++'
