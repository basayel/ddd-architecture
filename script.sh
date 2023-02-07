#!/bin/bash
cp docker/.env.example .env
sed  -i "/APP_USER_ID=/c\APP_USER_ID=$(id -u)" .env
docker network create components_structure_private_network

