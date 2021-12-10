package main

import (
	"github.com/anchore/syft/syft"
	_jira "github.com/kennytrytek/demonstrate-dependabot-failure/jira-openapi-client"
)

func main() {
	_jira.DoSomething()
	syft.SyftSomething()
}
