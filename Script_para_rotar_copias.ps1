#Cuenta las copias en el bucket
$contadorArchivos = (Get-GcsObject -Bucket "tfm_resiliencia_copias_de_seguridad").Length

#Si existen 3 o más copias se borra el más antiguo
if ($contadorArchivos -ge 3) {
	$file = Get-GcsObject -Bucket "tfm_resiliencia_copias_de_seguridad"  | Select Name, TimeCreated| Sort-Object TimeCreated | Select-Object -First 1 |Select -ExpandProperty Name 
	Remove-GcsObject -Bucket "tfm_resiliencia_copias_de_seguridad" -ObjectName $file
	Write-Host "Borrada la copia más antigua"
}
