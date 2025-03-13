#!/bin/bash

# Define the username
username="pistis"

# Check if the username already exist
while [ -n "$(getent passwd $username)" ]; do
    echo "User $username already exists. please choose a different username:"
    read username
done

# Create the user
sudo useradd -m -s /bin/bash "$username"

# Set a passwd for the user (you will be prompted to enter the password)
sudo passwd "$username"

# Add the user to the sudo group to grant administrative priviledges
sudo usermod -aG sudo "$username"

echo "User $username created successfully and granted sudo priviledges."