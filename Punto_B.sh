#!/bin/bash
cd /tmp/
mkdir -p head-check/{Error/{cliente, servidor},ok}

clear

LOG_FILE="/var/log/status_url.log"
LISTA=$1

ANT_IFS=$IFS
IFS=$'\n'

#---- Dentro del bucle ----#
for i in `cat $LISTA | grep -v ^#
do
        # Obtener el código de estado HTTP
        STATUS_CODE=$(curl -LI -o /dev/null -w '%{http_code}\n' -s "$URL")

         # Fecha y hora actual en formato yyyymmdd_hhmmss
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")


        # Registrar en el archivo /var/log/status_url.log
        cat "$TIMESTAMP - Code:$STATUS_CODE - URL:$URL" |sudo tee -a  "$LOG_FILE" >> /var/log/status_URL.log

done

IFS=$ANT_IFS

