try{
$bol = 10/0
}
catch{
Write-Host "Bölme İşlemi Hatası, bir sayı sıfıra bölünemez: $_"
}