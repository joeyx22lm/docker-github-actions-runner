# GitHub Actions Runner
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/joeyx22lm/docker-github-actions-runner)](https://hub.docker.com/r/joeyx22lm/docker-github-actions-runner)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/joeyx22lm/docker-github-actions-runner)](https://hub.docker.com/r/joeyx22lm/docker-github-actions-runner)
[![Docker Pulls](https://img.shields.io/docker/pulls/joeyx22lm/docker-github-actions-runner)](https://hub.docker.com/r/joeyx22lm/docker-github-actions-runner)

Self-hosted GitHub Actions Runner, now available in a Docker container.

## Getting Started

Example using _Headless Mode_:

```
docker run -d \
  -e GITHUB_REPOSITORY="..." \
  -e GITHUB_TOKEN="..." \
  -e RUNNER_NAME="SelfHostedRunner-001" \
  -e REPLACE_EXISTING_RUNNER="true" \
  joeyx22lm/docker-github-actions-runner
```

Example using _Interactive Mode_:

```
docker run -it \
  -e INTERACTIVE_MODE="true" \
  joeyx22lm/docker-github-actions-runner
```

##### Interactive Mode
The runner can be executed in an _Interactive Mode_, allowing the user to manually provide runner configuration at runtime. _Interactive Mode_ can be enabled using the `INTERACTIVE_MODE` environment variable. No other environment variables are required for this mode.

##### Headless Mode
_Interactive Mode_ can be disabled by using or omitting the `INTERACTIVE_MODE` environment variable.

In order for the GitHub Action Runner to begin listening without any interaction, the following environment variables **must** be populated:

* `GITHUB_REPOSITORY`
* `GITHUB_TOKEN`

##### Environment Variables

| Name | Description | Default | Example |
| --- | --- | --- | --- |
| `GITHUB_REPOSITORY` | GitHub Repository URL | "" | "https://github.com/joeyx22lm/example" |
| `GITHUB_TOKEN` | GitHub API Token | "" | N/A |
| `RUNNER_NAME` | Self-hosted Runner Name | _\<hostname\>_ | N/A |
| `WORK_DIR` | Working Directory | .workdir | N/A |
| `REPLACE_EXISTING_RUNNER` | Replace existing runner with matching name. Ignored when using _Interactive Mode_. | false | `true` or `false` |
| `INTERACTIVE_MODE` | Don't skip runner configuration prompt | false | `true` or `false` |

## Releases

#### Docker Tags

| Tag | Description |
| --- | --- |
| alpha | **Not Stable.** Regularly updated from the development branch. |
| latest | **Stable.** **Latest Version.** |
| \<version\> | **Stable.** |

#### Changelog

| Release | Description |
| --- | --- |
| v0.1.0 | Added support for runner name, custom working directory, interactive mode and runner replacement policy. |
| v0.0.1 | Ubuntu 16.04, Runner v2.160.0 |
