#Reference: https://docs.microsoft.com/en-us/azure/azure-resource-manager/powershell-azure-resource-manager

#Basic and Login
{
#Check your version of the Azure Resources module
Get-Module -ListAvailable -Name AzureRm.Resources | Select Version

#Login into Azure Account
Login-AzureRmAccount

#View all the subscriptiona
Get-AzureRmSubscription

#Switch to a different subscription 
Set-AzureRmContext -SubscriptionName "<SubscriptionName>"

#Alternative 
Login-AzureRmAccount -SubscriptionId "<GUID>"
Login-AzureRmAccount -SubscriptionName "<Name>"
}

#Resource Groups
{
#Create a Resource Group
New-AzureRmResourceGroup -Name TestRG -Location "North Europe"

#To retrieve the resource group
Get-AzureRmResourceGroup -ResourceGroupName TestRG

#To get all the resource groups in your subscription
Get-AzureRmResourceGroup

#Add resources to a resource group
New-AzureRmStorageAccount -ResourceGroupName TestRG -AccountName mystoragenameunique123 -Type "Standard_LRS" -Location "North Europe"

#Retrieve Storage Account 
Get-AzureRmResource -ResourceName mystoragenameunique123 -ResourceGroupName TestRG
}

#Tagging Resources
{
#Add Tag
Set-AzureRmResource -Tag @{ CostCenter="Services"; Environment="Demo" } -ResourceName mystoragenameunique123 -ResourceGroupName TestRG -ResourceType Microsoft.Storage/storageAccounts

#Append Tags - To add a tag to a resource that already includes tags, first retrieve the existing tags.
$tags = (Get-AzureRmResource -ResourceName mystoragenameunique123 -ResourceGroupName TestRG).Tags
$tags += @{Status="Approved"}
Set-AzureRmResource -Tag $tags -ResourceName mystoragenameunique123 -ResourceGroupName TestRG -ResourceType Microsoft.Storage/storageAccounts
}

#Search
{
#Search for resources
Find-AzureRmResource -ResourceNameContains mystoragenameunique123

#Get all the resources in a resource group
Find-AzureRmResource -ResourceGroupNameContains TestRG

#Get all the resources with a tag name and value,
Find-AzureRmResource -TagName Environment -TagValue Demo

#Get all the resources with a particular resource type
Find-AzureRmResource -ResourceType Microsoft.Storage/storageAccounts
}

#Locking Resources
{
    # Apply cannot delete lock
    New-AzureRmResourceLock -LockLevel CanNotDelete -LockName LockStorage -ResourceName mystoragenameunique123 -ResourceType Microsoft.Storage/storageAccounts -ResourceGroupName TestRG
    
    # Remove Lock
    Remove-AzureRmResourceLock -LockName LockStorage -ResourceName mystoragenameunique123 -ResourceType Microsoft.Storage/storageAccounts -ResourceGroupName TestRG

}

#Delete a resource group
{
    #Remove resources or resource group
    Remove-AzureRmResource -ResourceName mystoragenameunique123 -ResourceType Microsoft.Storage/storageAccounts -ResourceGroupName TestRG

    #Remove resource group
    Remove-AzureRmResourceGroup -Name TestRG
}