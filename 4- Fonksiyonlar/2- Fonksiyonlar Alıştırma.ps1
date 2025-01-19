function ToplaVeCarp($sayi1,$sayi2){
$toplam = $sayi1 + $sayi2;
$carpim = $sayi1 * $sayi2;

return $toplam, $carpim;
}

$sayi1 = Read-Host "Lütfen 1. sayıyı giriniz"


$sayi2 = Read-Host "Lütfen 2. sayıyı giriniz"

if($sayi1 -match '^\d+$' -and $sayi2 -match '^\d+$')
{
$sayi1 = [int]$sayi1
$sayi2 = [int]$sayi2
$toplam,$carpim = ToplaVeCarp $sayi1 $sayi2
Write-Host "Toplam: $toplam"
Write-Host "Çarpım: $carpim"
}
else{
Write-Host "Hatalı Giriş"
}


