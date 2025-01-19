# ��renci listesi olu�turma
$ogrenciListesi = New-Object System.Collections.ArrayList

# ��renci nesnelerini olu�turma
$ogrenci1 = @{
    "ad" = "Ali"
    "soyad"= "Veli"
    "numara" = "123"
}

$ogrenci2 = @{
    "ad" = "Yasin"
    "soyad"= "�oban"
    "numara" = "321"
}

# ��rencileri listeye ekleme
$ogrenciListesi.Add($ogrenci1) > $null # Add metodu bir sonu� d�nd�r�r, bu sonucu g�rmezden gelmek i�in > $null kullan�yoruz.
$ogrenciListesi.Add($ogrenci2) > $null

# ��renci bilgilerini yazd�rma
Write-Host "��renci Listesi:"
Write-Host "----------------"

foreach ($ogrenciNesnesi in $ogrenciListesi) {
    Write-Host "Ad�     : $($ogrenciNesnesi['ad'])"
    Write-Host "Soyad�  : $($ogrenciNesnesi['soyad'])"
    Write-Host "Numara  : $($ogrenciNesnesi['numara'])"
    Write-Host "----------------"
}
