 -- Busquedas cruzadas en tres tablas, INNER JOIN

SELECT *FROM CONTACTOS INNER JOIN
                      SUCURSALES ON SUCURSALES.id_sucursal = CONTACTOS.id_sucursal INNER JOIN
                      BANCOS ON BANCOS.id_banco = SUCURSALES.id_banco

 

-- Busqueda en tres tablas para hacer un listado de control_presencias

SELECT     HORA_TARJETAS.hora, PERSONAL.id_empleado, PERSONAL.NOMBRE, PERSONAL.APELLIDOS
FROM         HORA_TARJETAS INNER JOIN
                      TARJETAS ON TARJETAS.id_tarjeta = HORA_TARJETAS.id_tarjeta INNER JOIN
                      PERSONAL ON PERSONAL.id_empleado = TARJETAS.id_empleado
WHERE     (HORA_TARJETAS.id_ubicacion = 1) AND (HORA_TARJETAS.hora >= '20/01/2009')
ORDER BY HORA_TARJETAS.hora, PERSONAL.APELLIDOS

 

-- Update cruzado

UPDATE [C.COMPRADORES]
SET              provincia_mailing =

                          (SELECT     callejeros.dbo.provincias.nombre_provincia

                            FROM          callejeros.dbo.provincias

                            WHERE      callejeros.dbo.provincias.id_provincia = provincia)

 

-- Update para reemplazar caracteres extraños (I/II)

UPDATE    [PROPIETARIOS]

SET              NIF2 = REPLACE(NIF2, '-', '')

Update para reemplazar caracteres extraños (II/II)

UPDATE    CLIENTES

SET              [€] = REPLACE([€], ',', '')

Update con between

UPDATE    [VISITAS]

SET             id_visitador = 1373

WHERE     (tipo = 'L') OR

                      (tipo = 'N') OR

                      (zona NOT BETWEEN 91 AND 94) AND (tipo = 'G') AND (zona NOT BETWEEN 1 AND 5)

-- Busqueda cruzada de propietarios activos

SELECT     *

FROM         INMUEBLES INNER JOIN

                      PROPIETARIOS ON INMUEBLES.N_PROPIETARIO = PROPIETARIOS.id_propietario

WHERE     (INMUEBLES.ANULA <> 'Si')

 

-- Selección multiple

SELECT     id_inmueble

FROM         INMUEBLES

WHERE     (TIPO <> 'P') AND (REGIMEN <> 'Venta') AND (EXCLUSIVA = 'Exc') AND (ANULA <> 'Si')

 

-- Busqueda cruzada de propietario e inmuebles

SELECT     [PROPIETARIOS].id_propietario, INMUEBLES.TIPO, INMUEBLES.REGIMEN, INMUEBLES.id_inmueble

FROM         [PROPIETARIOS] INNER JOIN

                      INMUEBLES ON [PROPIETARIOS].id_propietario = INMUEBLES.N_PROPIETARIO

 

 

-- Busqueda cruzada

SELECT     [PROPIETARIOS].id_propietario, INMUEBLES.id_inmueble, [VISITAS].tipo, [VISITAS].regimen,

                      [VISITAS].direccion, [VISITAS].precio_euros, [VISITAS].id_visita

FROM         [PROPIETARIOS] INNER JOIN

                      [VISITAS] ON [PROPIETARIOS].id_propietario = [VISITAS].id_visita INNER JOIN

                      INMUEBLES ON [PROPIETARIOS].id_propietario = INMUEBLES.N_PROPIETARIO

ORDER BY [PROPIETARIOS].id_propietario

 

-- Selección por mes en una fecha

select * from personal where month(FECHA_NACIMIENTO) = 4

 

-- Actualizar campos vacios

update personal set provincia_trabajo='Burgos' where provincia_trabajo is null

 

-- Crear tabla con resultados (I/II)

CREATE TABLE propietarios2(id_propietario nvarchar(200), apellidos nvarchar(200), apellidos2 nvarchar(200), nif nvarchar(200), nif2 nvarchar(200),

domicilio nvarchar(200), telefono nvarchar(200), telefono2 nvarchar(200), cp_propietario nvarchar(200), ciudad nvarchar(200), nombre nvarchar(200),

provincia nvarchar(200), zona nvarchar(200)) INSERT INTO propietarios2

                                                                                                  SELECT     [PROPIETARIOS].id_propietario, [PROPIETARIOS].APELLIDOS, [PROPIETARIOS].APELLIDOS2,

                                                                                                                        [PROPIETARIOS].NIF, [PROPIETARIOS].NIF2, [PROPIETARIOS].DOMICILIO,

                                                                                                                        [PROPIETARIOS].TELEFONO, [PROPIETARIOS].TELEFONO2, [PROPIETARIOS].CP_PROPIETARIO,

                                                                                                                        [PROPIETARIOS].CIUDAD, [PROPIETARIOS].NOMBRE, [PROPIETARIOS].PROVINCIA,

                                                                                                                        [PROPIETARIOS].zona

                                                                                                  FROM         INMUEBLES INNER JOIN

                                                                                                                        [PROPIETARIOS] ON INMUEBLES.N_PROPIETARIO = [PROPIETARIOS].id_propietario

                                                                                                  WHERE     (INMUEBLES.ANULA <> 'Si')

 

-- Crear tabla con resultados (II/II)

CREATE TABLE propietarios_temp(id_propietario nvarchar(200), apellidos nvarchar(200), apellidos2 nvarchar(200), domicilio nvarchar(200),

cp_propietario nvarchar(200), ciudad nvarchar(200), nombre nvarchar(200), provincia nvarchar(200), id_inmueble nvarchar(200),

poblacion_inmueble nvarchar(200), provincia_inmueble nvarchar(200), direccion nvarchar(200)) INSERT INTO propietarios_temp

                                                                                                                                                                                                               SELECT     [PROPIETARIOS].id_propietario,

                                                                                                                                                                                                                                     [PROPIETARIOS].APELLIDOS,

 

