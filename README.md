# Node Dev Container

**Ultimate NodeJS development container for Visual Studio Code**

[![Build status](https://github.com/qdm12/nodedevcontainer/actions/workflows/latest.yml/badge.svg)](https://github.com/qdm12/nodedevcontainer/actions/workflows/latest.yml)

[![dockeri.co](https://dockeri.co/image/qmcgaw/nodedevcontainer)](https://hub.docker.com/r/qmcgaw/nodedevcontainer)

![Last Docker tag](https://img.shields.io/docker/v/qmcgaw/nodedevcontainer?sort=semver&label=Last%20Docker%20tag)
[![Latest size](https://img.shields.io/docker/image-size/qmcgaw/nodedevcontainer/latest?label=Latest%20image)](https://hub.docker.com/r/qmcgaw/nodedevcontainer/tags)

![Last release](https://img.shields.io/github/release/qdm12/nodedevcontainer?label=Last%20release)
[![Last release size](https://img.shields.io/docker/image-size/qmcgaw/nodedevcontainer?sort=semver&label=Last%20released%20image)](https://hub.docker.com/r/qmcgaw/nodedevcontainer/tags?page=1&ordering=last_updated)
![GitHub last release date](https://img.shields.io/github/release-date/qdm12/nodedevcontainer?label=Last%20release%20date)
![Commits since release](https://img.shields.io/github/commits-since/qdm12/nodedevcontainer/latest?sort=semver)

[![GitHub last commit](https://img.shields.io/github/last-commit/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/commits/main)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/graphs/contributors)
[![GitHub closed PRs](https://img.shields.io/github/issues-pr-closed/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/pulls?q=is%3Apr+is%3Aclosed)
[![GitHub issues](https://img.shields.io/github/issues/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/qdm12/nodedevcontainer.svg)](https://github.com/qdm12/nodedevcontainer/issues?q=is%3Aissue+is%3Aclosed)

[![Lines of code](https://img.shields.io/tokei/lines/github/qdm12/nodedevcontainer)](https://github.com/qdm12/nodedevcontainer)
![Code size](https://img.shields.io/github/languages/code-size/qdm12/nodedevcontainer)
![GitHub repo size](https://img.shields.io/github/repo-size/qdm12/nodedevcontainer)

![Visitors count](https://visitor-badge.laobi.icu/badge?page_id=nodedevcontainer.readme)

## Features

- Based on [qmcgaw/basedevcontainer](https://github.com/qdm12/basedevcontainer):
  - Alpine 3.19 with minimal custom terminal and packages
  - Nodejs, npm and yarn downloaded as Alpine packages
  - See more [features](https://github.com/qdm12/basedevcontainer#features)
  - Minimal custom terminal and packages
  - See more [features](https://github.com/qdm12/basedevcontainer#features)
- Globally installed: `nodemon` and `jest`
- Cross platform
  - Easily bind mount your SSH keys to use with **git**
  - Manage your host Docker from within the dev container, more details at [qmcgaw/basedevcontainer](https://github.com/qdm12/basedevcontainer#features)
- Extensible with docker-compose.yml
- 'Minimal' size of **535MB**
- Comes with extra Go binary tools for a few extra MBs: `kubectl`, `kubectx`, `kubens`, `stern` and `helm`

## Requirements

- [Docker](https://www.docker.com/products/docker-desktop) installed and running
  - If you don't use Linux or Windows with WSL, share the directory `~/.ssh` and the directory of your project with Docker Desktop
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- [VS code](https://code.visualstudio.com/download) installed
- [VS code remote containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed

## Setup for a project

1. Setup your configuration files
    - With style 💯

        ```sh
        docker run -it --rm -v "/yourrepopath:/repository" qmcgaw/devtainr:v0.2.0 -dev node -path /repository -name projectname
        ```

        Or use the [built binary](https://github.com/qdm12/devtainr#binary)
    - Or manually: download this repository and put the [.devcontainer](.devcontainer) directory in your project.
1. If you have a *.vscode/settings.json*, eventually move the settings to *.devcontainer/devcontainer.json* in the `"settings"` section as *.vscode/settings.json* take precedence over the settings defined in *.devcontainer/devcontainer.json*.
1. Open the command palette in Visual Studio Code (CTRL+SHIFT+P) and select `Remote-Containers: Open Folder in Container...` and choose your project directory

## Customization

See the [.devcontainer/README.md](.devcontainer/README.md) document in your repository.

## License

This repository is under an [MIT license](https://github.com/qdm12/nodedevcontainer/master/LICENSE) unless indicated otherwise.
