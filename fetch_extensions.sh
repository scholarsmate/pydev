#!/bin/bash
set -ex

# Create the directory for downloaded extensions if it doesn't exist
mkdir -p ext

# Read the list of extensions from the file
while read extension; do
  # Use vsce to get the latest version of the extension
  version=$(vsce show "$extension" --json | jq -r '.versions[0].version')
  
  # Construct the download URL
  url="https://${extension//\./}/v/$version/$extension-$version.vsix"
  
  # Download the extension VSIX file
  echo "Downloading $extension..."
  curl -L -o "ext/$extension-$version.vsix" "$url"
done < extensions.txt
