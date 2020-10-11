#!/bin/bash

set -x
set -e

BASE_DIR="$(pwd)"
BUILD_DIR="$BASE_DIR/.build"

rm -rf "$BASE_DIR/.build/*"
mkdir -p "$BUILD_DIR/package/python"

pip3 install -r "$BASE_DIR/requirements.txt" -t "$BUILD_DIR/package/python" --upgrade

cd terraform
terraform init
terraform plan --var-file input.tfvars --out plan.tfplan
terraform apply plan.tfplan
