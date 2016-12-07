#--------------------------------------------------Conexión a la base de datos-----------------------------------------------
install.packages("RPostgreSQL")
con=dbConnect(PostgreSQL(), user="postgres", dbname="cerise_assurance", password="YourPassword")

#-------------------------Crecimiento de los ingresos--------------------KPI = 1
crecimientoIngresos <- dbGetQuery(con, "SELECT * FROM ventas('2016-12-01','2017-12-31', 100)")
barplot(crecimientoIngresos[[1]],main="Crecimiento",ylab="Total",names.arg=c("Anterior"),border="blue",density=c(40,50))


#--------------------------Graficar ventas e inversiones-----------------KPI = 2

totalVentas <- dbGetQuery(con, "SELECT * FROM ventas('2016-10-22','2017-12-02', NULL)")#llama al método donde toma el total de ventas entre dos fechas
totalInversiones <- dbGetQuery(con, "SELECT * FROM inversiones('2016-10-22','2017-12-02', NULL)")# llama al método que suma el total de inversiones entre dos fechas
rentabilidadInversion <- c(totalVentas[[1]], totalInversiones[[1]])# almacena los datos de ventas e inversiones en un vector
barplot(rentabilidadInversion,main="Rentabilidad",ylab="Total",names.arg=c("Ventas","Inversiones"),border="blue",density=c(40,50)) #grafica el total de ventas y el total de inversiones.


#---------Gráfico de Productos más vendidos (interes del producto)------ KPI = 3
mejoresProductos <- dbGetQuery(con, "SELECT * FROM highest_sales()")

colors <- c("white","grey70","grey90","grey50","black")

# Calcula el porcentaje
pro_labels <- round(mejoresProductos[[3]]/sum(mejoresProductos[[3]]) * 100, 1)

# Concatena el simbolo "%" a cada valor
pro_labels <- paste(pro_labels, "%", sep="")

# Crea el pie chart
pie(mejoresProductos[[3]], main="Producto Más Vendidos", col=colors, labels=pro_labels,
   cex=0.8)

   legend(1.5, 0.5, mejoresProductos[[1]], cex=0.8,
   fill=colors)

#-------------------------------------Crecimiento de las Ventas----------KPI = 4
#--Ejecuta el gráfico de crecimiento_ventas()
crece <- dbGetQuery(con, "SELECT * FROM crecimiento_ventas()")# llama al método de crecimiento de ventas
barplot(crece[[1]],main="Crecimiento",xlab="Mes",ylab="Total",names.arg=c("Anterior","Actual"),border="blue",density=c(40,50))# grafica el crecimiento



#-------------------------------------Fidelidad del cliente--------------KPI = 5

fidelidad <- dbGetQuery(con, "SELECT * FROM fidelidad_potencial()")

colors <- c("white","grey70","grey90","grey50","black")

# Calcula el porcentaje
cli_labels <- round(fidelidad[[3]]/sum(fidelidad[[3]]) * 100, 1)

# Concatena el simbolo "%" a cada valor
cli_labels <- paste(cli_labels, "%", sep="")

# Crea el pie chart
pie(fidelidad[[3]], main="Producto Más Vendidos", col=colors, labels=cli_labels,
   cex=0.8)

   legend(1.5, 0.5, fidelidad[[1]], cex=0.8,
   fill=colors)
