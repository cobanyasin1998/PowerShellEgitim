$sayi = Read-Host "Bir Sayı Giriniz"
$sayi = [int]$sayi
Write-Host $sayi

if($sayi -gt 0)
{
    Write-Host "Girilen Sayı Pozitiftir"
}
elseif($sayi -lt 0) {
    Write-Host "Girilen Sayı Negatiftir"

}

else {
Write-Host "Girilen Sayı 0'dır"
}