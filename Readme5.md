# Bash_Tasks

Bash Real-Time Scripts.

## Documentation

*Task 5* : 

## Write a bash to ping a list of hosts and report their status.


```bash
FOLLOW THE STEPS FOR SCRIPT BELOW
```

# List of hosts to ping

HOSTS=("host1.example.com" "www.google.com" "www.rajops.in")

# Loop through the hosts and ping each one

for host in "${HOSTS[@]}"; do
    ping -c 3 "$host" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "$host is reachable."
    else
        echo "$host is unreachable."
    fi
done
