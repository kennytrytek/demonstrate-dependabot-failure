module github.com/kennytrytek/demonstrate-dependabot-failure/a-go-project

go 1.14

replace github.com/kennytrytek/demonstrate-dependabot-failure/jira-openapi-client => ../jira-openapi-client

require (
	github.com/anchore/syft v0.30.1
	github.com/kennytrytek/demonstrate-dependabot-failure/jira-openapi-client v0.0.0-00010101000000-000000000000
)

require github.com/anchore/stereoscope v0.0.0-20211203160213-5a5e323a5c89 // indirect
