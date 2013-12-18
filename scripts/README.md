# Customisations

## Backup

You probably want to create a `./scripts/backup.conf` file containing the following: 

    BACKUP_SERVER="your-backup-server.com"
    BACKUP_PATH="/path/to/your/backup"
    VAGRANT_VM="myAirtimeVM"

It will be ignored by the `.gitignore`.