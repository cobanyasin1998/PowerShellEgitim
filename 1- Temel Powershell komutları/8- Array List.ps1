$meyveler = New-Object System.Collections.ArrayList
$meyveler.Add("elma");
$meyveler.Add("armut");
$meyveler.Add("çilek");

foreach($eleman in $meyveler){
Write-Host $eleman
}
$meyveler.Count

$meyveler.Clear()