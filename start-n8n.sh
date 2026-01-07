#!/bin/bash

source ~/.nvm/nvm.sh
nvm use 20

# 加载 .env 文件中的环境变量
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

export N8N_USER_FOLDER=$(pwd)/.n8n
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false

# 启动 n8n
npx n8n
