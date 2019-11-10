# GitHub Actions Runner
Self-hosted GitHub Actions Runner, now available in a Docker container.

### How to use

```
docker run -d \
	-e GITHUB_REPOSITORY="..." \
	-e GITHUB_TOKEN="..." \
	joeyx22lm/docker-github-actions-runner
```

### Environment Variables

| Name | Description | Default | Example |
| --- | --- | --- | --- |
| `GITHUB_REPOSITORY` | GitHub repository URL | "" | "https://github.com/joeyx22lm/example"
| `GITHUB_TOKEN` | GitHub API Token | "" | N/A


### Changelog

v0.0.1			Ubuntu 16.04, Runner v2.160.0
