param (
    [Parameter(Mandatory=$true)][string] $access_token,
    [Parameter(Mandatory=$true)][string] $client_secret,
    [Parameter(Mandatory=$true)][string] $client_token,
    [Parameter(Mandatory=$true)][string] $api_host,
    [Parameter(Mandatory=$true)][string] $network,
    [Parameter(Mandatory=$true)][string] $urlToPurge
)

Write-Output '-------------------'
Write-Output 'Akamai Fast Purge'
Write-Output '-------------------'
Write-Output 'Attempting to purge:'
Write-Output $urlToPurge

                    
. .\Invoke-AkamaiOPEN.ps1   -Method POST `
                            -ClientToken "$client_token" `
                            -ClientAccessToken "$access_token" `
                            -ClientSecret "$client_secret" `
                            -ReqURL "https://$api_host/ccu/v3/invalidate/url/$network" `
                            -Body "{`"objects`":[`"$urlToPurge`"]}"

