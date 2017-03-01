#!/bin/bash

# Update CentOS with patches
yum update -y --exclude=kernel

# Tools
yum install -y git nano unzip screen nc telnet

