# GitHub Actions Runner
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/joeyx22lm/docker-github-actions-runner)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/joeyx22lm/docker-github-actions-runner)
![Docker Pulls](https://img.shields.io/docker/pulls/joeyx22lm/docker-github-actions-runner)

Self-hosted GitHub Actions Runner, now available in a Docker container.

### How to use

```
docker run -d \
  -e GITHUB_REPOSITORY="..." \
  -e GITHUB_TOKEN="..." \
  -e RUNNER_NAME="SelfHostedRunner-001" \
  -e REPLACE_EXISTING_RUNNER="true" \
  joeyx22lm/docker-github-actions-runner
```

### Environment Variables

| Name | Description | Default | Example |
| --- | --- | --- | --- |
| `GITHUB_REPOSITORY` | GitHub repository URL | "" | "https://github.com/joeyx22lm/example"
| `GITHUB_TOKEN` | GitHub API Token | "" | N/A
| `RUNNER_NAME` | Self-hosted Runner Name | <container hostname> | N/A
| `WORK_DIR` | Working Directory | .workdir | N/A
| `REPLACE_EXISTING_RUNNER` | Replace existing runner with matching name | false | `true` or `false`

### Changelog

v0.0.2			Added support for runner name, custom workdir and runner replacement policy.
v0.0.1			Ubuntu 16.04, Runner v2.160.0
