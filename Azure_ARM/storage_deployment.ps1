#create resource group 
$rgname = 'mynetwork'
New-AzResourceGroup -name $rgname -location "Central US" -force

#deploy the storage
New-AzResourceGroupDeployment -name "New-storage1" -resourcegroupname $rgname -templatefile 'C:\github_vscode\projects\azure_ARM\storage.json'


# SIG # Begin signature block
# MIIF1gYJKoZIhvcNAQcCoIIFxzCCBcMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQURyOCaYrMUAiuq3rKfE08jQMF
# QJqgggNOMIIDSjCCAjKgAwIBAgIQePhWFiGdWL5GuhWXo9HWlzANBgkqhkiG9w0B
# AQsFADA9MRMwEQYDVQQDDApEZXZpbiBCZWxsMSYwJAYJKoZIhvcNAQkBFhdkZXZp
# bmJlbGwyMDEzQHlhaG9vLmNvbTAeFw0yMTA3MjUxNDExNTlaFw0zMTAxMDEwNTAw
# MDBaMD0xEzARBgNVBAMMCkRldmluIEJlbGwxJjAkBgkqhkiG9w0BCQEWF2Rldmlu
# YmVsbDIwMTNAeWFob28uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
# AQEAt2dWK5itLIJleAl/10J9va4i81j4aJwZf1sKbclFoS32iQbO2y7Vm81G79aK
# SCNpWdhO0x90Ja9tEuLJTom68U84UBGETi6NLJ2Zq3r7vW9FuEPvkxO5B9QBC6/7
# EPY65cEJYPg59Cvdbd2mRpfGBcROCzlQ4tJoMvwNXayG6wxWDHKBlhoH1R3Nvmqf
# w4ywXS9i2YcAHrUN3F9v0hdKiTciLrukQk8ZMKwhGe5eMOCuE735krQ+ytFuKS68
# CqWF13W2sl6t3/gX/V/wl9eiWIJSiOvgp2yNdsQNkUnTcATtVsDicZKc47MDuoyI
# kbVEwtWda0TU+PADVleerl9t/QIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCBaAwEwYD
# VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFHa3o7QMQlGSSfvwih8ER9yLaxPh
# MA0GCSqGSIb3DQEBCwUAA4IBAQAfib1ZjREPkbBp/okpvMLYQPusMrE0UBsJaE0Z
# IvJHOUwT1NEz6D3LBCQd6XKWI7EYGBZDkOspT2gZtJJExgqUCV4ll6CoWTy7d3gp
# lhpt+byz9MzqxUGytPLW2OTAWxYPbUcPq7xaqGBAkaGINIPEW8yndwPuDXtcBMJG
# nIr3tIyX1wiDyYawodH/en3TXoKHovhoWDHewkO7yXdc5va1KHw01hwA6dABnhAB
# xUCFv/rS7HRUtNLZDXltiagwQRu7MQ0lXzDqq2ylVfr0P/wE0juW5uf+m7c607Wq
# 9Oddt7epDWTWcF4iwvBo5Ygv+LS7hZBGt/vIbMXsey4gAKHhMYIB8jCCAe4CAQEw
# UTA9MRMwEQYDVQQDDApEZXZpbiBCZWxsMSYwJAYJKoZIhvcNAQkBFhdkZXZpbmJl
# bGwyMDEzQHlhaG9vLmNvbQIQePhWFiGdWL5GuhWXo9HWlzAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUejMpVAiaFvL4iNa8q74F/FB4zxkwDQYJKoZIhvcNAQEBBQAEggEAVX8GGcA6
# BXd8nVzBP1Bd6O2z5wp5UFOSOEmHEkRQj+BN1OvM7Jqzk3frmkhvUOYNRMJbIZ4e
# q21MqIrtjxrd8PR3ypUliPRnxP0LJuE/malMFBX28nLGQ2qVEusNhH8UH8TMc55j
# gTVldm1Gbew4az3YK0FbJecqdIdQqtY28pkar4UGd0ysiqIglSgxia8dUlApTeFD
# TNgMas/+kL3culkoojCqpgr6duEtxSjsoFLYNq/dsm9Elx4VeJ34ZFodnRrz56O5
# 2ajzggacqIGlYq1o6Re7B4Wti7L/cI596azp2bHSfOG4o7beJ3vL303jURlBz0sZ
# x5lzVs01XPVXsA==
# SIG # End signature block