-- Búsqueda de repetidos         

SELECT     MAX(id2) AS Expr2, id, COUNT(id) AS Expr1

FROM         HOJARUTACLIENTES_CEI

GROUP BY id

HAVING      (COUNT(id) > 1)

ORDER BY id

 

-- Reemplazar

update inmuebles set direccion=replace(direccion,'la o lma','la olma')

 

-- Update cruzado

UPDATE    COLABORADORES

SET              nuevo_password=

                          (SELECT     password

                            FROM          usuarios

                            WHERE      id_colaborador = COLABORADORES.id_usuario)

 

-- Calcular direcciones completas

SELECT     id_visita, direccion

FROM         gestinmceivall..visitas

                          SELECT     callejero..callejeros.nombre

                           FROM         callejero..callejeros

                           WHERE     (nombre = LEFT(gestinmceivall..visitas.direccion, { fn LENGTH(nombre) })) AND id_provincia = 49

 

-- Añadir datos a una cadena

UPDATE    PERSONAL

SET              permisos_nuevo = permisos_nuevo + ',86'

WHERE     (id_empleado IN (1145, 1486, 1648, 1461, 1488, 1462, 1230, 1452, 1433, 1476, 1481))

 

-- Conversión de tipos

SELECT     MAX(CAST(CLAVE_CLIENTE AS int(4))) AS Expr1

FROM         compradores

 

-- Copiar trozo de cadena

UPDATE    inm

SET              CODIGO_POSTAL = SUBSTRING(Col005, 0, 6)

 

-- Quitar trozo de cadena

UPDATE    inm

SET              Col005 = REPLACE(Col005, SUBSTRING(Col005, 0, 6), '')

 

-- Replace de substring

UPDATE    INMUEBLES

SET              POBLACION = REPLACE(POBLACION, SUBSTRING(POBLACION, 0, 6), '')

WHERE     (POBLACION LIKE '[!0-9]%')

 

-- Having doble

SELECT     id_empleado_vendedor, COUNT(id_empleado_vendedor) AS Expr1

FROM         COMPRADORES

GROUP BY id_empleado_vendedor, ANULA

HAVING      (COUNT(id_empleado_vendedor) > 0) AND (ANULA = 'N')

 

-- Retaurar campo por copia de seguridad

UPDATE    COMPRADORES

SET              id_empleado_vendedor =

                          (SELECT     GestinmPrigoBackup..compradores.id_empleado_vendedor

                            FROM          GestinmPrigoBackup..compradores

                            WHERE      GestinmPrigoBackup..compradores.id_cliente = Gestinmprigo..compradores.id_cliente)

 

-- Cruzado con vistas, INNER JOIN

  -- Vista 1

  SELECT     TOP 100 PERCENT nombre, id_zona, codigo_postal,id_provincia, id_poblacion

  FROM         dbo.CALLEJERO

  WHERE     (id_provincia = 11)

  ORDER BY nombre

   

  -- Vista 2

  Poblaciones de Provincia de Burgos

  SELECT     dbo.POBLACIONES.*

  FROM         dbo.POBLACIONES

  WHERE     (id_provincia = 11)

   

  -- Consulta

  SELECT     vista1.nombre, vista1.id_zona, vista1.codigo_postal, vista2.nombre_poblacion

  FROM         vista1 INNER JOIN

                        vista2 ON vista1.id_poblacion = vista2.id_poblacion

  ORDER BY vista1.nombre, vista2.nombre_poblacion, vista1.codigo_postal

 

-- Todas las visitas activas excepto pisos en venta

SELECT     COUNT(*) AS Expr1
FROM         VISITAS
WHERE     (fecha_baja IS NULL) AND (estado_visita = 'B') AND (regimen IN
('Alquiler', 'Traspaso')) AND (tipo = 'P') OR
                      (fecha_baja IS NULL) AND (estado_visita = 'B') AND
(tipo <> 'P')

 

-- Copiar datos entre tablas pasando un valor predefinido a un campo

Insert into hojaruta_visitas

(id_empleado, fecha, clave, codigo, comentario, sociedad, hora)

Select id_empleado, fecha, clave_visitas1, codigo_hojaruta1, comentario1, ‘4’, hora

From hojarutavisitas_ccasa

 

-- Mailing a propietarios

SELECT     PROPIETARIOS.APELLIDOS, INMUEBLES.id_inmueble, INMUEBLES.DIRECCION AS DIRECCION_DEL_INMUEBLE,

                      INMUEBLES.CODIGO AS CODIGO_POSTAL_DEL_INMUEBLE, INMUEBLES.POBLACION AS POBLACION_DEL_INMUEBLE,

                      PROPIETARIOS.DOMICILIO AS DOMICILIO_PROPIETARIO, PROPIETARIOS.CP_PROPIETARIO AS CODIGO_POSTAL_PROPIETARIOS,

                      PROPIETARIOS.CIUDAD AS POBLACION_PROPIETARIOS, GrupoPrigo.dbo.PERSONAL.NOMBRE AS NOMBRE_VENDEDOR,

                      GrupoPrigo.dbo.PERSONAL.APELLIDOS AS APELLIDOS_VENDEDOR, Callejeros.dbo.PROVINCIAS.nombre_provincia AS PROVINCIA_INMUEBLE,

                      calle2.nombre_provincia AS PROVINCIA_PROPIETARIO

FROM         INMUEBLES INNER JOIN

                      PROPIETARIOS ON REPLACE(INMUEBLES.N_PROPIETARIO, 'A', '') = PROPIETARIOS.id_propietario INNER JOIN

                      GrupoPrigo.dbo.PERSONAL ON INMUEBLES.id_vendedor = GrupoPrigo.dbo.PERSONAL.id_empleado INNER JOIN

                      Callejeros.dbo.PROVINCIAS ON INMUEBLES.PROVINCIA = Callejeros.dbo.PROVINCIAS.id_provincia INNER JOIN

                      Callejeros.dbo.PROVINCIAS calle2 ON PROPIETARIOS.PROVINCIA = calle2.id_provincia

