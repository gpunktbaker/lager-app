FROM alpine:latest

# PocketBase herunterladen und installieren
ARG QN_VERSION=0.23.0
RUN apk add --no-cache ca-certificates wget unzip openssh-client
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${QN_VERSION}/pocketbase_${QN_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${QN_VERSION}_linux_amd64.zip -d /usr/local/bin/ \
    && rm pocketbase_${QN_VERSION}_linux_amd64.zip

# Deine HTML-Dateien aus GitHub in das PocketBase-Webverzeichnis kopieren
COPY . /pb_public

EXPOSE 8080

# PocketBase starten
CMD ["/usr/local/bin/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pocketbase/pb_data"]
