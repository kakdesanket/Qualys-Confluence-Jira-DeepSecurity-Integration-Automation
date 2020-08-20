Import-Module ConfluencePS
Import-Module PSSQLite

###Confluence Page Vulnerabilities by Severity###
Write-Host "###Confluence Page Vulnerabilities by Severity###" -ForegroundColor Red
Write-Host "Connecting to Confluence , please input credentials" -ForegroundColor Green
Set-ConfluenceInfo -BaseURI 'https://confluence.elkjop.com' -PromptCredentials
$Page1=Get-ConfluencePage -PageID 33895711
Write-Host "Fetching Information from Confluence for page" $Page1 -ForegroundColor Green
Write-Host "Current Data on Page :"
$Page1.Body
$Database="C:\Users\sanket\Desktop\Qualys.db"
Write-Host "Fetching Information from Database" -ForegroundColor Green
$Query1="SELECT Severity, COUNT(DISTINCT Title) AS Count FROM VulnerabilityDatabase GROUP BY Severity ORDER BY Severity"
$InPDatabase1=Invoke-SqliteQuery -Query $Query1 -DataSource $Database
$NormalizeData1=$InPDatabase1|ConvertTo-ConfluenceTable |ConvertTo-ConfluenceStorageFormat
Set-ConfluencePage -PageID 33895711 -Body $NormalizeData1
Write-Host "Updated Data on Page :"
$Page1.Body
Write-Host "#####End Confluence Page Vulnerabilities by Severity###" -ForegroundColor Red
#####End Confluence Page Vulnerabilities by Severity###


###Confluence Page Top 10 Vulnerabilities of the day ###
Write-Host "###Confluence Page Top 10 Vulnerabilities of the day ###" -ForegroundColor Red
$Page2=Get-ConfluencePage -PageID 33895589
Write-Host "Fetching Information from Confluence for page" $Page2 -ForegroundColor Green
Write-Host "Current Data on Page :"
$Page2.Body
Write-Host "Connecting to Confluence " -ForegroundColor Red
$Query2="SELECT Title AS Vulnerablity, COUNT(Severity) AS Occurence FROM VUlnerabilityDatabase WHERE Severity > 3 GROUP BY Title ORDER BY Occurence DESC LIMIT 10"
$InPDatabase2=Invoke-SqliteQuery -Query $Query2 -DataSource $Database
$NormalizeData2=$InPDatabase2|ConvertTo-ConfluenceTable |ConvertTo-ConfluenceStorageFormat
Set-ConfluencePage -PageID 33895589 -Body $NormalizeData2
Write-Host "Updated Data on Page :"
$Page2.Body
Write-Host "####End Confluence Page Top 10 Vulnerabilities of the day ###" -ForegroundColor Red
####End Confluence Page Top 10 Vulnerabilities of the day ###


###Confluence Page Distinct Vulnerability Database ###
Write-Host "###Confluence Page Distinct Vulnerability Database ###" -ForegroundColor Red
$Page3=Get-ConfluencePage -PageID 33894753
Write-Host "Fetching Information from Confluence for page" $Page3 -ForegroundColor Green
Write-Host "Current Data on Page :"
$Page3.Body
Write-Host "Connecting to Confluence " -ForegroundColor Red
#$Query3="SELECT DISTINCT IP, Title, Severity, Impact, Solution FROM VulnerabilityDatabase Limit 100"
$Query3="SELECT DISTINCT IP, Title, Severity FROM VulnerabilityDatabase ORDER by Severity DESC "
$InPDatabase3=Invoke-SqliteQuery -Query $Query3 -DataSource $Database
$NormalizeData3=$InPDatabase3|ConvertTo-ConfluenceTable |ConvertTo-ConfluenceStorageFormat
Set-ConfluencePage -PageID 33894753 -Body $NormalizeData3
Write-Host "Updated Data on Page :"
$Page3.Body
Write-Host "####End Confluence Page Distinct Vulnerability Database ###" -ForegroundColor Red
####End Confluence Page Distinct Vulnerability Database ###


###Confluence Page Deep Security Database ###
Write-Host "###Confluence Page Deep Security Database ###" -ForegroundColor Red
$Page4=Get-ConfluencePage -PageID 33898285
Write-Host "Fetching Information from Confluence for page" $Page3 -ForegroundColor Green
Write-Host "Current Data on Page :"
$Page4.Body
Write-Host "Connecting to Confluence " -ForegroundColor Red
$Query4="SELECT DISTINCT * FROM DeepSecurity "
$InPDatabase4=Invoke-SqliteQuery -Query $Query4 -DataSource $Database
$NormalizeData4=$InPDatabase4|ConvertTo-ConfluenceTable |ConvertTo-ConfluenceStorageFormat
Set-ConfluencePage -PageID 33898285 -Body $NormalizeData4
Write-Host "Updated Data on Page :"
$Page4.Body
Write-Host "####End Confluence Page Distinct Vulnerability Database ###" -ForegroundColor Red
####End Confluence Page Distinct Vulnerability Database ###