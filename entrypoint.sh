#!/usr/bin/env bash

INTERACTIVE="FALSE"
if [ "$(echo $INTERACTIVE_MODE | tr '[:upper:]' '[:lower:]')" == "true" ]; then
	INTERACTIVE="TRUE"
fi

# Verify some Repo URL and token have been given, otherwise we must be interactive mode.
if [ -z "$GITHUB_REPOSITORY" ] || [ -z "$GITHUB_TOKEN" ]; then
	if [ "$INTERACTIVE" == "FALSE" ]; then
		echo "GITHUB_REPOSITORY and GITHUB_TOKEN cannot be empty"
		exit 1
	fi
fi

# Calculate default configuration values.
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

# Calculate runner replacement policy.
REPLACEMENT_POLICY="\n\n\n"
REPLACEMENT_POLICY_LABEL="FALSE"
if [ "$(echo $REPLACE_EXISTING_RUNNER | tr '[:upper:]' '[:lower:]')" == "true" ]; then
	REPLACEMENT_POLICY="Y\n\n"
	REPLACEMENT_POLICY_LABEL="TRUE"
fi

# Configure runner interactively, or with the given replacement policy.
printf "Configuring GitHub Runner for $GITHUB_REPOSITORY_BANNER\n"
printf "\tRunner Name: $RUNNER_NAME\n\tWorking Directory: $WORK_DIR\n\tReplace Existing Runners: $REPLACEMENT_POLICY_LABEL\n"
if [ "$INTERACTIVE" == "FALSE" ]; then
	echo -ne "$REPLACEMENT_POLICY" | ./app/config.sh --url $GITHUB_REPOSITORY --token $GITHUB_TOKEN --agent $RUNNER_NAME --work $WORK_DIR
elif
	./app/config.sh --url $GITHUB_REPOSITORY --token $GITHUB_TOKEN --agent $RUNNER_NAME --work $WORK_DIR
fi

# Start the runner.
printf "Executing GitHub Runner for $GITHUB_REPOSITORY\n"
./app/run.sh
