# Docker Firebase Emulator Suite

A docker containter to spin up the Firebase Emulator Suite for local development.

Currently configured to spin up Authentication, Firestore, and Storage. Edit the firebase.json details in the Dockerfile to adjust the settings.

# Usage

- Using docker compose: `docker-compose up`
- Using the docker cli:
  - `docker build -t docker-firebase .`
  - `docker run -p 4000:4000 -p 8085:8085 -p 9099:9099 -p 9199:9199 docker-firebase`