WHERE     (INMUEBLES.ANULA <> 'Si')

Order by apellidos

 

-- Inmuebles anulados por nosotros entre dos fechas, mostrando el id_cliente y datos del propietario.

SELECT     INMUEBLES.DIRECCION, INMUEBLES.id_inmueble, INMUEBLES.TIPO, INMUEBLES.REGIMEN, INMUEBLES.N_PROPIETARIO,

                      PROPIETARIOS.NOMBRE, INMUEBLES.id_visitador, INMUEBLES.id_vendedor, INMUEBLES.PRECIO_EURO, COMPRADORES.id_cliente,

                      COMPRADORES.NOMBRE AS Expr1, COMPRADORES.APELLIDOS

FROM         INMUEBLES INNER JOIN

                      PROPIETARIOS ON INMUEBLES.N_PROPIETARIO = PROPIETARIOS.id_propietario INNER JOIN

                      COMPRADORES ON PROPIETARIOS.NIF = COMPRADORES.NIF

WHERE     (INMUEBLES.FECHA_ALTA > ' 01/01/2005') AND (INMUEBLES.CAUSA_ANULA IN ('Vendido nosotros', 'Alquilado nosotros')) AND

                      (INMUEBLES.FECHA_BAJA < '01/01/2006')

 

 

-- Renombrar columnas (se ejecuta en la misma bbdd del cambio)

EXEC sp_rename  ‘[Gestinmccasa]..[compradores].[s-mano]’,’segunda_mano’, ‘COLUMN’

 

-- Renombrar BBDD´s (se ejecuta en la misma bbdd del cambio)

EXEC sp_rename  ‘[GestinmCCASALO]’ , ‘GestInmCEILO’, ‘DATABASE’

 

-- Busqueda cuando no han de coincidir dos criterios

SELECT     id_inmueble, REGIMEN, TIPO
FROM         INMUEBLES
GROUP BY id_inmueble, REGIMEN, TIPO
HAVING      (REGIMEN <> 'Alquiler') OR
                      (TIPO <> 'P')

 

 

SELECT     id_visita, tipo, regimen, direccion, zona, precio_euros, id_visitador

FROM         VISITAS

WHERE     (fecha_baja IS NULL) AND (estado_visita = 'B') AND (poblacion = 'Segovia')

GROUP BY id_visita, tipo, regimen, direccion, zona, precio_euros, id_visitador

HAVING      (regimen <> 'Venta') OR

                      (tipo <> 'P')

ORDER BY zona, tipo, regimen, id_visita

 

-- Actualizar un campo dirección

UPDATE    COMPRADORES

SET              DOMICILIO = 'CARRETERA MADRID-IRUN' + RIGHT(DOMICILIO, { fn LENGTH(DOMICILIO) } - { fn LENGTH('CTRA.MADRID-IRÚN') })

WHERE     (DOMICILIO LIKE ' CTRA.MADRID-IRÚN % ')

 

-- Mailing compradores activos con cartas=’Si’

SELECT     COMPRADORES.NOMBRE, COMPRADORES.APELLIDOS, COMPRADORES.DOMICILIO, COMPRADORES.POBLACION, COMPRADORES.PROVINCIA,

                      COMPRADORES.CODIGO, Callejeros.dbo.PROVINCIAS.nombre_provincia

FROM         COMPRADORES INNER JOIN

                      Callejeros.dbo.PROVINCIAS ON COMPRADORES.PROVINCIA = Callejeros.dbo.PROVINCIAS.id_provincia

WHERE     (COMPRADORES.CARTAS = 'Si') AND (COMPRADORES.ANULA = 'N')

ORDER BY COMPRADORES.APELLIDOS, COMPRADORES.NOMBRE, COMPRADORES.DOMICILIO

 

-- Ultimo toque de las fichas de visitas en Palencia de la sociedad CeiPalencia (10)

SELECT     id_visita,

                          (SELECT     MAX(hojaruta..hojaruta_visitas.fecha)

                            FROM          hojaruta..hojaruta_visitas

                            WHERE      hojaruta..hojaruta_visitas.clave = id_visita AND hojaruta..hojaruta_visitas.sociedad = 10 AND

                                                   HojaRuta.dbo.HOJARUTA_VISITAS.fecha < '25/03/2006') AS fecha_contacto, id_visitador

FROM         GestInmCEIPALENCIA.dbo.VISITAS

WHERE     (estado_visita in ('B', 'R') and fecha_baja is null)

ORDER BY id_visitador, id_visita, fecha_contacto

 

-- Ultimo toque de las fichas de visitas de Burgos (3) del diario Gente (3) desde el 2013

SELECT     id_visita, fecha_alta,
                          (SELECT     MAX(hojaruta..hojaruta_visitas.fecha)
                            FROM          hojaruta..hojaruta_visitas
                            WHERE      hojaruta..hojaruta_visitas.clave = id_visita AND hojaruta..hojaruta_visitas.sociedad = 3) AS fecha_contacto, id_visitador
FROM         GestInmBURGOS.dbo.VISITAS
WHERE     (tipo_visita = '3') AND (fecha_alta >= '01/01/2013')
ORDER BY id_visitador, id_visita, fecha_contacto, fecha_alta

 

-- Ultimo toque de las fichas de visitas con cruzada a personal

SELECT     VISITAS.id_visita,

                          (SELECT     MAX(hojaruta..hojaruta_visitas.fecha)

                            FROM          hojaruta..hojaruta_visitas

                            WHERE      hojaruta..hojaruta_visitas.clave = id_visita AND hojaruta..hojaruta_visitas.sociedad = 11) AS Fecha_Contacto,

                      GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS

