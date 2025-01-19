function CopyFileOrFolder($SourcePath, $DestinationPath) {
    # Kaynak Dosya veya Klasörü kontrol et
    if (Test-Path $SourcePath) {
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse -Force
        Write-Host "Dosya veya Klasör Kopyalandı!"
    }
    else {
        Write-Host "Hata! Belirtilen yol doğru değil"
    }
}

# Kullanıcıdan veri al
$sourcePath = Read-Host "Kaynak dosya ya da klasör yolunu giriniz"
$destinationPath = Read-Host "Hedef dosya ya da klasör yolunu giriniz"

# Fonksiyonu çağır
CopyFileOrFolder -SourcePath $sourcePath -DestinationPath $destinationPath
