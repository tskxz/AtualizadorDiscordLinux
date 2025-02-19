#!/bin/bash

DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
DEB_FILE="/tmp/discord.deb"

echo "A fazer download do Discord mais recente..."
wget -O "$DEB_FILE" "$DISCORD_URL"

# Verificar se o download foi bem-sucedido
if [[ $? -ne 0 ]]; then
    echo "Erro ao baixar o Discord."
    exit 1
fi

# Instalar o pacote
echo "A instalar o Discord..."
sudo dpkg -i "$DEB_FILE"

# Corrigir dependências caso necessário
sudo apt-get install -f -y

# Remover o instalador .deb
rm "$DEB_FILE"

echo "Atualização do Discord concluída!"
