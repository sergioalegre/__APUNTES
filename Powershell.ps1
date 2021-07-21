#saber el tipo de dato
PowerCLI C:\> $a.GetType()

#Convertir de string a datetime
PowerCLI C:\> $a.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     String                                   System.Object


PowerCLI C:\> $a=[datetime]::parseexact($a,"dd'/'MM'/'yyyy hh:mm:ss", $null)
PowerCLI C:\> $a.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     DateTime                                 System.ValueType

#Convertir a String
$limite.ToString()