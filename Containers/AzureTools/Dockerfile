FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common
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

RUN apt-get install -y git
RUN pwsh -Command "&{Install-Module -Name Az -AllowClobber -Scope AllUsers -Force}"
# AzureCLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# PIP WITH Python2.7 is deprecated. Also - msgen only supporting Python2.7 .
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python get-pip.py

# Microsoft Genomics
RUN pip install --upgrade --no-deps msgen
RUN pip install msgen

RUN useradd -m azureuser
USER azureuser

RUN mkdir $HOME/git
CMD [ "pwsh" ]