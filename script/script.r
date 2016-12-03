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

# print(dbExistsTable(con, 'seguros')) Busca si existe una tabla con el nombre 'seguros'

df_postgres <- dbGetQuery(con, "SELECT * from seguros")

print(df_postgres)
