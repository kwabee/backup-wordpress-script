#!/bin/bash

date=$(date '+%Y-%m-%d')

echo "Running Backups..."

echo "Current Date is : " + $date

echo "Backing up website files..."

cd /home/bitnami/apps/wordpress

sudo tar -czvf website-backup-$date.tar.gz /home/bitnami/apps/wordpress/htdocs

sudo mv website-backup-$date.tar.gz website-backups

echo "Website files backed up and moved to /home/bitnami/apps/wordpress/website-backups"

echo "Backing up database..."

mysqldump -u root -pXXXXXXX bitnami_wordpress > database-backup-$date.sql

sudo mv database-backup-$date.sql /home/bitnami/apps/wordpress/website-backups

echo "Database backed up and moved to /home/bitnami/apps/wordpress/website-backups"

echo "Backup complete!"