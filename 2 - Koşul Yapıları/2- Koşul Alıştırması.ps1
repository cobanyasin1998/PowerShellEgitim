$not = Read-Host "Lütfen notunuzu giriniz 0-100 arası"
$not = [int]$not

if ($not -ge 90 -and $not -le 100) {
    Write-Host "Notunuz : $not - Harf Notunuz : A"
} elseif ($not -ge 80 -and $not -lt 90) {
    Write-Host "Notunuz : $not - Harf Notunuz : B"
} elseif ($not -ge 70 -and $not -lt 80) {
    Write-Host "Notunuz : $not - Harf Notunuz : C"
} elseif ($not -ge 60 -and $not -lt 70) {
    Write-Host "Notunuz : $not - Harf Notunuz : D"
} elseif ($not -ge 0 -and $not -lt 60) {
    Write-Host "Notunuz : $not - Harf Notunuz : F"
} else {
    Write-Host "Geçersiz bir not girdiniz! Lütfen 0 ile 100 arasında bir değer giriniz."
}
