FROM python:3.12-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://$GITHUB_ACCESS_TOKEN@$GITHUB_USERNAME/$GITHUB_REPO_NAME.git

WORKDIR /app/$GITHUB_REPO_NAME

RUN bash -c "$BUILD_COMMAND"

CMD bash -c "$RUN_COMMAND"