FROM         VISITAS INNER JOIN

                      GrupoPrigo.dbo.PERSONAL ON VISITAS.id_visitador = GrupoPrigo.dbo.PERSONAL.id_empleado

WHERE     (VISITAS.estado_visita IN ('B', 'R')) AND (VISITAS.fecha_baja IS NOT NULL)

ORDER BY VISITAS.id_visitador, VISITAS.id_visita

 

-- Ultimo toque a inmuebles activos

SELECT     INMUEBLES.id_inmueble,

                          (SELECT     MAX(hojaruta..hojaruta_vendedores.fecha)

                            FROM          hojaruta..hojaruta_vendedores

                            WHERE      hojaruta..hojaruta_vendedores.sociedad = 11 AND hojaruta..hojaruta_vendedores.inmueble = id_inmueble) AS Fecha_Contacto,

                      GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS

FROM         INMUEBLES INNER JOIN

                      GrupoPrigo.dbo.PERSONAL ON INMUEBLES.id_vendedor = GrupoPrigo.dbo.PERSONAL.id_empleado

WHERE     (INMUEBLES.ANULA <> 'Si')

ORDER BY INMUEBLES.id_inmueble

 

--Último toque de los clientes

SELECT     id_cliente, APELLIDOS, NOMBRE,
                          (SELECT     MAX(hojaruta..hojaruta_vendedores.fecha)
                            FROM          hojaruta..hojaruta_vendedores
                            WHERE      hojaruta..hojaruta_vendedores.cliente = id_cliente AND hojaruta..hojaruta_vendedores.sociedad = 10) AS fecha_contacto,
                      id_vendedor
FROM         GestInmCEIPALENCIA.dbo.COMPRADORES
WHERE     (ANULA = 'N') AND (id_vendedor IN (1036, 2052, 1271, 412, 371))
ORDER BY id_vendedor, id_cliente, fecha_contacto

 

-- Ultimo toque de fichas de visitas de un visitador determinado

SELECT DISTINCT VISITAS.id_visita, MAX(HojaRuta.dbo.HOJARUTA_VISITAS.fecha) AS ULTIMO_TOQUE

FROM         VISITAS INNER JOIN

                      HojaRuta.dbo.HOJARUTA_VISITAS ON VISITAS.id_visita = HojaRuta.dbo.HOJARUTA_VISITAS.clave

WHERE     (VISITAS.id_visitador = 1400) AND (VISITAS.fecha_baja IS NULL) AND (VISITAS.estado_visita = 'B')

GROUP BY VISITAS.id_visita

 

-- Fotos de inmuebles activos

SELECT     id_inmueble,

                          (SELECT     COUNT(id_inmueble) AS cnt

                            FROM          gestinmceivall..FOTOS_INMUEBLES FOTOS_INMUEBLES

                            WHERE      FOTOS_INMUEBLES.id_inmueble = INMUEBLES.id_inmueble) AS Fotostotal

FROM         INMUEBLES INMUEBLES

WHERE     (ANULA = 'No')

GROUP BY id_inmueble

ORDER BY Fotostotal

 

-- Consultas uniendo resultados de varias bases de datos

SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, Inmobiliaria

FROM         (SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, anula, 'PRIGO' AS Inmobiliaria

                       FROM          GestInmPRIGO.dbo.INMUEBLES

                       UNION

                       SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, anula, 'CEI'

                       FROM         GestInmCEI.dbo.INMUEBLES

                       UNION

                       SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, anula, 'MAGDA'

                       FROM         GestInmMG.dbo.INMUEBLES) DERIVEDTBL

WHERE     (anula <> 'Si') AND (N_PROPIETARIO NOT IN (0, - 1)) AND (id_zona < 40)

ORDER BY id_zona, DIRECCION, TIPO, REGIMEN

 

 

 

/***********************************************************/

SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, Inmobiliaria, propietarios_antiguos

FROM         (SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, propietarios_antiguos, anula,

                                              'PRIGO' AS Inmobiliaria

                       FROM          GestInmPRIGO.dbo.INMUEBLES

                       UNION

                       SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, propietarios_antiguos, anula, 'CEI'

                       FROM         GestInmCEI.dbo.INMUEBLES

                       UNION

                       SELECT     id_inmueble, DIRECCION, TIPO, REGIMEN, EXCLUSIVA, id_vendedor, N_PROPIETARIO, id_zona, propietarios_antiguos, anula,

                                             'MAGDA'

                       FROM         GestInmMG.dbo.INMUEBLES) DERIVEDTBL

WHERE     (anula <> 'Si') AND (N_PROPIETARIO NOT IN (0, - 1)) AND (id_zona < 40) AND (propietarios_antiguos NOT LIKE '%--1-%')

ORDER BY id_zona, DIRECCION, TIPO, REGIMEN

 

-- Listados de Visitas para Burgos

SELECT     id_visita, zona AS 'Zona inmueble', id_visitador, fecha_alta, direccion, nombre, apellidos, telefono1, zonadomi AS 'Zona Propietario'

FROM         VISITAS

WHERE     (fecha_baja IS NULL) AND (estado_visita IN ('B', 'R')) AND (zonadomi BETWEEN 11 AND 39) OR

                      (fecha_baja IS NULL) AND (estado_visita IN ('B', 'R')) AND (zonadomi IS NULL) AND (fecha_baja IS NULL) AND (estado_visita IN ('B', 'R')) AND

                      (zona BETWEEN 11 AND 39)

ORDER BY zonadomi, zona, id_visita

 

 

-- Fotografías de cada inmueble quitando las de Campoburgos y Almudena

SELECT     *

