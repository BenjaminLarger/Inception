# Color
GREEN=\033[0;32m
RED=\033[0;31m
YELLOW=\033[0;33m
BLUE=\033[0;34m
BLUE_BOLD=\033[1;34m
NC=\033[0m
# Move cursor up and clear line
ERASE_LINE=\033[A\033[K


THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up start down destroy stop restart logs logs-api ps login-timescale login-api db-shell

all:
	@docker compose -f ./srcs/docker-compose.yml up --build
restart:
	@docker compose -f ./srcs/docker-compose.yml down
	docker volume rm srcs_wordpress_data srcs_mariadb_data
	@docker compose -f ./srcs/docker-compose.yml up --build
down:
	@echo -e "${YELLOW}⏳ shutting down...${THIS_FILE} {NC}"
	docker-compose -f srcs/docker-compose.yml down $(c)
	@echo "${BLUE_BOLD}🧹 $(THIS_FILE) Shut down successfully! 🧹${BLUE_BOLD}"
ps:
	@echo "🔍 List of the Docker containers: 🔍"
	docker ps
mariadb:
	@echo -e "${YELLOW}⏳ enter into mariadb container...${THIS_FILE} {NC}"
	docker exec -it mariadb /bin/bash
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
wordpress:
	@echo -e "${YELLOW}⏳ enter into wordpress container... $(c)...${THIS_FILE} {NC} "
	docker exec -it wordpress /bin/bash
	@(cd srcs && docker-compose run --rm wordpress /bin/bash)
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
nginx:
	@echo -e "${YELLOW}⏳ enter into nginx container...${THIS_FILE} {NC} "
	docker exec -it nginx /bin/bash
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
rm_volumes:
	@echo -e "${RED}⏳ remove wordpress and mariadb volumes${THIS_FILE} {NC} "
	docker volume rm srcs_wordpress_data srcs_mariadb_data
