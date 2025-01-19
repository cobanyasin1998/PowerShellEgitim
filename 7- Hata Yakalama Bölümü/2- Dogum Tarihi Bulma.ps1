function HesaplaYas($dogumTarihi){

try{
$tarih = Get-Date $dogumTarihi
$now = Get-Date
$yas = $now.Year - $tarih.Year - ($now.Month -lt $tarih.Month -or ($now.Month -and $now.Day -lt $tarih.Day))

Write-Host "Yaşınız : $yas"
}catch{
Write-Host "Hata: Geçersiz Hata Formatı: $_"
}
}

HesaplaYas "25.03.1998"