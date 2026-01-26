#!make

include .env
LAUNCH_TEMPLATE=$$(aws cloudformation describe-stack-resources --stack-name $(NAME) --query "StackResources[?LogicalResourceId=='myLaunchTemplate'].PhysicalResourceId" --output text)
default: help

.PHONY: help
help: ## Show list of commands
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0;33m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""

.PHONY: setup
setup: ## Create stack (only run first time)
	@echo "Creating stack..."
	@aws cloudformation create-stack --stack-name $(NAME) --template-body file://template.yml --parameters $(PARAMETERS) --capabilities CAPABILITY_NAMED_IAM

.PHONY: deploy
.ONESHELL: deploy
deploy: ## Deploy new template (deploy changesets)
	@echo "Updating stack..."
	@aws cloudformation deploy \
		--stack-name $(NAME) \
		--template-file template.yml \
		--capabilities CAPABILITY_NAMED_IAM \
		--fail-on-empty-changeset
	@if [[ "$$?" == 255 ]]; then exit 0; fi
	@echo "Making updated template the default..."
	@aws ec2 modify-launch-template - \
		-launch-template-id $(LAUNCH_TEMPLATE) - \
		-default-version '$$Latest' > /dev/null 2>&1
	@echo "Done."

.PHONY: clean
clean: ## Delete stack
	@echo "Deleting stack..."
	@aws cloudformation delete-stack --stack-name $(NAME)

.PHONY: ## Validate template file
validate:
	@echo "Validating template..."
	@aws cloudformation validate-template --template-body file://template.yml --output yaml

.PHONY: desc
desc: ## Describe stack
	@echo "Fetching stack..."
	@aws cloudformation describe-stacks --stack-name $(NAME) --output yaml
