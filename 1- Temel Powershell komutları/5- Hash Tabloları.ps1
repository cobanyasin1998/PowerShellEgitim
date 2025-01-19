# Hash table tanımlama
$hashTablosu = @{
    "ad" = "Yasin"
    "soyad" = "Çoban"
    "yas" = 26
}

# Bilgileri düzenli bir şekilde yazdırma
Write-Host "Kişi Bilgileri:"
Write-Host "Ad    : $($hashTablosu['ad'])"
Write-Host "Soyad : $($hashTablosu['soyad'])"
Write-Host "Yaş   : $($hashTablosu['yas'])"
