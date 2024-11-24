ARG GITHUB_USERNAME=""        # Github Username of Repo Owner.
ARG GITHUB_REPO_NAME=""       # Repo Name, Ex: If the URL is https://github.com/username/repo_name, Enter the repo_name.
ARG GITHUB_ACCESS_TOKEN=""    # Your Github Access Token.

ARG BUILD_COMMAND=""          # For Installing Requirements, Ex: pip install -r requirements.txt.
ARG RUN_COMMAND=""            # The Main Command, Ex: python3 main.py.

# ----------------------------------------------------------

FROM python:3.12-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://$GITHUB_ACCESS_TOKEN@$GITHUB_USERNAME/$GITHUB_REPO_NAME.git

WORKDIR /app/$GITHUB_REPO_NAME

RUN bash -c "$BUILD_COMMAND"

CMD bash -c "$RUN_COMMAND"
