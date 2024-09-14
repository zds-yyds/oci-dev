#!/bin/bash

# Define the target directory
target_directory="/root"

apt update

apt install git

# Download the archive
git clone https://github.com/zds-yyds/oci_demo.git 

# Extract the archive
#tar -zxvf v1.0.9.tar.gz

# Rename the folder or create a new one if 'demo' exists
if [ -d "$target_directory/demo" ]; then
  i=1
  while [ -d "$target_directory/demo$i" ]; do
    i=$((i+1))
  done
  mv oci_demo "$target_directory/demo$i"
  target_directory="$target_directory/demo$i"
else
  mv oci_demo "$target_directory/demo"
  target_directory="$target_directory/demo"
fi

# Remove the downloaded archive
#rm v1.0.9.tar.gz

# Change permissions on the folder
chmod -R 777 "$target_directory"

# Change the current directory to the target directory
cd "$target_directory"

chmod +x begin.sh

# Install 'python3-venv' package
apt install python3-venv

# Create a Python virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install the 'oci' package using pip
pip install oci==2.126.4

# Exit the virtual environment
deactivate
