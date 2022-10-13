FROM ubuntu:20.04
# Author: Harald S. Fianbakken
# Description: Latest Azure tools + CLI + Powershell modules
# Also includes Microsoft genomics which is a bit hassle with the versioning.
# Automatically pushed to docker hub by github 

RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common
# RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y
RUN add-apt-repository universe
RUN apt-get install -y powershell
RUN apt-get -y install sudo
RUN apt-get upgrade -y
RUN apt-get install -y curl 
RUN apt-get install -y python2.7 
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN apt-get install -y build-essential libssl-dev libffi-dev libpython2-dev python-dev 
RUN apt-get install -y azure-functions-core-tools-4
RUN apt-get install -y git
RUN pwsh -Command "&{Install-Module -Name Az -AllowClobber -Scope AllUsers -Force}"
RUN pwsh -Command "&{Install-Module -Name Az.ResourceGraph -AllowClobber -Scope AllUsers -Force}"
RUN pwsh -Command "&{Install-Module -Name SqlServer -AllowClobber -Scope AllUsers -Force}"

# AzureCLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# PIP WITH Python2.7 is deprecated. Also - msgen only supporting Python2.7 .
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python get-pip.py

# Microsoft Genomics
RUN pip install --upgrade --no-deps msgen
RUN pip install msgen

# Bicep on cli
RUN az bicep install

RUN apt-get install zip unzip
# Bicep on Powershell
# Fetch the latest Bicep CLI binary
RUN curl -Lo bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64
# Mark it as executable
RUN chmod +x ./bicep
# Add bicep to your PATH (requires admin)
RUN mv ./bicep /usr/local/bin/bicep
# AZcopy
RUN curl -Lo azcopy.tar https://aka.ms/downloadazcopy-v10-linux
RUN mkdir azcopy
RUN tar -xvf azcopy.tar -C ./azcopy/ 
RUN FP=$(find ./azcopy -name azcopy -type f);mv $FP /usr/local/bin/
RUN chmod +x /usr/local/bin/azcopy
# Download latest kubectl & helm

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
# 
# Verify you can now access the 'bicep' command

RUN wget -O /tmp/arm-ttk.zip https://aka.ms/arm-ttk-latest

RUN useradd -m azureuser
USER azureuser
# Can always use the container/run interactive witH docker run -it haraldf/azuretools:latest
RUN mkdir $HOME/git
RUN mkdir -p $HOME/.local/share/powershell/Modules/;
RUN unzip /tmp/arm-ttk.zip -d $HOME/.local/share/powershell/Modules/
CMD [ "pwsh" ]
