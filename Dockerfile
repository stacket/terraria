FROM debian:buster-slim

ARG VERSION=1405

ADD  ./init.sh /init.sh
ADD  ./cmd.sh /cmd.sh
ADD  ./run.sh /run.sh

RUN chmod +x /init.sh
RUN chmod +x /cmd.sh
RUN chmod +x /run.sh

WORKDIR /tmp

RUN apt-get update && apt-get install -y unzip 

ADD "https://www.terraria.org/system/dedicated_servers/archives/000/000/039/original/terraria-server-1405.zip" terraria-server.zip

RUN mkdir /app

RUN unzip terraria-server.zip "${VERSION}/Linux/*" \
  && chmod -R a+rw ${VERSION}/Linux/* \
  && chmod a+x ${VERSION}/Linux/TerrariaServer* \
  && mv ${VERSION}/Linux /terraria


WORKDIR /app

#ENTRYPOINT ./TerrariaServer -x64 -config serverconfig.txt
CMD trap 'exit' INT; /init.sh
