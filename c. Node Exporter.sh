#!/bin/bash

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
[ec2-user@ip-172-31-38-47 ~]$
[ec2-user@ip-172-31-38-47 ~]$
[ec2-user@ip-172-31-38-47 ~]$ cat node_exporter.sh
#!/bin/bash

# Download and install node_exporter
echo "Downloading and installing node_exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz
sudo mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin/
rm -rf node_exporter-1.2.2.linux-amd64*

# Create a systemd service for node_exporter
echo "Creating systemd service..."
cat << EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF

# Reload systemd and start node_exporter
echo "Starting node_exporter..."
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# Show node_exporter status
echo "Node Exporter status:"
sudo systemctl status node_exporter