FROM haraldf/azuretools:latest
# Author: Harald S. Fianbakken
# Adds .NET development tools from base AzureTool image

USER root
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
RUN rm -f packages.microsoft.gpg
RUN apt install apt-transport-https
RUN apt update
RUN apt-get upgrade -y
RUN apt install code -y

RUN apt-get install -y dotnet-sdk-6.0
RUN apt-get install -y nodejs

USER azureuser
# Can always use the container/run interactive witH docker run -it haraldf/dotnetcoreazure:latest
CMD [ "pwsh" ]