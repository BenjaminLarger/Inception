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
	@docker compose -f ./srcs/docker-compose.yml up -d --build
restart:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml up -d --build
build:
	@echo -e "${YELLOW}⏳ building...${THIS_FILE} {NC}"
	docker-compose -f srcs/docker-compose.yml build $(c)
	@echo "${BLUE_BOLD}🛠️ $(THIS_FILE) Built successful! 🛠️${BLUE_BOLD}"
up:
	@echo -e "${YELLOW}⏳ starting up...${THIS_FILE} {NC}"
	docker-compose -f srcs/docker-compose.yml up -d $(c)
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"

down:
	@echo -e "${YELLOW}⏳ shutting down...${THIS_FILE} {NC}"
	docker-compose -f srcs/docker-compose.yml down $(c)
	@echo "${BLUE_BOLD}🧹 $(THIS_FILE) Shut down successfully! 🧹${BLUE_BOLD}"
logs:
	docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)
	@echo "${BLUE_BOLD}⚙️ $(THIS_FILE) Logs fetched successfully! ⚙️${BLUE_BOLD}"
ps:
	@echo "🔍 List of the Docker containers: 🔍"
	docker ps
mariadb:
	@echo -e "${YELLOW}⏳ starting mariadb...${THIS_FILE} {NC}"
	docker exec -it mariadb /bin/bash
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
wordpress:
	@echo -e "${YELLOW}⏳ starting wordpress, $(c)...${THIS_FILE} {NC} "
	docker exec -it wordpress /bin/bash
	@(cd srcs && docker-compose run --rm wordpress /bin/bash)
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
nginx:
	@echo -e "${YELLOW}⏳ starting nginx...${THIS_FILE} {NC} "
	docker exec -it nginx /bin/bash
#	@(cd srcs && docker-compose run --rm nginx /bin/bash)
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD} {NC}"
