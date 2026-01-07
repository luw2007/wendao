#!/bin/bash

source ~/.nvm/nvm.sh
nvm use 20

# 加载 .env 文件中的环境变量（过滤注释）
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

export N8N_USER_FOLDER=$(pwd)/.n8n
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENDPOINT_WEBHOOK_TEST=webhook-test
export N8N_ENDPOINT_WEBHOOK=webhook
export WEBHOOK_URL=http://localhost:5678/

export NODE_TLS_REJECT_UNAUTHORIZED=0
export N8N_RUNNERS_DISABLED=true

# 启动 n8n（CORS 已在 webhook 响应头中处理）
npx n8n
