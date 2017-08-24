#Login-AzureRmAccount -SubscriptionName "<SubscriptionName>"

$rg="Demo-RG-PaaS"
$loc="South Central US"
$tf = ".\azuredeploy.json"
$tpf =".\azuredeploy.parameters.json"
$uDNS = $rg + "-TM"
$uDNSWA = $rg + "-WA"

#Create RG
New-AzureRmResourceGroup -Name $rg -Location $loc

#Validate
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf  -uniqueDnsName $uDNS -uniqueDnsNameForWebApp $uDNSWA -Verbose  

#Deploy
NEW-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $tf -TemplateParameterFile $tpf -uniqueDnsName $uDNS -uniqueDnsNameForWebApp $uDNSWA  -Verbose -Mode Incremental
