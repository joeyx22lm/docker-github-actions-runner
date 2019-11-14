FROM ubuntu:16.04

# Install prerequisites
RUN apt-get update && apt-get install -y curl sudo

# Create github user and pull runner binary
RUN useradd github \
	&& echo "github ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
	&& usermod -aG sudo github \
	&& mkdir /app \
	&& cd /app \
	&& curl -O https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz \
	&& tar xzf ./actions-runner-linux-x64-*.tar.gz \
	&& bash /app/bin/installdependencies.sh \
	&& chown -R github:github /app

# Prepare entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chown github:github /app/entrypoint.sh \
	&& chmod +x /app/entrypoint.sh
USER github
ENTRYPOINT ["/app/entrypoint.sh"]
