#!/bin/bash

# Simple cowsay + fortune loop for Wisecow app
while true; do
  echo "=============================="
  fortune | cowsay
  echo "=============================="
  sleep 5
done
