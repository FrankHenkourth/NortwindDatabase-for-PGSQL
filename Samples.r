

# Unir tablas para obtener información de ventas
sales_summary <- order_details %>%
  inner_join(products, by = "ProductID") %>%
  inner_join(categories, by = "CategoryID") %>%
  group_by(CategoryName) %>%
  summarise(TotalSales = sum(Quantity)) %>%
  arrange(desc(TotalSales))

print(sales_summary)
######################
customer_orders <- orders %>%
  group_by(CustomerID) %>%
  summarise(TotalOrders = n()) %>%
  inner_join(customers, by = c("CustomerID" = "CustomerID"))

print(customer_orders)
################
ggplot(sales_summary, aes(x = reorder(CategoryName, -TotalSales), y = TotalSales)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Total de Ventas por Categoría", x = "Categoría", y = "Total de Ventas") +
  theme_minimal() +
  coord_flip()
##############
ggplot(customer_orders, aes(x = reorder(CustomerName, -TotalOrders), y = TotalOrders)) +
  geom_bar(stat = "identity", fill = "tomato") +
  labs(title = "Número de Pedidos por Cliente", x = "Cliente", y = "Número de Pedidos") +
  theme_minimal() +
  coord_flip()
###########################
