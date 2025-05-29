LAMBDA_DIR=lambda
TERRAFORM_DIR=terraform
ZIP_NAME=function.zip

GOOS=linux
GOARCH=amd64

.PHONY: all build zip deploy clean tf-init tf-apply tf-destroy

all: build zip

build:
	cd $(LAMBDA_DIR) && GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o bootstrap main.go

zip: build
	cd $(LAMBDA_DIR) && zip $(ZIP_NAME) bootstrap && mv $(ZIP_NAME) ../$(TERRAFORM_DIR)/

deploy: zip
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve

tf-init:
	cd $(TERRAFORM_DIR) && terraform init

tf-destroy:
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve

tf-plan:
	cd $(TERRAFORM_DIR) && terraform plan

clean:
	rm -f $(LAMBDA_DIR)/bootstrap
	rm -f $(TERRAFORM_DIR)/$(ZIP_NAME)
