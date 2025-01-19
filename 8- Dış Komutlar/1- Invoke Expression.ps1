Invoke-Expression -Command "Get-Process"
Invoke-Expression -Command "ipconfig"


$veriAl = Read-Host "Lütfen ip bilgilerini almak için 1 tuşuna basınız"

if($veriAl -eq 1){
Invoke-Expression -Command "ipconfig"
}