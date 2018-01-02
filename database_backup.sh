#!/bin/bash

# Substitute your own values for the following:
# <database_user> - The database user account. This account will need to have access to your database.
# <database_pass> - Password for the database user account.
# <database_name> - The name of the database you wish to backup
# <remote_user> - The system username on the remote host
# <remote_host> - The IP or DNS name of the remote host

/usr/bin/mysqldump -u<database_user> -p<database_pass> --add-drop-database --add-drop-table --complete-insert <database_name> /path/to/backup/location/$(date +%F)_database_backup.sql
bzip2 -z -s /path/to/backup/location/$(date +%F)_database_backup.sql
scp /path/to/backup/location/$(date +%F)_database_backup.sql.bz2 <remote_user>@<remote_host>:/remote/backup/location/$(date +%F)_database_backup.sql.bz2
