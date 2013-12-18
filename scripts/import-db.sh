#!/usr/bin/env bash
#
# 2013/12/18
#
# This script basically does:
# 
# vagrant ssh phauneradio
# sudo -u postgres psql
# DROP DATABASE airtime;
# CREATE DATABASE airtime;
# ^D
# gunzip /srv/airtime/stor/shared/airtime-backup.gz
# sudo -u postgres psql airtime < airtime-backup

# REMEMBER to fill a backup.conf if needed!
source ./scripts/backup.conf

#BACKUP_SERVER="your-backup-server.com"
#BACKUP_PATH="/path/to/your/backup"
BACKUP_FILE="airtime-backup.gz"
TMP_FOLDER="${HOME}/tmp"
AIRTIME_SHARED_FOLDER="shared"
VM_SHARED_PATH="/srv/airtime/stor/shared"
AIRTIME_DB="airtime"

SCP=`which scp`
CP=`which cp`
VAGRANT=`which vagrant`
#VAGRANT_VM="myAirtimeVM"
VAGRANT_SSH_CMD="${VAGRANT} ssh ${VAGRANT_VM} -c"

function getBackup() {
  echo "Retrieving backup from ${BACKUP_SERVER} to ${TMP_FOLDER}..."
  ${SCP} ${BACKUP_SERVER}:${BACKUP_PATH}/${BACKUP_FILE} ${TMP_FOLDER}
}

function moveBackup() {
  echo "Moving..."
  ${CP} ${TMP_FOLDER}/${BACKUP_FILE} ${AIRTIME_SHARED_FOLDER}/
}

function dropDB() {
  echo "Droping database..."
  ${VAGRANT_SSH_CMD} "sudo -u postgres psql -c 'DROP DATABASE ${AIRTIME_DB};' ; sudo -u postgres psql -c 'CREATE DATABASE ${AIRTIME_DB};'"
}

function restoreDB() {
  echo "Restoring database..."
  ${VAGRANT_SSH_CMD} "sudo gunzip -f ${VM_SHARED_PATH}/${BACKUP_FILE} ; sudo -u postgres psql ${AIRTIME_DB} < ${VM_SHARED_PATH}/airtime-backup"
}

getBackup
moveBackup
dropDB
restoreDB


