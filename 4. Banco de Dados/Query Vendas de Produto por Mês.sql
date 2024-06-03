--A query os produtos, meses em que o produto foi comprado (através da função 'MONTH'), soma as quantidades para mostrar quantas vendas foram feitas de cada produto em cada mês
SELECT 
	[product_name],
	MONTH([order_date]) AS month,
	SUM(quantity) AS total_vendas
FROM
	[dbo].['Sales and Customers$']
GROUP BY
	[product_name], MONTH([order_date])
ORDER BY
	MONTH([order_date]), [product_name];