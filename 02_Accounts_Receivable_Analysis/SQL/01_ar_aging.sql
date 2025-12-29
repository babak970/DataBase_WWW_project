SELECT TOP 10
    CustomerID,
    SUM(OutstandingBalance) AS TotalOutstandingBalance
FROM Sales.CustomerTransactions
WHERE OutstandingBalance > 0
GROUP BY CustomerID
ORDER BY TotalOutstandingBalance DESC;
