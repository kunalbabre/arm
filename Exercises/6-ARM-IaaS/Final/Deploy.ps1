#Login-AzureRmAccount -SubscriptionName "<SubscriptionName>"

Login-AzureRmAccount

$rg="Demo-RG-IaaS2"
$loc="South Central US"
$tf = ".\azuredeploy.json"
$tpf =".\azuredeploy.parameters.json"
$vmCount = 2
$dnsp = "kb123455-u"

#Create RG
New-AzureRmResourceGroup -Name $rg -Location $loc

#Validate
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -virtualMachineCount $vmCount -Verbose

#Validate - debug errors
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -virtualMachineCount $vmCount -Verbose -Debug

#Fix and Validate
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -virtualMachineCount $vmCount -dnsPrefixForPublicIP $dnsp -Verbose -Debug

#Deploy
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -virtualMachineCount $vmCount -dnsPrefixForPublicIP $dnsp -Verbose 
