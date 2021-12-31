@allowed(['dev','test','prod'])
param environment string = 'dev'

var containerRegName = ''
var keyvaultName = ''
var storageName = ''

resource storageAccount 'Microsoft.Storage/storageAccounts' = {
  name: '$containerRegName'; 

}

output storageName string = storageAccount.name;
output keyvaultName string = keyvaultName.name;
output containerFqdn string = containerReg.properties.dnsSettings.fqdn;
