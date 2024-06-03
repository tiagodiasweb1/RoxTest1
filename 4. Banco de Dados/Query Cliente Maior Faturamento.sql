SELECT *
FROM dbo.['Sales and Customers$'];


-- Criar uma nova coluna chamada 'faturamento'
ALTER TABLE [dbo].['Sales and Customers$']
ADD faturamento DECIMAL(18, 2);

-- Adicionar valores na nova coluna, multiplicando as colunas 'quantity' e 'unity_price'
UPDATE [dbo].['Sales and Customers$']
SET faturamento = quantity * unit_price;


-- Criar uma nova coluna chamada 'nome completo'
ALTER TABLE [dbo].['Sales and Customers$']
ADD [nome completo] NVARCHAR(255);

-- Em seguida, atualizamos a nova coluna com os valores concatenados
UPDATE [dbo].['Sales and Customers$']
SET [nome completo] = nome + ' ' + sobrenome;

-- Depois de criar as novas colunas, usamos as mesmas para mostrar os clientes que mais geraram faturamento
SELECT 
	[nome completo],
	SUM(faturamento) AS total_faturamento
FROM
	dbo.['Sales and Customers$']
GROUP BY
	[nome completo]
ORDER BY
	[total_faturamento] DESC;