Add-Type -AssemblyName System.Windows.Forms

# Form oluştur
$form = New-Object System.Windows.Forms.Form
$form.Text = "IP Adresi Konum Bulucu"
$form.Size = New-Object System.Drawing.Size(400,300)
$form.StartPosition = "CenterScreen"

# IP adresi giriş kutusu
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(50,50)
$textBox.Size = New-Object System.Drawing.Size(200,20)
$form.Controls.Add($textBox)

# Konum bul düğmesi
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(260,50)
$button.Size = New-Object System.Drawing.Size(100,20)
$button.Text = "Konum Bul"
$form.Controls.Add($button)

# İşlem durumu etiketi
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Location = New-Object System.Drawing.Point(50,80)
$statusLabel.Size = New-Object System.Drawing.Size(310,20)
$form.Controls.Add($statusLabel)

# Sonuç kutusu
$resultTextBox = New-Object System.Windows.Forms.TextBox
$resultTextBox.Location = New-Object System.Drawing.Point(50,110)
$resultTextBox.Size = New-Object System.Drawing.Size(310,100)
$resultTextBox.Multiline = $true
$resultTextBox.ReadOnly = $true
$form.Controls.Add($resultTextBox)

# Haritayı aç düğmesi
$mapButton = New-Object System.Windows.Forms.Button
$mapButton.Location = New-Object System.Drawing.Point(50,220)
$mapButton.Size = New-Object System.Drawing.Size(100,30)
$mapButton.Text = "Haritayı Aç"
$mapButton.Enabled = $false
$form.Controls.Add($mapButton)

# Düğmeye tıklandığında çalışacak fonksiyon
$button.Add_Click({
    $IPaddress = $textBox.Text
    if ($IPaddress -eq "") {
        [System.Windows.Forms.MessageBox]::Show("Lütfen bir IP adresi girin.", "Hata", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    } elseif ($IPaddress -notmatch "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b") {
        [System.Windows.Forms.MessageBox]::Show("Geçersiz IP adresi.", "Hata", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    } else {
        try {
            # İşlem durumu güncelle
            $statusLabel.Text = "İşlem sürüyor..."

            # IP adresinin coğrafi konumunu belirle
            $result = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$IPaddress"
            $resultTextBox.Text = "IP Adresi: $($result.query)`r`nKıta: $($result.continent)`r`nÜlke: $($result.country)`r`nŞehir: $($result.city)`r`nZaman Dilimi: $($result.timezone)`r`nEnlem: $($result.lat)`r`nBoylam: $($result.lon)"

            # İşlem durumu güncelle
            $statusLabel.Text = "İşlem tamamlandı."
            $mapButton.Enabled = $true
            $mapButton.Tag = "$($result.lat),$($result.lon)"
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Hata: $_", "Hata", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
})

# Haritayı aç düğmesine tıklandığında çalışacak fonksiyon
$mapButton.Add_Click({
    $coordinates = $mapButton.Tag
    if ($coordinates -ne "") {
        $url = "https://www.google.com/maps/place/$coordinates"
        Start-Process $url
    } else {
        [System.Windows.Forms.MessageBox]::Show("Önce bir konum bulun.", "Hata", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$form.ShowDialog() | Out-Null
