#!/bin/bash

menu() {
    echo "Welcome to the Backup Utility. Please Select One of the Following Options:"
    echo "1. Backup a Directory"
    echo "2. Restore a Directory"
    echo "3. EXIT"
}

backup_directory() {
    read -p "Enter the directory to be backed up: " backup_source_dir
    read -p "Enter the location to save the backup: " backup_save_dir

    echo -e "\nConfirm The Information Below is Correct\n"
    echo "Source: $backup_source_dir"
    echo "Destination: $backup_save_dir \n"

    read -p "Is this correct? (Y/N): " confirm

    if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        backup_name="Date_$(date +"%Y%m%d")_${backup_source_dir}_Backup"
        tar -czvf "$backup_save_dir/$backup_name.tar.gz" "$backup_source_dir"
        echo "Backup Completed Successfully"
    else
        echo "Backup was Canceled"
    fi
}

restore_directory() {
    read -p "Enter the location of the backup file: " backup_file
    read -p "Enter the location to the directory to restore: " restore_dir

    if [ ! -f "$backup_file" ]; then
        echo "Error: Backup file not found."
        echo "Restore was Canceled"
        return
    fi

    if [ ! -d "$restore_dir" ]; then
        echo "Error: Restore directory not found."
        echo "Restore was Canceled"
        return
    fi

    echo -e "\nConfirm The Information Below is Correct\n"
    echo "Backup File Location: $backup_file"
    echo "Location to Restore: $restore_dir \n"

    read -p "Is this correct? (Y/N): " confirm

    if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        tar -xzvf "$backup_file" -C "$restore_dir"
        echo "Restore Completed Successfully"
    else
        echo "Restore was Canceled"
    fi
}

while true; do
    clear
    menu

    read -p "Select an Option: " choice

    case $choice in
        1) backup_directory ;;
        2) restore_directory ;;
        3) exit ;;
        *) echo "Invalid Option. Please Select a Number from the Menu" ;;
    esac

    read -p "Press Enter to continue..."
done
