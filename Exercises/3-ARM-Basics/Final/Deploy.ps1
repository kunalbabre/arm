Set-Location -Path "<YourPath>\Lab1\"
Login-AzureRmAccount -SubscriptionName "<Subscription Name>"

$rg="Demo-RG"
$loc="North Europe"
$tf = ".\azuredeploy.json"
$tpf =".\azuredeploy.parameters.json"

$ss =  ConvertTo-SecureString "secre@t!" -AsPlainText -Force

#Create RG
New-AzureRmResourceGroup -Name $rg -Location $loc

#Validate
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile "$tf" -TemplateParameterFile "$tpf" -Verbose

#Deploy
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -Verbose 

#Deploy - pass parameters, securestring
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -p-string "Hello World 2" -p-securestring $ss

#Deploy Failing 
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -p-string "Hello World"
