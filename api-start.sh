#!/bin/bash

# MyFit API Starter com Log Monitor
# Inicia a API e monitora os logs

API_DIR="/Users/marcelpiva/Projects/myfit/myfit-api"
LOG_FILE="/tmp/myfit-api.log"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

echo -e "${BOLD}${CYAN}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    MyFit API Starter                             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Matar processo anterior
echo -e "${YELLOW}Parando instâncias anteriores...${NC}"
pkill -f "uvicorn src.main:app" 2>/dev/null
sleep 1

# Limpar log
> "$LOG_FILE"

# Iniciar API
echo -e "${GREEN}Iniciando API...${NC}"
cd "$API_DIR"
source .venv/bin/activate
nohup python -m uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload >> "$LOG_FILE" 2>&1 &

echo -e "${GREEN}API iniciada! PID: $!${NC}"
echo -e "${CYAN}Log: $LOG_FILE${NC}"
echo ""

# Aguardar startup
echo -e "${YELLOW}Aguardando startup...${NC}"
sleep 3

# Verificar se está rodando
if curl -s http://localhost:8000/docs > /dev/null 2>&1; then
    echo -e "${GREEN}${BOLD}✓ API Online!${NC}"
else
    echo -e "${RED}${BOLD}✗ API pode ter falhado ao iniciar${NC}"
fi

echo ""
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
echo -e "${BOLD}Monitorando logs...${NC} (Ctrl+C para sair)"
echo -e "${CYAN}────────────────────────────────────────────────────────────────────${NC}"
echo ""

# Iniciar monitor
/Users/marcelpiva/Projects/myfit/api-logs.sh