FROM         (SELECT     INMUEBLES.id_inmueble, inmuebles.n_propietario, INMUEBLES.id_vendedor, GrupoPrigo.dbo.PERSONAL.NOMBRE,

                                              GrupoPrigo.dbo.PERSONAL.APELLIDOS, INMUEBLES.id_zona, INMUEBLES.TIPO, INMUEBLES.REGIMEN, Z.fotografias

                       FROM          INMUEBLES INNER JOIN

                                                  (SELECT     FOTOS_INMUEBLES.id_inmueble, COUNT(*) AS fotografias

                                                    FROM          FOTOS_INMUEBLES INNER JOIN

                                                                           INMUEBLES ON FOTOS_INMUEBLES.id_inmueble = INMUEBLES.id_inmueble

                                                    WHERE      (INMUEBLES.ANULA <> 'Si')

                                                    GROUP BY FOTOS_INMUEBLES.id_inmueble) Z ON INMUEBLES.id_inmueble = Z.id_inmueble INNER JOIN

                                              GrupoPrigo.dbo.PERSONAL ON INMUEBLES.id_vendedor = GrupoPrigo.dbo.PERSONAL.id_empleado

                       WHERE      (INMUEBLES.ANULA <> 'Si') AND n_propietario NOT IN (- 1, 0) AND id_vendedor <> 944

                       UNION

                       SELECT     INMUEBLES.id_inmueble, inmuebles.n_propietario, INMUEBLES.id_vendedor, GrupoPrigo.dbo.PERSONAL.NOMBRE,

                                             GrupoPrigo.dbo.PERSONAL.APELLIDOS, INMUEBLES.id_zona, INMUEBLES.TIPO, INMUEBLES.REGIMEN, '0' AS fotografias

                       FROM         INMUEBLES, GrupoPrigo.dbo.PERSONAL

                       WHERE     n_propietario NOT IN (- 1, 0) AND id_vendedor <> 944 AND id_inmueble NOT IN

                                                 (SELECT     FOTOS_INMUEBLES.id_inmueble

                                                   FROM          FOTOS_INMUEBLES INNER JOIN

                                                                          INMUEBLES ON FOTOS_INMUEBLES.id_inmueble = INMUEBLES.id_inmueble

                                                   WHERE      (INMUEBLES.ANULA <> 'Si')

                                                   GROUP BY FOTOS_INMUEBLES.id_inmueble) AND INMUEBLES.id_vendedor = GrupoPrigo.dbo.PERSONAL.id_empleado AND

                                             (INMUEBLES.ANULA <> 'Si')) DERIVEDTBL

ORDER BY fotografias, id_zona

 

-- Mailing Visitas Albacete

SELECT     VISITAS.id_visita, VISITAS.nombre, VISITAS.apellidos, VISITAS.sexo, VISITAS.domicilio, VISITAS.c_postal, VISITAS.poblacion_dom,

                      Callejeros.dbo.PROVINCIAS.nombre_provincia

FROM         VISITAS INNER JOIN

                      Callejeros.dbo.PROVINCIAS ON VISITAS.ciudad = Callejeros.dbo.PROVINCIAS.id_provincia

WHERE     (VISITAS.zona IN (18, 12, 19, 17)) AND (VISITAS.apellidos IS NOT NULL) AND (VISITAS.domicilio IS NOT NULL) AND (VISITAS.c_postal IS NOT NULL) AND

                      (VISITAS.poblacion_dom IS NOT NULL) AND (VISITAS.apellidos <> '') AND fecha_baja is null and estado_visita in ('B','R')

ORDER BY VISITAS.zona



-- Borrar todos los caracteres en un campo apartir de una coma 

UPDATE    COMPRADORES
SET              APELLIDOS = REPLACE(SUBSTRING(APELLIDOS, 0, PATINDEX('%,%', APELLIDOS)), APELLIDOS, '')
WHERE     (APELLIDOS LIKE '%,%')

 

-- Buscar elementos de una tabla que no esten en otra tabla

SELECT     id_visita, propietario
FROM         VISITAS
WHERE     (propietario IN
                          (SELECT DISTINCT propietario
                            FROM          VISITAS
                            WHERE      (propietario NOT IN
                                                       (SELECT DISTINCT gestinmburgos..propietarios.id_propietario
                                                         FROM          gestinmburgos..propietarios))))

 

