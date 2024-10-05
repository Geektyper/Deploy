import subprocess
from config import *

clone_cmd = f'git clone https://{GITHUB_ACCESS_TOKEN}@github.com/{GITHUB_USERNAME}/{GITHUB_REPO_NAME}'
cd_cmd = f'cd {GITHUB_REPO_NAME}'

if __name__ == '__main__':
    subprocess.run(clone_cmd.split())
    subprocess.run(cd_cmd.split())
    subprocess.run(BUILD_COMMAND.split())
    subprocess.run(RUN_COMMAND.split())
