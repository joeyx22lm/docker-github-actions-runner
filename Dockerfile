FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl sudo \
	&& mkdir /app \
	&& cd /app \
	&& curl -O https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz \
	&& tar xzf ./actions-runner-linux-x64-2.160.0.tar.gz

COPY start.sh /app/start.sh

ENTRYPOINT ["/app/start.sh"]