-- Juntar resultados de varias tablas (la consulta se hace en gestinmBurgos, consulta de Amaro
SELECT     EMAIL, poblacion, provincia, 'BURGOS' AS basededatos
FROM         COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'VALLADOLID' AS basededatos
FROM         gestinmceivall..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'SEGOVIA' AS basededatos
FROM         gestinmceisegovia..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'PALENCIA' AS basededatos
FROM         gestinmceipalencia..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'ARANDAMIRANDA' AS basededatos
FROM         gestinmARANDAMIRANDA..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'SANTANDER' AS basededatos
FROM         gestinmceisan..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'AVILA' AS basededatos
FROM         gestinmceiavila..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'SALAMANCA' AS basededatos
FROM         gestinmceisalamanca..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
UNION
SELECT     EMAIL, poblacion, provincia, 'LANZAROTE' AS basededatos
FROM         gestinmceilanzarote..COMPRADORES
WHERE     (EMAIL IS NOT NULL) AND (ANULA = 'N')
ORDER BY BASEDEDATOS

 

--------------

SELECT DISTINCT email
FROM         CONSULTAS_WEB
WHERE     (provincia LIKE '%alladoli%') AND (fecha >= '01/01/2010') AND (email IS NOT NULL)

 

 

-- Nº total de inmuebles activos en la compañía

SELECT     COUNT(*)
FROM         INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceivall..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceisegovia..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceipalencia..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmARANDAMIRANDA..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceisan..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceiavila..INMUEBLES
WHERE     ANULA <> 'Si'
UNION
SELECT     COUNT(*)
FROM         gestinmceisalamanca..INMUEBLES
WHERE     ANULA <> 'Si'

 

-- Buscar todos los telefonos para enviar SMS

SELECT     TELEFONO2, poblacion, provincia, 'BURGOS' AS basededatos
FROM         COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'VALLADOLID' AS basededatos
FROM         gestinmceivall..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'SEGOVIA' AS basededatos
FROM         gestinmceisegovia..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'PALENCIA' AS basededatos
FROM         gestinmceipalencia..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'ARANDAMIRANDA' AS basededatos
FROM         gestinmARANDAMIRANDA..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'SANTANDER' AS basededatos
FROM         gestinmceisan..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'AVILA' AS basededatos
FROM         gestinmceiavila..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
UNION
SELECT     TELEFONO2, poblacion, provincia, 'SALAMANCA' AS basededatos
FROM         gestinmceisalamanca..COMPRADORES
WHERE     (TELEFONO2 IS NOT NULL) and TELEFONO2 like '6%' AND (ANULA = 'N')
ORDER BY BASEDEDATOS

 

-- Calcular quienes están de baja y porqué un día determinado

SELECT     *
FROM         CALENDARIO_PERSONAL INNER JOIN
                      CATEGORIAS_CALENDARIO_PERSONAL ON CALENDARIO_PERSONAL.id_categoria = CATEGORIAS_CALENDARIO_PERSONAL.id_categoria INNER JOIN
                      SUBCATEGORIAS_CALENDARIO_PERSONAL ON
                      CALENDARIO_PERSONAL.id_subcategoria = SUBCATEGORIAS_CALENDARIO_PERSONAL.id_subcategoria INNER JOIN
                      GrupoPrigo.dbo.PERSONAL personal ON personal.id_empleado = CALENDARIO_PERSONAL.usuario
WHERE     (CALENDARIO_PERSONAL.fecha_inicio <= '13/10/2009') AND (CALENDARIO_PERSONAL.fecha_fin >= '13/10/2009')
ORDER BY personal.OFICINA

 

-- Ordenar empleados por fecha de cumpleaños

SELECT     NOMBRE, APELLIDOS, FECHA_NACIMIENTO, PROVINCIA, OFICINA, DIRECCION, FECHCONTRA, CATEGORIA_PROFESIONAL
FROM         PERSONAL
WHERE     (ANULA = 'N') AND (tipo_persona = 0) AND (FECHBAJA IS NULL) AND (FECHA_NACIMIENTO IS NOT NULL)
ORDER BY DATEPART(month, FECHA_NACIMIENTO), DATEPART(day, FECHA_NACIMIENTO), OFICINA

 

-- Saber cuantos toques de hoja de ruta han introducido los empleados en una fecha dada.

 

SELECT     HOJARUTA_VENDEDORES.fecha, COUNT(HOJARUTA_VENDEDORES.id_empleado) AS cnt, HOJARUTA_VENDEDORES.id_empleado,
                      GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS
FROM         HOJARUTA_VENDEDORES INNER JOIN
                      GrupoPrigo.dbo.PERSONAL ON GrupoPrigo.dbo.PERSONAL.id_empleado = HOJARUTA_VENDEDORES.id_empleado
WHERE     (HOJARUTA_VENDEDORES.fecha >= '01/11/2009')
GROUP BY HOJARUTA_VENDEDORES.id_empleado, HOJARUTA_VENDEDORES.fecha, GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS
ORDER BY HOJARUTA_VENDEDORES.id_empleado, HOJARUTA_VENDEDORES.fecha

 

-- Listado de clientes compradores con los datos completos para mailing de Amaro de todas las provincias

SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'BURGOS' AS basededatos
FROM         COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'VALLADOLID' AS basededatos
FROM         gestinmceivall..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'SEGOVIA' AS basededatos
FROM         gestinmceisegovia..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'PALENCIA' AS basededatos
FROM         gestinmceipalencia..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'ARANDAMIRANDA' AS basededatos
FROM         gestinmARANDAMIRANDA..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'SANTANDER' AS basededatos
FROM         gestinmceisan..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'AVILA' AS basededatos
FROM         gestinmceiavila..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
UNION
SELECT     nombre, email, fecha, apellidos, domicilio, codigo, poblacion, provincia, 'SALAMANCA' AS basededatos
FROM         gestinmceisalamanca..COMPRADORES
WHERE     (ANULA = 'N') AND fecha >= '01/01/2008' AND domicilio IS NOT NULL AND codigo IS NOT NULL AND codigo <> '' AND provincia IS NOT NULL AND
                      apellidos IS NOT NULL
ORDER BY BASEDEDATOS

 

-- Buscar las llamadas realizadas en una fecha dada a los clientes  que buscan un tipo de inmueble en particular

SELECT     *, GestInmBURGOS.dbo.COMPRADORES.TIPO AS Expr1
FROM         HOJARUTA_VENDEDORES INNER JOIN
                      GestInmBURGOS.dbo.COMPRADORES ON GestInmBURGOS.dbo.COMPRADORES.id_cliente = HOJARUTA_VENDEDORES.cliente
WHERE     (HOJARUTA_VENDEDORES.fecha >= '11/01/2010') AND (HOJARUTA_VENDEDORES.codigo = 'A') AND (HOJARUTA_VENDEDORES.cliente IN
                          (SELECT     id_cliente
                            FROM          gestinmburgos..compradores
                            WHERE      tipo = 'P' AND regimen IN ('C', 'A'))) AND (HOJARUTA_VENDEDORES.sociedad = 3)

 

-- Búsqueda en Inmuebles y propietarios cuando el where contiene un OR

SELECT     INMUEBLES.DIRECCION, INMUEBLES.REGIMEN, INMUEBLES.id_zona, INMUEBLES.POBLACION, INMUEBLES.id_vendedor, PROPIETARIOS.NOMBRE,
                      PROPIETARIOS.APELLIDOS, PROPIETARIOS.TELEFONO, PROPIETARIOS.TELEFONO2
FROM         INMUEBLES INNER JOIN
                      PROPIETARIOS ON INMUEBLES.N_PROPIETARIO = PROPIETARIOS.id_propietario
WHERE     (INMUEBLES.ANULA = 'No') AND (INMUEBLES.id_zona IN (50, 51, 52, 54, 53, 57)) OR
                      (INMUEBLES.ANULA = 'No') AND (INMUEBLES.id_zona = 2) AND (INMUEBLES.id_vendedor IN (2824, 2830))
ORDER BY INMUEBLES.POBLACION, INMUEBLES.DIRECCION

 

-- Saber el nº de inmuebles activos que tienen todos los vendedores

SELECT     COUNT(id_vendedor) AS [nº_INM_ACTIVOS], id_vendedor
FROM         INMUEBLES
WHERE     (ANULA <> 'Si')
GROUP BY id_vendedor

 

-- Listado de clientes desasignados de Burgos

SELECT     COMPRADORES.id_cliente, COMPRADORES.TIPO, COMPRADORES.REGIMEN, GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS
FROM         COMPRADORES INNER JOIN
                      GrupoPrigo.dbo.PERSONAL ON GrupoPrigo.dbo.PERSONAL.id_empleado = COMPRADORES.id_vendedor
WHERE     (COMPRADORES.ANULA = 'N') AND (COMPRADORES.id_vendedor NOT IN
                          (SELECT     id_empleado
                            FROM          GrupoPrigo..PERSONAL
                            WHERE      (ANULA = 'N')))
ORDER BY GrupoPrigo.dbo.PERSONAL.NOMBRE, GrupoPrigo.dbo.PERSONAL.APELLIDOS, COMPRADORES.TIPO, COMPRADORES.REGIMEN

 

-- Borrar - Vaciar bases de datos de inmuebles

DELETE FROM COMPRADORES;
DELETE FROM FOTOS_INMUEBLES;
DELETE FROM FOTOS_VISITAS;
DELETE FROM GASTOS_PUBLICIDAD;
DELETE FROM GESTION_EXPEDIENTES;
DELETE FROM INMUEBLES;
DELETE FROM OFICINAS;
DELETE FROM PETICION_INFORMES;
DELETE FROM PRENSA;
DELETE FROM PROMOCIONES;
DELETE FROM PROPIETARIOS;
DELETE FROM USUARIOS;
DELETE FROM VISITAS;
DELETE FROM ZONAS

 

-- Buscar un  elementos de un campo que no estan en otros campos, FULL OUTER JOIN, UNION

  -- En este caso se compara VISITAS_TEL.telefono con los campos telefono1,2,3, etc de la tabla VISITAS

  -- Se establece el alias VISITAS_TEL vt

SELECT DISTINCT vt.telefono
FROM         VISITAS_TEL vt FULL OUTER JOIN
                          (SELECT DISTINCT telefono
                            FROM               (SELECT DISTINCT telefono1 AS telefono
                                                    FROM          VISITAS
                                                    UNION ALL
                                                    SELECT DISTINCT telefono2 AS telefono
                                                    FROM         VISITAS
                                                    UNION ALL
                                                    SELECT DISTINCT telefono3 AS telefono
                                                    FROM         VISITAS
                                                    UNION ALL
                                                    SELECT DISTINCT telefono4 AS telefono
                                                    FROM         VISITAS
                                                    UNION ALL
                                                    SELECT DISTINCT telefono5 AS telefono
                                                    FROM         VISITAS
                                                    UNION ALL
                                                    SELECT DISTINCT telefono6 AS telefono
                                                    FROM         VISITAS)

                           RESULTADO1)

RESULTADO2 ON vt.telefono = RESULTADO2.telefono
WHERE     (vt.telefono IS NOT NULL) AND (RESULTADO2.telefono IS NULL)

 

--Buscar elementos de un campo que no esten en otro campo, FULL OUTER JOIN

Es el ejemplo simplificado del de arriba
select vt.telefono
from VISITAS_TEL vt FULL OUTER JOIN VISITAS v on vt.telefono = v.telefono1
where vt.telefono is not null and v.telefono1 is null


-- VALENCIA
-- Consulta tipica de clientes y solicitudes de Gestcomvijar

SELECT     CLIENTES.id_persona AS idcliente, CLIENTES.nombre AS nombre, CLIENTES.apellidos AS apellidos, CLIENTES.apellidos2 AS apellidos2,
                      CLIENTES.pais AS pais, CLIENTES.localidad AS localidad, CLIENTES.provincia AS provincia, CLIENTES.edad AS edad,
                      CLIENTES.estado_civil AS estado_civil, CLIENTES.clase_social AS clase_social, SOLICITUDES.*, GrupoPrigo.dbo.PERSONAL.NOMBRE AS N,
                      GrupoPrigo.dbo.PERSONAL.APELLIDOS AS A, SOLICITUDES.fecha_alta AS fechaalta, SUBSTRING(SOLICITUDES.comercial, 0,
                      { fn LENGTH(SOLICITUDES.comercial) }) AS comercial2
FROM         CLIENTES INNER JOIN
                      SOLICITUDES ON CLIENTES.id_persona = SOLICITUDES.id_cliente INNER JOIN
                      GrupoPrigo.dbo.PERSONAL ON GrupoPrigo.dbo.PERSONAL.id_empleado = SUBSTRING(SOLICITUDES.comercial, 0,
                      { fn LENGTH(SOLICITUDES.comercial) })
WHERE     (CLIENTES.id_persona LIKE '%%') AND (CLIENTES.anulado = 'Activo')
ORDER BY N, A, idcliente DESC

 

-- Para buscar clientes activos

SELECT     GrupoPrigo.dbo.PERSONAL.NOMBRE AS N, GrupoPrigo.dbo.PERSONAL.APELLIDOS AS A, SOLICITUDES.fecha_alta AS fechaalta,
                      SUBSTRING(SOLICITUDES.comercial, 0, { fn LENGTH(SOLICITUDES.comercial) }) AS comercial2, CLIENTES.*, SOLICITUDES.*
FROM         CLIENTES INNER JOIN
                      SOLICITUDES ON CLIENTES.id_persona = SOLICITUDES.id_cliente INNER JOIN
                      GrupoPrigo.dbo.PERSONAL ON GrupoPrigo.dbo.PERSONAL.id_empleado = SUBSTRING(SOLICITUDES.comercial, 0,
                      { fn LENGTH(SOLICITUDES.comercial) })
WHERE     (CLIENTES.id_persona LIKE '%%') AND (CLIENTES.anulado = 'Activo')

ORDER BY N, A, fechaalta 

 

-- Consulta de clientes y solicitudes de Gestcomvijar correspondientes a varios comerciales 

SELECT     *, GrupoPrigo.dbo.PERSONAL.NOMBRE AS N, GrupoPrigo.dbo.PERSONAL.APELLIDOS AS A, SOLICITUDES.fecha_alta AS fechaalta,
                      SUBSTRING(SOLICITUDES.comercial, 0, { fn LENGTH(SOLICITUDES.comercial) }) AS comercial2
FROM         CLIENTES INNER JOIN
                      SOLICITUDES ON CLIENTES.id_persona = SOLICITUDES.id_cliente INNER JOIN
                      GrupoPrigo.dbo.PERSONAL ON GrupoPrigo.dbo.PERSONAL.id_empleado = SUBSTRING(SOLICITUDES.comercial, 0,
                      { fn LENGTH(SOLICITUDES.comercial) })
WHERE     (CLIENTES.id_persona LIKE '%%') AND (CLIENTES.anulado = 'Activo') AND (CLIENTES.id_persona IN
                          (SELECT     id_cliente
                            FROM          solicitudes
                            WHERE      id_solicitud LIKE '%%' AND comercial IN ('1436e', '2253c', '2566c', '2450c', '2145c', '1448e')))
ORDER BY GrupoPrigo.dbo.PERSONAL.usuario DESC 

--NOTA: Hay que tener en cuenta, que salen solicitudes de otros comerciales, y que hay que eliminarlas a mano de los resultados

 

-- Contar fichas activas de un comercial en concreto

SELECT     COUNT(*) AS Expr1
FROM         SOLICITUDES INNER JOIN
                      CLIENTES ON CLIENTES.id_persona = SOLICITUDES.id_cliente
WHERE     (SOLICITUDES.comercial = '2587e') AND (CLIENTES.anulado = 'Activo')

 

-- Cambiar las fichas activas de un comercial

UPDATE    SOLICITUDES
SET              comercial = '638e'
WHERE     (id_cliente IN
                          (SELECT     clientes.id_persona
                            FROM          CLIENTES INNER JOIN
                                                   SOLICITUDES ON CLIENTES.id_persona = SOLICITUDES.id_cliente
                            WHERE      (CLIENTES.anulado = 'Activo') AND (SOLICITUDES.comercial = '489e')))

 

-- Pasar clientes de un comercial a otro

UPDATE    SOLICITUDES
SET              comercial = '2758e'
WHERE     (id_cliente IN
                          (SELECT     clientes.id_persona
                            FROM          CLIENTES INNER JOIN
                                                   SOLICITUDES ON CLIENTES.id_persona = SOLICITUDES.id_cliente
                            WHERE      (CLIENTES.id_persona IN (496, 845, 877, 878, 895, 904, 912, 923))))

 

-- Saber el origen de las nuevas fichas de clientes desde una fecha dada

SELECT     CLIENTES.id_persona, CLIENTES.nombre, CLIENTES.apellidos, CLIENTES.tfijo, CLIENTES.mail, CLIENTES.pais, MIN(SOLICITUDES.fecha_alta),

                      PROMOCIONES.nombre_promocion, SOLICITUDES.regimen, CLIENTES.como_conocido AS id_conocido, Z_CONOCIDO_PADRE.descripcion,

                      CLIENTES.como_conocido_soporte AS id_como_conocido, Z_COMO_CONOCIDO_SOPORTE.como_conocido_soporte, CLIENTES.anulado

FROM         Z_COMO_CONOCIDO_SOPORTE INNER JOIN

                      Z_CONOCIDO_PADRE ON Z_COMO_CONOCIDO_SOPORTE.id_como_conocido = Z_CONOCIDO_PADRE.como_conocido RIGHT OUTER JOIN

                      SOLICITUDES INNER JOIN

                      CLIENTES ON SOLICITUDES.id_cliente = CLIENTES.id_persona INNER JOIN

                      PROMOCIONES ON SOLICITUDES.promocion_solicitada = PROMOCIONES.id_promocion ON

                      Z_COMO_CONOCIDO_SOPORTE.id_como_conocido_soporte = CLIENTES.como_conocido_soporte AND

                      Z_CONOCIDO_PADRE.como_conocido = CLIENTES.como_conocido

GROUP BY CLIENTES.id_persona, CLIENTES.nombre, CLIENTES.apellidos, CLIENTES.tfijo, CLIENTES.mail, CLIENTES.pais, PROMOCIONES.nombre_promocion,

                      SOLICITUDES.regimen, CLIENTES.como_conocido, Z_CONOCIDO_PADRE.descripcion, CLIENTES.como_conocido_soporte,

                      Z_COMO_CONOCIDO_SOPORTE.como_conocido_soporte, CLIENTES.anulado
HAVING      (SOLICITUDES.regimen = N'turistico') AND (MIN(SOLICITUDES.fecha_alta) > CONVERT(DATETIME, '2010-01-01 00:00:00', 102)) 
