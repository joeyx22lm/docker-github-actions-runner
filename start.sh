#!/usr/bin/env bash

printf "Creating user: \`github\`\n"
useradd github
chown -R github:github /app
echo "github ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

printf "Configuring and Executing GitHub Runner for $GITHUB_REPOSITORY\n"
su github -c "sudo ./app/bin/installdependencies.sh && echo -ne '\n\n\n' | ./app/config.sh --url $GITHUB_REPOSITORY --token $GITHUB_TOKEN && ./app/run.sh"
