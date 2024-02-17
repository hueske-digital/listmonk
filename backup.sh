#!/bin/sh

if [ -d "/var/lib/mysql" ]; then
    echo "MariaDB gefunden, starte Backup..."
    mariadb-dump --user=$MARIADB_USER --password=$MARIADB_PASSWORD $MARIADB_DATABASE > /var/lib/mysql/backup.sql
    echo "MariaDB Backup abgeschlossen."

elif [ -d "/var/lib/postgresql/data" ]; then
    echo "PostgreSQL gefunden, starte Backup..."
    pg_dumpall -U $POSTGRES_USER -f /var/lib/postgresql/data/backup.sql
    echo "PostgreSQL Backup abgeschlossen."

else
    echo "Keine unterstuetzte Datenbank gefunden... :("
fi
