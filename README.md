# **Backup Utility**

This is a simple Bash script for performing directory backups and restores. It provides a user-friendly menu to select between two options: backing up a directory and restoring a directory from a backup.

## **Features**
 - Backup a Directory: Allows the user to select a directory for backup and specify the destination to save the backup. The script creates a compressed tarball (.tar.gz) with a timestamp and the source directory's name.
 - Restore a Directory: Enables the restoration of a directory from a previously created backup. The user inputs the backup file location and the directory to restore. The script performs error checks to ensure the backup file and restore directory exist.

## **How to Use**
 - Give file excutable permissions -> chmod +x backup_utility.sh
 - Run the script -> ./backup_utility.sh
 - Choose the desired operation: backup or restore.
 - Follow the prompts to input the required information.
 - Confirm the provided information.
 - The script will execute the backup or restore operation accordingly.

# **Note**
 - Ensure you have the necessary permissions to read from the source directory and write to the destination directory.
