#!/usr/bin/env bash

GITHUB_REPOSITORY_BANNER="$GITHUB_REPOSITORY"
if [ -z "$GITHUB_REPOSITORY_BANNER" ]; then
	export GITHUB_REPOSITORY_BANNER="<empty repository url>"
fi

if [ -z "$RUNNER_NAME" ]; then
	export RUNNER_NAME="$(hostname)"
fi

if [ -z "$WORK_DIR" ]; then
	export WORK_DIR=".workdir"
fi

REPLACEMENT_POLICY="\n\n\n"
REPLACEMENT_POLICY_LABEL="FALSE"
if [ "$(echo $REPLACE_EXISTING_RUNNER | tr '[:upper:]' '[:lower:]')" == "true" ]; then
	REPLACEMENT_POLICY="Y\n\n"
	REPLACEMENT_POLICY_LABEL="TRUE"
fi

printf "Configuring GitHub Runner for $GITHUB_REPOSITORY_BANNER\n"
printf "\tRunner Name: $RUNNER_NAME\n\tWorking Directory: $WORK_DIR\n\tReplace Existing Runners: $REPLACEMENT_POLICY_LABEL\n"
echo -ne "$REPLACEMENT_POLICY" | ./app/config.sh --url $GITHUB_REPOSITORY --token $GITHUB_TOKEN --agent $RUNNER_NAME --work $WORK_DIR

printf "Executing GitHub Runner for $GITHUB_REPOSITORY\n"
./app/run.sh
