# Bash_Tasks

Bash Real-Time Scripts.

## Documentation

*Task 1* : 

## Create a bash script that monitors the CPU usage of the server, and configure Slack Alert. If CPU utilization exceeds the threshold value, send a notification to Slack.


```bash
STEP 1. Configure Slack Web-hook URL
```
![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/fa2a5b1e-7d90-4524-b5db-5b779af5391f)

First log into your slack account then create a channel in which you want to receive alerts.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/975e5570-86bb-4152-b73b-14bafd6a1cfb)

once the channel is created go to the apps section available inside the more menu link.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/616b0ca4-6866-4b48-9257-9d5136657e0d)

then go to app directory if you are using the slack desktop app then it will redirect you to the browser now click on the build button.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/71a2b283-6c13-4ff2-8f27-fc88f1704cb0)

create a new app or you can use your existing app.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/295dacf5-309f-4646-977a-42954cc96b24)

I am creating a new app from scratch mention the name of the app it can be anything and then select the workspace name and then create the app.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/0cd1e60f-3e9d-499d-b156-ce7cb4093f66)

once the app is created you will see an incoming webhook option.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/f97cf870-b35b-4f55-98d4-fe127d658cc1)

click on the incoming web hook and then enable it once it's enabled it will show add new web hook to workplace button.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/b73621f8-c597-4aeb-8d29-512b1b9d0605)

click on it now select the channel name for which you need to generate webhook URL and then click on allow button webhook is created.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/e934b21c-8d15-4543-a110-d1b483ae4811)

now you can copy this URL and use for receiving alerts on your slack Channel.

![image](https://github.com/howdycloudyarsh/bash_task/assets/133496386/08dcd6c2-350f-4eff-8af3-b6c2a0da8b4c)



```bash
STEP 2. Modify the Script.
```
# Threshold for CPU usage (in percentage)
THRESHOLD=90

# Get current CPU usage percentage
CPU_USAGE=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Check if CPU usage exceeds the threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    MESSAGE="High CPU usage detected: ${CPU_USAGE}%"
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE\"}" "$SLACK_WEBHOOK_URL"
fi

# To Increase the stress and check the Result, execute the Below Commands.

**-->>** **sudo yum install stress -y**

Use --timeout to stop it automatically e.g.

**-->>** **stress --cpu 4 --timeout 60s**

# Make the script executable

**chmod +x cpu_alert_on_slack.sh**

# Install, Enable & Start the ‘cronie’ package.

**-->>** **sudo yum install cronie -y**

**-->>** **sudo systemctl enable crond.service**

**-->>** **sudo systemctl start crond.service**

# To run the script automatically, you can set up a cron job. Open your crontab configuration.

**-->>** **crontab -e**

# Add a line to run the script at your desired frequency. For example, to run every 5 minutes.

**-->>** **"*/5 * * * * /path/to/cpu_alert_on_slack.sh"**




