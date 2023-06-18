.PHONY: help, init, plan, apply, destroy, clean

help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 
	
.DEFAULT_GOAL := help
##
## ------------------------------------
## Terraform
## ------------------------------------
##

## make init - Terraform init
init: 
	@terraform init

validate:
	@terraform validate && terraform fmt

## make plan - Terraform plan
plan:validate
	@terraform plan -out=plan

## make apply - Terraform apply
apply:
	@terraform apply plan


## make all - Terraform init|plan|apply
all: init plan apply


## make destroy - Terraform destroy
destroy:validate
	@terraform apply -destroy
	@rm -rf terraform.* .terraform.* .terraform* plan *-config 

## make clean - remover variáveis de ambiente
clean:
	@rm -rf terraform.* .terraform.* .terraform* plan *-config
## 
## 
## 
