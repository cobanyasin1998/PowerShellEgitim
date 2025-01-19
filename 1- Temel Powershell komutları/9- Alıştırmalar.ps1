# Öðrenci listesi oluþturma
$ogrenciListesi = New-Object System.Collections.ArrayList

# Öðrenci nesnelerini oluþturma
$ogrenci1 = @{
    "ad" = "Ali"
    "soyad"= "Veli"
    "numara" = "123"
}

$ogrenci2 = @{
    "ad" = "Yasin"
    "soyad"= "Çoban"
    "numara" = "321"
}

# Öðrencileri listeye ekleme
$ogrenciListesi.Add($ogrenci1) > $null # Add metodu bir sonuç döndürür, bu sonucu görmezden gelmek için > $null kullanýyoruz.
$ogrenciListesi.Add($ogrenci2) > $null

# Öðrenci bilgilerini yazdýrma
Write-Host "Öðrenci Listesi:"
Write-Host "----------------"

foreach ($ogrenciNesnesi in $ogrenciListesi) {
    Write-Host "Adý     : $($ogrenciNesnesi['ad'])"
    Write-Host "Soyadý  : $($ogrenciNesnesi['soyad'])"
    Write-Host "Numara  : $($ogrenciNesnesi['numara'])"
    Write-Host "----------------"
}
