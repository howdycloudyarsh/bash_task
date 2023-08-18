# Bash_Tasks

Bash Real-Time Scripts.

## Documentation

*Task 2* : 

## 2.	Write a bash script that automates the process of creating backups for specified files and directories. Backups should happen on a daily basis.


```bash
MODIFY THE SCRIPT ACCORDING TO USAGE
```
# Define the source files and directories to be backed up
SOURCE_FILES="/home/ec2-user/source/file /home/ec2-user/source/file2"

# Define the backup destination directory
BACKUP_DIR="/home/ec2-user/backup/"

# Create a timestamp for the backup
TIMESTAMP=$(date +%Y%m%d)

# Create the backup filename
BACKUP_FILENAME="backup_${TIMESTAMP}.tar.gz"

# Create the backup using tar
tar -czvf "${BACKUP_DIR}/${BACKUP_FILENAME}" $SOURCE_FILES

echo "Backup completed: ${BACKUP_FILENAME}"
