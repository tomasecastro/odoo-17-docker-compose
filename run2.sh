#!/bin/bash

DESTINATION=$1
PORT=$2
CHAT=$3
# Detectar el directorio base donde se ejecuta el script
BASE_DIR=$(pwd)
# Obtener el nombre de usuario y grupo actuales
USER=$(whoami)
GROUP=$(id -gn $USER)

## Clonar el directorio de Odoo
#git clone --depth=1 https://github.com/tomasecastro/odoo-17-docker-compose $DESTINATION
#rm -rf $DESTINATION/.git
#
## Crear el directorio de PostgreSQL
#mkdir -p $DESTINATION/postgresql
#
## Instalar dependencias necesarias
#apt-get update && apt-get install -y sudo unzip nano curl apt-transport-https ca-certificates gnupg lsb-release
#
## Instalar la última versión de Docker desde el repositorio oficial para Debian
#curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#
## Iniciar y habilitar el servicio Docker
#sudo systemctl start docker
#sudo systemctl enable docker
#
## Agregar el usuario actual al grupo docker
#sudo usermod -aG docker $USER
#
## Crear alias docker-compose para compatibilidad con scripts antiguos
#echo 'alias docker-compose="docker compose"' >> ~/.bashrc
#source ~/.bashrc
#
## Cambiar la propiedad al usuario actual y establecer permisos restrictivos por seguridad
#sudo chown -R $USER:$USER $DESTINATION
#sudo chmod -R 700 $DESTINATION  # Solo el usuario tiene acceso
#
#
#if ! grep -q "^POSTGRES_PASSWORD=" $DESTINATION/.env; then
#  export POSTGRES_PASSWORD=$(openssl rand -base64 12)  # Generar una clave de acceso aleatoria
#  echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> $DESTINATION/.env
#else
#  # Si ya existe, actualizar el valor
#  sed -i "s#^POSTGRES_PASSWORD=.*#POSTGRES_PASSWORD=$(openssl rand -base64 12)#" $DESTINATION/.env
#fi
#
## Actualizar las variables ODOO_PORT y ODOO_LONGPOLLING_PORT en el archivo .env
#if ! grep -q "^ODOO_PORT=" $DESTINATION/.env; then
#  export ODOO_PORT=$(openssl rand -base64 16)  # Generar una contraseña aleatoria
#  echo "ODOO_PORT=$PORT" >> $DESTINATION/.env
#else
#  # Si ya existe, actualizar el valor
#  sed -i "s#^ODOO_PORT=.*#ODOO_PORT=$PORT#" $DESTINATION/.env
#fi
#
#if ! grep -q "^ODOO_LONGPOLLING_PORT=" $DESTINATION/.env; then
#  export ODOO_LONGPOLLING_PORT=$(openssl rand -base64 16)  # Generar una contraseña aleatoria
#  echo "ODOO_LONGPOLLING_PORT=$CHAT" >> $DESTINATION/.env
#else
#  # Si ya existe, actualizar el valor
#  sed -i "s#^ODOO_LONGPOLLING_PORT=.*#ODOO_LONGPOLLING_PORT=$CHAT#" $DESTINATION/.env
#fi
#
#
## Establecer permisos de archivos y directorios después de la instalación
#find $DESTINATION -type f -exec chmod 644 {} \;
#find $DESTINATION -type d -exec chmod 755 {} \;
#
## Ejecutar Odoo
#docker compose -f $DESTINATION/docker-compose.yml up -d
#
## Obtener la dirección IP local
#IP_ADDRESS=$(hostname -I | awk '{print $1}')
#
## Recargar systemd para reconocer el nuevo servicio
#sudo systemctl daemon-reload
#
unzip $BASE_DIR/$DESTINATION/odoo/addons/*.zip -d $BASE_DIR/$DESTINATION/odoo/addons/
#rm -r $DESTINATION/odoo/addons/*.zip

## Establecer permisos 777 para los directorios específicos
#chmod -R 777 $DESTINATION/odoo/addons $DESTINATION/odoo/etc $DESTINATION/postgresql
#
## Ejecutar Odoo
#docker compose -f $DESTINATION/docker-compose.yml up -d
#
## Mostrar información de acceso
#echo "Todos los datos de acceso como usuarios y contraseñas están dentro en el archivo $BASE_DIR/$DESTINATION/.env"
#echo "Odoo iniciado en http://$IP_ADDRESS:$PORT | Contraseña maestra: minhng.info | Puerto de chat en vivo: $CHAT"

