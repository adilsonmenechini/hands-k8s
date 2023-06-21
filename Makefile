.PHONY: clean init plan apply destroy all


## Clean all cache directories
clean:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

## Run terragrunt init
init: clean
	terragrunt run-all init 

## Run terragrunt plan
plan:
	terragrunt run-all plan 

## Run terragrunt apply
apply:
	terragrunt run-all apply 

## Run terragrunt [init,plan,apply]
all: init plan apply

## Run terragrunt destroy
destroy:
	terragrunt run-all destroy 
