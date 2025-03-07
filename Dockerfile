FROM node:18-alpine

WORKDIR /app

RUN apk add openjdk11
RUN apk add --no-cache jq

# Define the firebase.json file
RUN echo '{ "emulators": { "firestore": { "host": "0.0.0.0", "port": 8085 },  "auth": { "host": "0.0.0.0", "port": 9099 }, "storage": { "host": "0.0.0.0", "port": 9199 }, "ui": { "enabled": true, "host": "0.0.0.0", "port": 4000 }, "singleProjectMode": true }, "storage": { "rules": "storage.rules" } }' | jq '.' > firebase.json

# Define Cloud Storage rules (allow all reads and writes)
RUN echo 'rules_version = "2"; service firebase.storage { match /b/{bucket}/o { match /{allPaths=**} { allow read, write; } } }' > storage.rules

RUN npm install -g firebase-tools

EXPOSE 4000
EXPOSE 8085
EXPOSE 9099
EXPOSE 9199

# Start the emulators
CMD [ "firebase", "--project=test-project", "emulators:start", "--only", "storage,auth,firestore" ]