# Cargar librerías
library(ggplot2)
library(dplyr)

# Simulación de carga de datos (normalmente cargarías desde la base de datos)
load_data <- function() {
  categories <- data.frame(
    CategoryName = c('Beverages', 'Condiments', 'Confections', 'Dairy Products'),
    TotalSales = c(1500, 800, 1200, 600)
  )
  
  customers <- data.frame(
    CustomerName = c('Alfreds Futterkiste', 'Ana Trujillo', 'Antonio Moreno'),
    TotalOrders = c(10, 15, 7)
  )
  
  return(list(categories = categories, customers = customers))
}

# Función para mostrar gráfico de ventas por categoría
show_sales_by_category <- function() {
  data <- load_data()
  ggplot(data$categories, aes(x = CategoryName, y = TotalSales)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(title = "Total de Ventas por Categoría", x = "Categoría", y = "Total de Ventas") +
    theme_minimal() +
    ggsave("sales_by_category.png")
}

# Función para mostrar gráfico de pedidos por cliente
show_orders_by_customer <- function() {
  data <- load_data()
  ggplot(data$customers, aes(x = CustomerName, y = TotalOrders)) +
    geom_bar(stat = "identity", fill = "tomato") +
    labs(title = "Número de Pedidos por Cliente", x = "Cliente", y = "Número de Pedidos") +
    theme_minimal() +
    ggsave("orders_by_customer.png")
}

# Ejecutar funciones según argumentos
args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) {
  if (args[1] == "sales") {
    show_sales_by_category()
  } else if (args[1] == "orders") {
    show_orders_by_customer()
  }
}
