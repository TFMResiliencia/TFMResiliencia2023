#Ordena todos los archivos del bucket y selecciona el más reciente
$file = Get-GcsObject -Bucket "tfm_resiliencia_copias_de_seguridad"  | Select Name, TimeCreated| Sort-Object TimeCreated -Descending| Select-Object -First 1 |Select -ExpandProperty Name 

#Descarga el archivo mas reciente
Read-GcsObject  -Bucket "tfm_resiliencia_copias_de_seguridad" -ObjectName $file  -OutFile "C:\Users\tfm\Desktop\Copia_de_seguridad\$file" -Force

