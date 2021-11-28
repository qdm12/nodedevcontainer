ARG BASEDEV_VERSION=v0.5.0

ARG KUBECTL_VERSION=v1.22.4
ARG STERN_VERSION=v1.20.1
ARG KUBECTX_VERSION=v0.9.4
ARG KUBENS_VERSION=v0.9.4
ARG HELM_VERSION=v3.6.3

FROM qmcgaw/binpot:kubectl-${KUBECTL_VERSION} AS kubectl
FROM qmcgaw/binpot:stern-${STERN_VERSION} AS stern
FROM qmcgaw/binpot:kubectx-${KUBECTX_VERSION} AS kubectx
FROM qmcgaw/binpot:kubens-${KUBENS_VERSION} AS kubens
FROM qmcgaw/binpot:helm-${HELM_VERSION} AS helm

FROM qmcgaw/basedevcontainer:${BASEDEV_VERSION}-alpine
ARG CREATED
ARG COMMIT
ARG VERSION=local
LABEL \
    org.opencontainers.image.authors="quentin.mcgaw@gmail.com" \
    org.opencontainers.image.created=$CREATED \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.url="https://github.com/qdm12/nodedevcontainer" \
    org.opencontainers.image.documentation="https://github.com/qdm12/nodedevcontainer" \
    org.opencontainers.image.source="https://github.com/qdm12/nodedevcontainer" \
    org.opencontainers.image.title="Node Dev container" \
    org.opencontainers.image.description="NodeJS development container for Visual Studio Code Remote Containers development"
# Install Alpine packages
RUN apk add -q --update --progress --no-cache nodejs npm yarn
# Setup shells
COPY shell/.zshrc-specific shell/.welcome.sh /root/
# Sets directories for NPM global packages
ENV NODE_PATH="/root/.npm-packages/lib/node_modules" \
    MANPATH="/root/.npm-packages/share/man"
RUN echo "prefix = /root/.npm-packages" >> /root/.npmrc
ENV PATH=/root/.npm-packages/bin:$PATH
# Install some global NPM packages
RUN yarn global add -g nodemon jest
# Fix ownership and permissions of anonymous volume 'node_modules'
VOLUME [ "/workspace/node_modules" ]
RUN mkdir -p /workspace/node_modules && \
    chmod 700  /workspace/node_modules

# Extra binary tools
COPY --from=kubectl /bin /usr/local/bin/kubectl
COPY --from=stern /bin /usr/local/bin/stern
COPY --from=kubectx /bin /usr/local/bin/kubectx
COPY --from=kubens /bin /usr/local/bin/kubens
COPY --from=helm /bin /usr/local/bin/helm
