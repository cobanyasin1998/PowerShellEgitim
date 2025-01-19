function CreateFileOnDesktopWithExtensions {
    param (
        [string] $extension,
        [string] $content
    )

    # Kullanıcının masaüstü yolunu al
    $desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')

    # Dosya uzantısını kontrol et
    if (-not $extension.StartsWith('.')) {
        Write-Host "Hata: Geçersiz Dosya Uzantısı Girdiniz. Uzantı '.' ile başlamalıdır." -ForegroundColor Red
        return
    }

    # Dosya yolu oluştur
    $filePath = Join-Path -Path $desktopPath -ChildPath ("NewFile" + $extension)

    # Dosya oluştur ve içeriği yaz
    try {
        Set-Content -Path $filePath -Value $content
        Write-Host "Dosya başarı ile oluşturuldu: $filePath" -ForegroundColor Green
    } catch {
        Write-Host "Hata: Dosya oluşturulamadı. $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Kullanıcıdan dosya uzantısı ve içeriğini al
$fileExtension = Read-Host "Dosya uzantısını giriniz (Örn .txt)"
$fileContent = Read-Host "Dosya içeriğini giriniz"

# Fonksiyonu çağır
CreateFileOnDesktopWithExtensions -extension $fileExtension -content $fileContent
