#Reference: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-supported-services

#Login to Azure Account 
Login-AzureRmAccount

#ProviderNameSpace and Locations 
Get-AzureRmResourceProvider | Select-Object ProviderNamespace, Locations | Sort-Object ProviderNamespace,ResourceTypes

#View resource types for a resource provider
(Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Web).ResourceTypes | Select-Object ResourceTypeName

#View valid API, locations for a resource type
Get-AzureRmResourceProvider -ProviderNamespace Microsoft.web  | Select-Object ResourceTypes,Locations | Sort-Object Locations

#View valid API for site respurce type
((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Web).ResourceTypes | Where-Object {$_.ResourceTypeName -eq 'Sites'}).ApiVersions

 


 


