FROM debian:trixie-slim
RUN apt update -y
RUN apt install -y curl jq nmap expect openssh-client
WORKDIR /app
COPY . .
ENTRYPOINT ["bash","watchscan"]
