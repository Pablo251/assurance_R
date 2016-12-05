# Script para conectarse a la base de datos

install.packages("RPostgreSQL")
install.packages("devtools")

library("RPostgreSQL")
library("dotenv")

load_dot_env()

drv <- dbDriver("PostgreSQL")

host <- Sys.getenv("POSTGRESQL_HOST")
port <- Sys.getenv("POSTGRESQL_PORT")
dbname <- Sys.getenv("POSTGRESQL_DBNAME")
user <- Sys.getenv("POSTGRESQL_USER")
password <- Sys.getenv("POSTGRESQL_PASSWORD")

con <- dbConnect(drv, host=host, port=port, dbname=dbname, user=user, password=password)

# Crecimiento de los ingresos
#df_postgres <- dbGetQuery(con, "SELECT ventas('2016-11-01', '2016-12-01', 100)")

# Beneficio o rentabilidad de la inversión
#df_postgres <- dbGetQuery(con, "SELECT ventas('2016-11-01', '2016-12-01')")
#df_postgres <- dbGetQuery(con, "SELECT inversiones('2016-11-01', '2016-12-01')")

# Interés del producto
#df_postgres <- dbGetQuery(con, "SELECT highest_sales()")

# Crecimiento de las ventas
#df_postgres <- dbGetQuery(con, "SELECT crecimiento_ventas()")

# Fidelidad del cliente
#df_postgres <- dbGetQuery(con, "SELECT fidelidad_potencial()")

# Imprimir resultado
#print(df_postgres)
