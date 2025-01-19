$dizi = @(1,2,3,4,5,6,7,8,9,0)

foreach($eleman in $dizi){
Write-Host $eleman
}

$sehirler = @("Ankara","İstanbul","Kocaeli");

for($i = 0; $i -le 3; $i++){
Write-Host $sehirler[$i]
}

$flag = 1
while($flag -le 5){
    Write-Host $flag
    $flag++;
}