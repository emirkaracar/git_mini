#!/usr/bin/env bash

echo "Starting installation..."

# Update the list of available packages
sudo apt update

# Install a package (tree: shows folders as a tree)
sudo apt install -y tree

echo "Installation complete!"
