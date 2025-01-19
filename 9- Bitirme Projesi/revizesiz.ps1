while ($true) {

    Clear-Host
    Write-Host "`n=== Sistem Yardım Menüsü ===" -ForegroundColor Cyan
    Write-Host "1  - Denetim Masası"
    Write-Host "2  - Ağ Ayarları"
    Write-Host "3  - Temp Klasörünü Temizle"
    Write-Host "4  - Prefetch Klasörünü Temizle"
    Write-Host "5  - Bilgisayar Sağlığını Düzelt"
    Write-Host "6  - Format Sonrası Yüklenecek Uygulamalar"
    Write-Host "7  - Windows Güncellemeleri Aç/Kapa"
    Write-Host "8  - Toplu Güncelleme Komutları"
    Write-Host "9  - Sistem Geri Yükleme"
    Write-Host "10 - Kullanıcı Ekle/Sil"
    Write-Host "11 - Oyun Performans Aç-Kapa"
    Write-Host "0  - Çıkış"
    Write-Host "============================="

    # Kullanıcıdan seçim al
    $secimAl = Read-Host "Lütfen seçim yapınız (0-11)"

    # Switch-case ile işlemleri yönet
    switch ($secimAl) {
        "0" {
            Write-Host "Programdan çıkılıyor..." -ForegroundColor Cyan
            exit
        }
        "1" {
            Write-Host "Denetim Masası açılıyor..." -ForegroundColor Green
            Start-Process "control.exe"
        }
        "2" {
            Write-Host "Ağ ayarları açılıyor..." -ForegroundColor Green
            Start-Process "ncpa.cpl"
        }
        "3" {
            Write-Host "Temp klasörü temizleniyor..." -ForegroundColor Yellow
            try {
                Remove-Item -Path "C:\Windows\Temp\*" -Force -Recurse -ErrorAction Stop
                Write-Host "Temp klasörü başarıyla temizlendi." -ForegroundColor Green
            } catch {
                Write-Host "Bazı dosyalar kullanıldığı için silinemedi." -ForegroundColor Red
            }
        }
        "4" {
            Write-Host "Prefetch klasörü temizleniyor..." -ForegroundColor Yellow
            try {
                Remove-Item -Path "C:\Windows\Prefetch\*" -Force -Recurse -ErrorAction Stop
                Write-Host "Prefetch klasörü başarıyla temizlendi." -ForegroundColor Green
            } catch {
                Write-Host "Bazı dosyalar kullanıldığı için silinemedi." -ForegroundColor Red
            }
        }
        "5" {
            Write-Host "Bilgisayar sağlığı düzeltme işlemi başlıyor..." -ForegroundColor Cyan
            Start-Sleep -Seconds 3
            & dism /online /cleanup-image /restorehealth
            if ($LASTEXITCODE -eq 0) {
                Write-Host "Bilgisayar sağlığı başarıyla düzeltildi." -ForegroundColor Green
            } else {
                Write-Host "Bilgisayar sağlığı düzeltilemedi. Hata kodu: $LASTEXITCODE" -ForegroundColor Red
            }
        }
        "6" {
            Write-Host "Format sonrası uygulamalar yükleniyor..." -ForegroundColor Cyan
            try {
                winget install --id Google.Chrome -e --accept-package-agreements --accept-source-agreements
                Write-Host "Google Chrome başarıyla yüklendi." -ForegroundColor Green
            } catch {
                Write-Host "Google Chrome yüklenirken bir hata oluştu." -ForegroundColor Red
            }
        }
        "7" {
            $ackapa = Read-Host "Windows Güncellemeleri için 1 (Aç) veya 2 (Kapat) yazınız"
            if ($ackapa -eq "1") {
                Set-Service -Name wuauserv -StartupType Automatic
                Start-Service -Name wuauserv
                Write-Host "Windows Güncellemeleri açıldı." -ForegroundColor Green
            } elseif ($ackapa -eq "2") {
                Stop-Service -Name wuauserv
                Set-Service -Name wuauserv -StartupType Disabled
                Write-Host "Windows Güncellemeleri kapatıldı." -ForegroundColor Yellow
            } else {
                Write-Host "Geçersiz seçim yaptınız." -ForegroundColor Red
            }
        }
        "8" {
            Write-Host "Tüm uygulamalar güncelleniyor..." -ForegroundColor Cyan
            try {
                winget upgrade --all
                Write-Host "Güncellemeler başarıyla tamamlandı." -ForegroundColor Green
            } catch {
                Write-Host "Güncellemeler sırasında bir hata oluştu." -ForegroundColor Red
            }
        }
        "9" {
            Write-Host "Sistem Geri Yükleme ekranı açılıyor..." -ForegroundColor Green
            Start-Process "SystemPropertiesProtection.exe"
        }
        "10" {
            $secim = Read-Host "Yapmak istediğiniz işlemi seçiniz: 1 - Kullanıcıları Listele, 2 - Şifre Ata, 3 - Kullanıcı Sil"
            switch ($secim) {
                "1" {
                    Write-Host "Kullanıcılar:" -ForegroundColor Cyan
                    Get-LocalUser | ForEach-Object { Write-Host $_.Name }
                }
                "2" {
                    $kullaniciAdi = Read-Host "Şifresi atanacak kullanıcı adını giriniz"
                    $sifre = Read-Host "Yeni şifreyi giriniz" -AsSecureString
                    Set-LocalUser -Name $kullaniciAdi -Password $sifre
                    Write-Host "Şifre başarıyla atandı." -ForegroundColor Green
                }
                "3" {
                    $kullaniciAdi = Read-Host "Silinecek kullanıcı adını giriniz"
                    Remove-LocalUser -Name $kullaniciAdi
                    Write-Host "Kullanıcı başarıyla silindi." -ForegroundColor Green
                }
                default {
                    Write-Host "Geçersiz seçim yaptınız." -ForegroundColor Red
                }
            }
        }
        "11" {
            Write-Host "Oyun Moduna Hoşgeldiniz" -ForegroundColor Green
            Start-Sleep -Seconds 1
            Write-Host "1- Hizmetleri Aç"
            Write-Host "2- Hizmetleri Kapat"
            $secim = Read-Host "Lütfen seçim yapınız (1 veya 2)"

            $servicesToStop = @("SysMain", "wuaserv", "werpclsupport", "Themes", "wscsvc", "SSDPSRV", "Browser", "Spooler")

            if ($secim -eq "1") {
                foreach ($service in $servicesToStop) {
                    try {
                        Set-Service -Name $service -StartupType Manual
                        Start-Service -Name $service
                        Write-Host "$service hizmeti başarıyla açıldı." -ForegroundColor Green
                    } catch {
                        Write-Host "$service hizmeti açılırken bir hata oluştu." -ForegroundColor Red
                    }
                }
            } elseif ($secim -eq "2") {
                foreach ($service in $servicesToStop) {
                    try {
                        Stop-Service -Name $service -Force
                        Set-Service -Name $service -StartupType Disabled
                        Write-Host "$service hizmeti başarıyla durduruldu." -ForegroundColor Yellow
                    } catch {
                        Write-Host "$service hizmeti durdurulurken bir hata oluştu." -ForegroundColor Red
                    }
                }
            } else {
                Write-Host "Geçersiz seçim yaptınız." -ForegroundColor Red
            }
        }
        default {
            Write-Host "Geçersiz seçim yaptınız. Lütfen 0-11 arasında bir değer giriniz." -ForegroundColor Red
        }
    }
    Write-Host "İşlem tamamlandı"
    Start-Sleep -Seconds 3
}
