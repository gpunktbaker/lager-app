FROM alpine:latest

# PocketBase herunterladen und installieren
ARG QN_VERSION=0.23.0
RUN apk add --no-cache ca-certificates wget unzip openssh-client
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${QN_VERSION}/pocketbase_${QN_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${QN_VERSION}_linux_amd64.zip -d /usr/local/bin/ \
    && rm pocketbase_${QN_VERSION}_linux_amd64.zip

# Deine HTML-Dateien kopieren
COPY . /pb_public

# Das Start-Skript in den Container kopieren und ausführbar machen
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

# Das Skript beim Start ausführen
CMD ["/start.sh"]
