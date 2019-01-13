FROM ubuntu:latest

# Install dependencies, download and extract the bedrock server
RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0 && \
    curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.1.2.zip --output bedrock-server.zip && \
    unzip bedrock-server.zip -d bedrock-server && \
    rm bedrock-server.zip

# Create a separate folder for configurations move the original files there and create links for the files
RUN mkdir /bedrock-server/config && \
    mkdir /tmp/behavior_packs && \
    mkdir /tmp/resource_packs && \
    mv /bedrock-server/server.properties /bedrock-server/config && \
    mv /bedrock-server/permissions.json /bedrock-server/config && \
    mv /bedrock-server/whitelist.json /bedrock-server/config && \
    ln -s /bedrock-server/config/server.properties /bedrock-server/server.properties && \
    ln -s /bedrock-server/config/permissions.json /bedrock-server/permissions.json && \
    ln -s /bedrock-server/config/whitelist.json /bedrock-server/whitelist.json

COPY ./start.sh /bedrock-server

EXPOSE 19132/udp

VOLUME /bedrock-server/worlds /bedrock-server/config /tmp/behavior_packs /tmp/resource_packs

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./start.sh
