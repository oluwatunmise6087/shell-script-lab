#!/bin/bash

# Check if the script is being run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
    fi

# Function to install Apache based on the linux distribution
install_apache() {
    if command -v apt &> /dev/null; then  
        apt update
        apt install -y apache2
    elif command -v yum &> /dev/null; then
         yum install -y httpd
    elif command -v dnf &> /dev/null; then
        dnf install -y httpd
    elif command -v zypper &> /dev/null; then
        zypper install -y apache2
    elif command -v pacman & /dev/null; then
       pacman -S --noconfirm apache
    else
       echo "Unsupported Linux distribution"
       exit 1
    fi
}

# Install Apache
install_apache

# Start and enable Apache
if command -v systemctl &> /dev/null; then
    systemctl start apache2 || systemctl start httpd
    systemctl enable apache2 || systemctl enable httpd
fi

# Display status
if command -v systemctl &> dev/null/; then
    systemctl status apache2 || systemctl status httpd
fi