# Node Dev Container

**Ultimate NodeJS development container for Visual Studio Code**

[![nodedevcontainer](https://github.com/qdm12/nodedevcontainer/raw/master/title.png)](https://hub.docker.com/r/qmcgaw/nodedevcontainer)

[![Build Status](https://travis-ci.org/qdm12/nodedevcontainer.svg?branch=master)](https://travis-ci.org/qdm12/nodedevcontainer)
[![Docker Pulls](https://img.shields.io/docker/pulls/qmcgaw/nodedevcontainer.svg)](https://hub.docker.com/r/qmcgaw/nodedevcontainer)
[![Docker Stars](https://img.shields.io/docker/stars/qmcgaw/nodedevcontainer.svg)](https://hub.docker.com/r/qmcgaw/nodedevcontainer)
[![Image size](https://images.microbadger.com/badges/image/qmcgaw/nodedevcontainer.svg)](https://microbadger.com/images/qmcgaw/nodedevcontainer)
[![Image version](https://images.microbadger.com/badges/version/qmcgaw/nodedevcontainer.svg)](https://microbadger.com/images/qmcgaw/nodedevcontainer)

[![Join Slack channel](https://img.shields.io/badge/slack-@qdm12-yellow.svg?logo=slack)](https://join.slack.com/t/qdm12/shared_invite/enQtOTE0NjcxNTM1ODc5LTYyZmVlOTM3MGI4ZWU0YmJkMjUxNmQ4ODQ2OTAwYzMxMTlhY2Q1MWQyOWUyNjc2ODliNjFjMDUxNWNmNzk5MDk)
[![GitHub last commit](https://img.shields.io/github/last-commit/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/issues)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/issues)
[![GitHub issues](https://img.shields.io/github/issues/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/issues)

## Features

- Based on [qmcgaw/basedevcontainer](https://github.com/qdm12/basedevcontainer):
    - Alpine 3.11 with minimal custom terminal and packages
    - Nodejs, npm and yarn downloaded as Alpine packages
    - See more [features](https://github.com/qdm12/basedevcontainer#features)
- Globally installed: `nodemon` and `jest`
- Cross platform
    - Easily bind mount your SSH keys to use with **git**
    - Manage your host Docker from within the dev container, more details at [qmcgaw/basedevcontainer](https://github.com/qdm12/basedevcontainer#features)
- Extensible with docker-compose.yml
- 'Minimal' size of **324MB**

## Requirements

- [Docker](https://www.docker.com/products/docker-desktop) installed and running
    - If you don't use Linux, share the directories `~/.ssh` and the directory of your project with Docker Desktop
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- [VS code](https://code.visualstudio.com/download) installed
- [VS code remote containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed

## Setup for a project

1. Download this repository and put the `.devcontainer` directory in your project.
   Alternatively, use this shell script from your project path

    ```sh
    # we assume you are in /yourpath/myproject
    mkdir .devcontainer
    cd .devcontainer
    wget -q https://raw.githubusercontent.com/qdm12/nodedevcontainer/master/.devcontainer/devcontainer.json
    wget -q https://raw.githubusercontent.com/qdm12/nodedevcontainer/master/.devcontainer/docker-compose.yml
    ```

1. If you have a *.vscode/settings.json*, eventually move the settings to *.devcontainer/devcontainer.json* in the `"settings"` section as *.vscode/settings.json* take precedence over the settings defined in *.devcontainer/devcontainer.json*.
1. Open the command palette in Visual Studio Code (CTRL+SHIFT+P) and select `Remote-Containers: Open Folder in Container...` and choose your project directory

## More

### devcontainer.json

- You can change the `"postCreateCommand"` to be relevant to your situation. In example it could be `npm install && npm start` to combine two commands
- You can change the extensions installed in the Docker image within the `"extensions"` array
- Other Node settings can be changed or added in the `"settings"` object.

### docker-compose.yml

- You can publish a port to access it from your host
- Add containers to be launched with your development container. In example, let's add a postgres database.
    1. Add this block to `.devcontainer/docker-compose.yml`

        ```yml
          database:
            image: postgres
            restart: always
            environment:
              POSTGRES_PASSWORD: password
        ```

    1. In `.devcontainer/devcontainer.json` change the line `"runServices": ["vscode"],` to `"runServices": ["vscode", "database"],`
    1. In the VS code command palette, rebuild the container

### Development image

- You can build the development image yourself:

    ```sh
    docker build -t qmcgaw/nodedevcontainer https://github.com/qdm12/nodedevcontainer.git
    ```

- You can extend the Docker image `qmcgaw/nodedevcontainer` with your own instructions.

    1. Create a file `.devcontainer/Dockerfile` with `FROM qmcgaw/nodedevcontainer`
    1. Append instructions to the Dockerfile created. For example:
        - Add more Go packages and add an alias

            ```Dockerfile
            FROM qmcgaw/nodedevcontainer
            RUN npm install -g jest
            RUN echo "alias ls='ls -al'" >> ~/.zshrc
            ```

        - Add some Alpine packages, you will need to switch to `root`:

            ```Dockerfile
            FROM qmcgaw/nodedevcontainer
            USER root
            apk add bind-tools
            USER vscode
            ```

    1. Modify `.devcontainer/docker-compose.yml` and add `build: .` in the vscode service.
    1. Open the VS code command palette and choose `Remote-Containers: Rebuild container`

- You can bind mount a shell script to `/home/vscode/.welcome.sh` to replace the [current welcome script](shell/.welcome.sh)

## TODOs

- [qmcgaw/basedevcontainer](https://github.com/qdm12/basedevcontainer) todos
- Compatibility with `arm/v8` and `arm/v7`

## License

This repository is under an [MIT license](https://github.com/qdm12/nodedevcontainer/master/LICENSE) unless indicated otherwise.
