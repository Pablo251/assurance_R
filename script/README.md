# Script para análisis de los datos utilizando R

En este directorio contiene los archivos necesarios para realizar la minería en usando una base de datos PostgreSQL. Nótese que estas instrucciones están basadas en un ambiente de desarrollo con sistema operativo Linux o sus derivados.

## Dependencias

* R 3.2.3
* PostgreSQL 9.5.5
* libpq-dev

## Configuración


## Ejecutar script

En este caso, se utilizará la consola de R para ejecutar el script.	

1. Ejecutar la consola de R usando `sudo` con el siguiente comando, se necesita los permisos de administrador ya que al parecer R necesita los mismos para hacer cambios a una base de datos utilizando el driver.
  ```bash
  sudo R
  ```

2. Abrir código del script utilizando la instrucción `source` desde la consola de R.
  ```r
  source("ruta-del-archivo.r")
  ```

## Soluciones a problemas comunes

`Error in postgresqlNewConnection(drv, ...) : RS-DBI driver: (could not connect ...` - [Revisar las credenciales para la conexión](https://discuss.analyticsvidhya.com/t/error-while-creating-a-connection-in-rpostgresql-package/8915)

`RS-DBI driver: (could not Retrieve the result : ERROR:  permission denied for relation *dbname*` - [Dar permisos a las tablas en la base de datos que se va a utilizar.](http://stackoverflow.com/questions/15520361/permission-denied-for-relation)

### Sobre el proyecto

Proyecto final del curso de Minería de Datos.


Integrantes:

* Pablo Arce
* Daniel Calderón
* Marco Carmona
* Isabel González
