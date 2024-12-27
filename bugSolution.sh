#!/bin/bash

# This script demonstrates a solution to the race condition by using a lock file.

file_to_process="my_file.txt"
lock_file="$file_to_process.lock"
echo "Creating file: $file_to_process"
touch "$file_to_process"
echo "Content" > "$file_to_process"

# Acquire an exclusive lock on the file
while flock -x "$lock_file"; do
  # Process the file
  cat "$file_to_process"
  rm "$file_to_process"
  echo "File processed successfully!"
  break
done

# Release the lock (automatically released when the script exits)
rm -f "$lock_file"