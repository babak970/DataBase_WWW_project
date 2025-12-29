SELECT
    SUM(CASE WHEN TransactionAmount > 0 THEN TransactionAmount ELSE 0 END) AS TotalCashIn,
    SUM(CASE WHEN TransactionAmount < 0 THEN -TransactionAmount ELSE 0 END) AS TotalCashOut,
    SUM(CASE WHEN TransactionAmount > 0 THEN TransactionAmount ELSE 0 END)
      - SUM(CASE WHEN TransactionAmount < 0 THEN -TransactionAmount ELSE 0 END) AS NetCashFlow
FROM (
    SELECT TransactionAmount FROM Sales.CustomerTransactions
    UNION ALL
    SELECT TransactionAmount FROM Purchasing.SupplierTransactions
) t;
