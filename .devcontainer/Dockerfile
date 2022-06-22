# Find the Dockerfile for mcr.microsoft.com/azure-functions/powershell:3.0-powershell${VARIANT}-core-tools at this URL
# https://github.com/Azure/azure-functions-docker/blob/dev/host/3.0/buster/amd64/powershell

# Update the VARIANT arg in devcontainer.json to pick a supported PowerShell version: 7, 6
ARG TOOLSVER=4.0
ARG VARIANT=7.2
FROM mcr.microsoft.com/azure-functions/powershell:${TOOLSVER}-powershell${VARIANT}-core-tools
