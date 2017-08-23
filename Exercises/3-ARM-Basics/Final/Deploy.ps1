Set-Location -Path "<YourPath>\Lab1\"
Login-AzureRmAccount -SubscriptionName "<Subscription Name>"

$rg="Demo-RG"
$loc="North Europe"
$tf = ".\azuredeploy.json"
$tpf =".\azuredeploy.parameters.json"

#Create RG
New-AzureRmResourceGroup -Name $rg -Location $loc

#Validate
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile "$tf" -TemplateParameterFile "$tpf" -Verbose

#Deploy
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -Verbose 

#Deploy - pass paramneters 
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -p-string "Hello World 2"

#Deploy Failing 
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -p-string "Hello World"
