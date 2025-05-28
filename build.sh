#!/bin/bash

echo "Building Lambda function..."

cd lambda || exit
GOOS=linux GOARCH=amd64 go build -o bootstrap main.go
zip function.zip bootstrap
mv function.zip ../terraform/
rm bootstrap
cd ..

echo "Build complete: terraform/function.zip"
