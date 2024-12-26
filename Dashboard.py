import tkinter as tk
import subprocess
import os

def generate_sales_plot():
    subprocess.run(["Rscript", "Process.R", "sales"])
    os.startfile("sales_by_category.png")

def generate_orders_plot():
    subprocess.run(["Rscript", "generate_plots.R", "orders"])
    os.startfile("orders_by_customer.png")

def main():
    root = tk.Tk()
    root.title("Interfaz Gráfica para Análisis Northwind")

    btn_sales = tk.Button(root, text="Mostrar Ventas por Categoría", command=generate_sales_plot)
    btn_sales.pack(pady=10)

    btn_orders = tk.Button(root, text="Mostrar Pedidos por Cliente", command=generate_orders_plot)
    btn_orders.pack(pady=10)

    root.mainloop()

if __name__ == "__main__":
    main()
