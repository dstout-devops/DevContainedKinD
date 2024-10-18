FROM mcr.microsoft.com/devcontainers/base:debian

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get dist-upgrade -y

# install pipx and ansible https://pipx.pypa.io/stable/
RUN apt-get install -y pipx \
    && pipx ensurepath \
    && PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install --include-deps ansible \
    && PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx inject --include-apps ansible argcomplete \
    && activate-global-python-argcomplete

# install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg \
    && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list \
    && chmod 644 /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update && apt-get install -y kubectl

# install helm https://helm.sh/docs/intro/install/
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# install minikube https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fdebian+package
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb \
    && dpkg -i minikube_latest_amd64.deb

USER vscode