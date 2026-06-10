#!/bin/sh

# 1. Admin-Konto erstellen/aktualisieren
/usr/local/bin/pocketbase superuser upsert deine-mail@beispiel.de DeinSicheresPasswort123

# 2. Den Server im Anschluss starten
/usr/local/bin/pocketbase serve --http=0.0.0.0:8080 --dir=/pocketbase/pb_data --publicDir=/pb_public
