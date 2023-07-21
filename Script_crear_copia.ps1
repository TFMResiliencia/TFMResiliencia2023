# Obtiene la fecha actual en el formato deseado (dd-MM-yyyy)
$fechaActual = Get-Date -Format "dd-MM-yyyy"

# Nombre del archivo ZIP resultante con la fecha actual
$nombreZip = "copia_de_seguridad_$fechaActual.zip"

# Rutas de los archivos y carpetas a comprimir
$archivosYCarpetas = @(
	"C:\Users\tfm\Desktop\Pruebas_scripts\datos_web.txt",
	"C:\Users\tfm\Desktop\Pruebas_scripts\datos_web2.txt",
	"C:\Users\tfm\Desktop\Pruebas_scripts\datos_web"
)

# Ruta donde se almacenará el archivo ZIP resultante
$rutaDestino = "C:\Users\tfm\Desktop\Copia_de_seguridad\$nombreZip"
    
# Verifica si la ruta de destino es válida
    if (-not (Test-Path (Split-Path $RutaDestino))) {
        Write-Host "La ruta de destino no es válida."
        return
    }

# Crea el archivo ZIP
      try {
        # Crea el archivo ZIP
        #Get-ChildItem -Path "$RutaDestino" | Compress-Archive -DestinationPath "$RutaDestino"

        # Agrega cada archivo o carpeta al archivo ZIP
        foreach ($item in $ArchivosYCarpetas) {     
            compress-archive -path "$item" -update -destinationpath "$RutaDestino"
	}
        Write-Host "Compresión completada con éxito."
    } catch {
        Write-Host "Se produjo un error durante la compresión: $_"
    }



