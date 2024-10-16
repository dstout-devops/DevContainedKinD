FROM mcr.microsoft.com/devcontainers/base:bookworm

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get dist-upgrade -y

# install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN chmod 644 /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# install helm https://helm.sh/docs/intro/install/
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# install minikube https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fdebian+package
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
RUN dpkg -i minikube_latest_amd64.deb

USER vscode