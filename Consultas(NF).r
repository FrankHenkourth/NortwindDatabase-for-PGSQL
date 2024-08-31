library(RPostgres)

# Establecer los parámetros de conexión
db_host <- "localhost"     # Cambia esto si tu servidor está en otra dirección
db_port <- 5432            # Puerto por defecto de PostgreSQL
db_name <- "NorthWind"     # Cambia esto por el nombre de tu base de datos
db_user <- "postgres"      # Cambia esto por tu nombre de usuario
db_password <- "postgres"  # Cambia esto por tu contraseña

# conexión a la base de datos
con <- dbConnect(RPostgres::Postgres(),
                 host = db_host,
                 port = db_port,
                 dbname = db_name,
                 user = db_user,
                 password = db_password)


clientes <- dbGetQuery(con, "SELECT * FROM Customers;")
print(clientes)

# número de productos por categoría
productos_por_categoria <- dbGetQuery(con, "
  SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
  FROM Categories c
  LEFT JOIN Products p ON c.CategoryID = p.CategoryID
  GROUP BY c.CategoryName;
")
print(productos_por_categoria)

# Cerrar la conexión
dbDisconnect(con)
