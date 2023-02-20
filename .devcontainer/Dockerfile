# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.183.0/containers/typescript-node/.devcontainer/base.Dockerfile

# [Choice] Node.js version: 16, 14, 12
ARG VARIANT="16-buster"
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${VARIANT}

RUN update-ca-certificates

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends chromium

ENV CHROME_BIN=/usr/bin/chromium


RUN wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip && \
    unzip ./terraform_1.3.7_linux_amd64.zip && \
    mv terraform /usr/local/bin && \ 
    rm ./terraform_1.3.7_linux_amd64.zip

RUN mkdir -p /etc/apt/keyrings
RUN curl -sLSk https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
RUN chmod go+r /etc/apt/keyrings/microsoft.gpg

RUN apt-get -y update \ 
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3-pip \
    python-is-python3 \
    azure-cli \
    golang-go \
    && pip install mdformat-gfm 

RUN curl -L https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get -y install nodejs \
    && apt-get -y update


RUN curl -L https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz > terraform-docs.tar.gz \
    && tar -xzf terraform-docs.tar.gz  \
    && chmod +x terraform-docs  \
    && mv terraform-docs /usr/bin/ \
    && rm -rf terraform-docs*

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node packages
# RUN su node -c "npm install -g <your-package-list -here>"