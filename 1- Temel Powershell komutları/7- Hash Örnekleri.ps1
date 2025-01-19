$personel = @{

"ad" = "yasin"
"soyad" = "çoban"
"yas"= 26
"departman" = "Bilişim Teknolojileri"

}

foreach($gezici in $personel.Keys){
    Write-Host "$gezici : $($personel[$gezici])"
}