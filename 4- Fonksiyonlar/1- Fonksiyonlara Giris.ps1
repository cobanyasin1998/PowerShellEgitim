function MerhabaDunya{
Write-Host "Merhaba Dunya"
}

function Toplama($sayi1,$sayi2){
    $sonuc = [int]$sayi1 + [int]$sayi2;
    Write-Host "Toplam: $sonuc" 
}
function Toplam($sayi1,$sayi2){
   return $sonuc = [int]$sayi1 + [int]$sayi2;
    
}

function YaziYaz($metin,[switch]$buyukHarf){
if($buyukHarf){
Write-Host $metin.ToUpper()
}
else{
Write-Host $metin
}}