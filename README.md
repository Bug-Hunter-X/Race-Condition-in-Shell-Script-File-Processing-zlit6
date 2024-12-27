# Race Condition in Shell Script File Processing

This repository demonstrates a subtle race condition in a shell script that processes a file. The script reads the file's contents and then attempts to remove it. If another process accesses the file concurrently, the script might encounter an error or unexpected behavior because of the race condition.

## Bug Description
The `bug.sh` script has a race condition between the `cat` command (which reads the file) and the `rm` command (which removes the file). If another process (e.g., another script or a user) attempts to access `my_file.txt` between these two commands, the `rm` command may fail or succeed unpredictably, leading to data loss or unexpected script behavior.

## Solution
The `bugSolution.sh` script addresses the race condition by using file locking. This ensures that only one process can access the file at a time, preventing the race condition.

## How to reproduce
1. Run `bug.sh` in a terminal.
2.  In a separate terminal, attempt to access `my_file.txt` (e.g., `cat my_file.txt`) while `bug.sh` is running.
3. Observe the output of `bug.sh`. The error might not be apparent if you don't access the file concurrently.  If another process accesses the file while `bug.sh` is attempting to remove it, the behavior will be inconsistent. 
4. For reliable testing, you can create a second script which accesses `my_file.txt` concurrently and run both scripts simultaneously. 

## How to fix
Use a locking mechanism to synchronize file access and avoid race conditions.