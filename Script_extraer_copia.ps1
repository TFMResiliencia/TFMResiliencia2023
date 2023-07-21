
# Ruta donde se encuentra el archivo ZIP (sin conocer el nombre)
$rutaDirectorioZip = "C:\Users\tfm\Desktop\Copia_de_seguridad\"

# Ruta de destino donde se descomprimirá el ZIP
$rutaDestino = "C:\Users\tfm\Desktop\Recuperacion_de_copias"

# Obtiene el archivo ZIP en la ubicación dada
$archivoZip = Get-ChildItem -Path $rutaDirectorioZip -Filter "*.zip" | Select-Object -First 1

if ($archivoZip -eq $null) {
	Write-Host "No se encontró ningún archivo ZIP en la ubicación especificada."
	exit
}

# Comando para descomprimir el archivo ZIP al destino
Expand-Archive -Path $archivoZip.FullName -DestinationPath $rutaDestino -Force

# Elimina el archivo Zip al terminar
Remove-Item -Path $archivoZip.FullName -Force

Write-Host "Extracción y movimiento de archivos completados con éxito."

