# Script para conectarse a la base de datos

install.packages("RPostgreSQL")

library("RPostgreSQL")

drv <- dbDriver("PostgreSQL")

con <- dbConnect(drv, host='localhost', port='5432', dbname='postgres', user='tester', password='12345')

# print(dbExistsTable(con, 'seguros'))

df_postgres <- dbGetQuery(con, "SELECT * from seguros")

print(df_postgres)
