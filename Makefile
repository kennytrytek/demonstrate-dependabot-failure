OPENAPI_IMAGE = openapitools/openapi-generator-cli:v5.0.1
REPOSITORY_PATH = ${PWD}

all: help
help:
	@echo ""
	@echo "  openapi-clients     (Re)compile the OpenAPI clients used by the project"
	@echo ""

.PHONY: clean
clean:
	git clean -iX -- jira-openapi-client/

.PHONY: init
init: openapi-clients ${GOPATH}/bin/gotestsum ${GOPATH}/bin/golint
	cd go-apps && go mod download

.PHONY: openapi-clients
openapi-clients: jira-openapi-client/README.md

jira-openapi-client/README.md: jira-openapi-client/swagger.json
	@echo "Generating JIRA Golang OpenAPI client"
	docker run --rm \
	  -v ${REPOSITORY_PATH}/jira-openapi-client:/local \
	  $(OPENAPI_IMAGE) generate \
	  -i /local/swagger.json \
	  -g go \
	  -o /local \
	  --additional-properties=packageName=a-go-project,isGoSubmodule=true,enumClassPrefix=true,structPrefix=true


${GOPATH}/bin/gotestsum: go-apps/go.sum
	cd go-apps && go install gotest.tools/gotestsum

${GOPATH}/bin/golint: go-apps/go.sum
	cd go-apps && go install golang.org/x/lint/golint
