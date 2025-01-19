$dizi = @(20,40,60,80)

$dizi

foreach ($eleman in $dizi){
Write-Host $eleman
}

 
$dizi += 45

$dizi +=99

$eleman = 40
Write-Host "Çıkarılmadan önceki hali"
$dizi
$dizi = $dizi | Where-Object {$_ -ne $eleman}
Write-Host "Çıkarıldıktan sonra hali"
#clear
$dizi