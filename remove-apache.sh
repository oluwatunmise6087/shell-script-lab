#!/bin/bash

# Define the list of package names to uninstall
packages=("apache2" "apache2-utils")

# Iterate through the list and uninstall each packages
for package in "${packages[@]}"; do
    # Check if the packages is install before attempting to uninstall
    if dpkg -l | grep -q $package; then
        echo "Uninstalling $package..."
        sudo apt-get purge -y $package
        echo "done."
    else
        echo "$package is not installed."
    fi
done

# Remove residual configuration files
sudo apt-get autoremove -y

echo "Uinstallation complete."