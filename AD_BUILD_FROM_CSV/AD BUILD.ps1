﻿<# SCRIPT TO IMPORT DATA FROM CSV INTO ADUSERS, 
THEN MOVE USERS INTO OUs BY STATE, 
THEN CREATE DISTRO GROUP WITH EVERYONE IN EACH STATE#>

#IMPORT DATA                                                                                  REMOVES ANY DUPLICATE ACCOUNTS
$csvinfo = import-csv -LiteralPath "C:\github\Projects\AD_BUILD_FROM_CSV\medfakeinfo.txt" | sort-Object -property username -Unique

#FOREACH LOOP TO CREATE ADUSER FOR EACH ROW FROM CSV.
$csvinfo | ForEach-Object{ 
New-ADUser -name $_.name -GivenName $_.givenname -Surname $_.surname -StreetAddress $_.streetaddress -City $_.city -State $_.statefull  `
-EmailAddress $_.emailaddress -UserPrincipalName $_.username -MobilePhone $_.telephonenumber -Company $_.company -DisplayName $_.name  `
 -PostalCode $_.zipcode -SamAccountName $_.username -OtherAttributes @{'title' = $_.occupation; 'carLicense' = $_.vehicle ; 'Middlename' = $_.middleinitial}

 $userDname = ((get-aduser -filter * -Properties *) | Where-Object name -eq $_.name) | Select-Object distinguishedname

#SET ACCOUNT PASSWORD FOR EACH USER
Set-ADAccountPassword -Identity $userDname -OldPassword $null -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $_.password -force) 

#ENABLE EACH ACCOUNT FOR USE
Enable-ADAccount -Identity $userDname 
}

<#IF STATEMENT TO CREATE OU IF NOT ALREADY CREATED..
OR MOVE ADUSER INTO THE OU ORGANIZED BY STATE#>

$user=get-aduser -filter * -Properties state
#count AD users ....make count into a function
function Count-ADusers {
     param (
          [int]$count=$user.count
     )
     write-information -messagedata "there are $count users in active directory." -InformationAction Continue
}

#call the function
Count-ADusers

#FOREACH TO CHECK IF EACH USER MATCHES AN OU AND IF SO MOVE IT IF NOT CREATE IT THEN MOVE IT
$user | 
     ForEach-Object -process {
          #parameters
          $ou = Get-ADOrganizationalUnit -filter * | Where-Object name -eq $_.state
          $nullstatement = Write-information -MessageData "Not Moving $adName account" -InformationAction Continue
          $adname = $_.Name
          $group = Get-ADGroup -filter * | Where-Object name -eq $_.state

          if($null -eq $_.state) {
               $nullstatement
          } else { 
               if($ou) {
                    Move-ADObject -Identity $_.distinguishedname -TargetPath $ou.distinguishedname 
                    } else { 
                         New-ADOrganizationalUnit -name $_.state -Path "DC=BELL,DC=LOCAL" -ProtectedFromAccidentalDeletion $false;

                         if($ou) {
                              Move-ADObject -Identity $_.distinguishedname -TargetPath $ou.distinguishedname 
                                 } 
                         }
               }
     
#CREATE A DISTRO GROUP IN EACH OU AND ALL MEMBERS OF THE OU TO THE GROUP
          if($null -eq $_.state) {
               $nullstatement
          } else {
               
               if($group) {
                    add-adgroupmember -Members $_ -Identity $group.distinguishedname 
               } else {
                    New-ADgroup -name $_.state -GroupScope Global -GroupCategory Distribution -Path $ou.DistinguishedName
                     if($group) {
                         add-adgroupmember -Members $_ -Identity $group.distinguishedname 
                         } else { 
                              $nullstatement
                         }
                    } 
               }
          }





#REMOVE ALL CREATED USERS AND OUs TO RETEST
get-aduser -Properties * -filter * | Where-Object -Property state -ne $null | remove-aduser
Get-ADGroup -filter * | Where-Object -Property name -eq 'alabama' | Remove-ADGroup
Get-ADOrganizationalUnit -filter * | Where-Object -Property name -ne "Domain Controllers" | Remove-ADOrganizationalUnit