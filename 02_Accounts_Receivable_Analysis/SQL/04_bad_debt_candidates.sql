SELECT TOP 20
    CustomerID,
    TransactionDate,
    DATEDIFF(day, TransactionDate, GETDATE()) AS DaysOutstanding,
    OutstandingBalance
FROM Sales.CustomerTransactions
WHERE OutstandingBalance > 0
  AND DATEDIFF(day, TransactionDate, GETDATE()) > 90
ORDER BY OutstandingBalance DESC;
