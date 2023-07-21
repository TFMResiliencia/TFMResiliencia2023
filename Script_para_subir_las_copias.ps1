# Ruta donde se encuentra el archivo ZIP (sin conocer el nombre)
$rutaDirectorioZip = "C:\Users\tfm\Desktop\Copia_de_seguridad\"

# Obtiene el archivo ZIP en la ubicación dada
$archivoZip = Get-ChildItem -Path $rutaDirectorioZip -Filter "*.zip" | Select-Object -First 1

if ($archivoZip -eq $null) {
	Write-Host "No se encontró ningún archivo ZIP en la ubicación especificada."
	exit
}

New-GcsObject -Bucket "tfm_resiliencia_copias_de_seguridad" -File $archivoZip.FullName -Force

# Elimina el archivo Zip al terminar
Remove-Item -Path $archivoZip.FullName -Force