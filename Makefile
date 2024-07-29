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

all : up
build:
	@echo -e "${YELLOW}⏳ building...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml build $(c)
	@echo -e "${ERASE_LINE}Building in progress..."
	@echo "${BLUE_BOLD}🛠️ $(THIS_FILE) Built successful! 🛠️${BLUE_BOLD}"
up:
	@echo -e "${YELLOW}⏳ starting up...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml up -d $(c)
	@echo -e "${ERASE_LINE}Starting up in progress..."
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started up successfully! 🐳 ${BLUE_BOLD}"
start:
	@echo -e "${YELLOW}⏳ starting...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml start $(c)
	@echo -e "${ERASE_LINE}Starting in progress..."
	@echo "${BLUE_BOLD}🐳  $(THIS_FILE) Started successfully! 🐳 ${BLUE_BOLD}"
down:
	@echo -e "${YELLOW}⏳ shutting down...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml down $(c)
	@echo -e "${ERASE_LINE}Shutting down in progress..."
	@echo "${BLUE_BOLD}🧹 $(THIS_FILE) Shut down successfully! 🧹${BLUE_BOLD}"
stop:
	@echo -e "${YELLOW}⏳ stopping...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml stop $(c)
	@echo -e "${ERASE_LINE}Stopping in progress..."
	@echo "${BLUE_BOLD}🛑 $(THIS_FILE) Stopped successfully! 🛑${BLUE_BOLD}"
restart:
	@echo -e "${YELLOW}⏳ restarting...${THIS_FILE}"
	docker-compose -f srcs/docker-compose.yml stop $(c)
	@echo -e "${ERASE_LINE}Restarting in progress..."
	docker-compose -f srcs/docker-compose.yml up -d $(c)
	@echo "${BLUE_BOLD}🔄 $(THIS_FILE) Restarted successfully! 🔄${BLUE_BOLD}"
logs:
	docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)
	@echo -e "${ERASE_LINE}Fetching logs in progress..."
	@echo "${BLUE_BOLD}⚙️ $(THIS_FILE) Logs fetched successfully! ⚙️${BLUE_BOLD}"
ps:
	@echo "🔍 List of the Docker containers: 🔍"
	docker ps