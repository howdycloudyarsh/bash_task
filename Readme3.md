# Bash_Tasks

Bash Real-Time Scripts.

## Documentation

*Task 3* : 

## 3.	Write a bash script to install node_exporter and show the status.


```bash
FOLLOW THE SCRIPT BELOW.
```

# Download and extract node_exporter

NODE_EXPORTER_VERSION="1.3.0"
wget "https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz"
tar xvfz "node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz"
rm "node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz"

# Move node_exporter to a suitable location

sudo mv "node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter" /usr/local/bin/
rm -r "node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64"

# Create a systemd service unit file

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
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

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# Show service status

sudo systemctl status node_exporter
