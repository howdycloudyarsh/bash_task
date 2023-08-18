# Bash_Tasks

Bash Real-Time Scripts.

## Documentation

*Task 4* : 

## Write a bash script to Delete temporary files or logs older than a certain date to free up disc space by removing unnecessary files.


```bash
 FOLLOW THE SCRIPT BELOW
```

# Directory to search for files

SEARCH_DIR="/path/to/search_directory"

# Date in YYYY-MM-DD format to define the threshold

THRESHOLD_DATE="2023-08-17"

# File extension or pattern (e.g., "*.log", "temp_*")

FILE_PATTERN="*.log"

# Dry-run mode (set to "true" for testing; set to "false" to actually delete files)

DRY_RUN="false"

# Find and delete files

find "$SEARCH_DIR" -type f -name "$FILE_PATTERN" -mtime +$(( ($(date +%s) - $(date -d "$THRESHOLD_DATE" +%s)) / 86400 )) -print0 | while IFS= read -r -d $'\0' file; do
    echo "Deleting: $file"
    if [ "$DRY_RUN" = "false" ]; then
        rm "$file"
    fi
done

**echo "Cleanup completed."**
