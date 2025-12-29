SELECT
    CASE
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 30 THEN '0-30'
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 60 THEN '31-60'
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 90 THEN '61-90'
        ELSE '90+'
    END AS AgingBucket,
    COUNT(*) AS TransactionCount,
    SUM(OutstandingBalance) AS TotalOutstanding
FROM Purchasing.SupplierTransactions
WHERE OutstandingBalance > 0
GROUP BY
    CASE
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 30 THEN '0-30'
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 60 THEN '31-60'
        WHEN DATEDIFF(day, TransactionDate, GETDATE()) <= 90 THEN '61-90'
        ELSE '90+'
    END
ORDER BY
    MIN(DATEDIFF(day, TransactionDate, GETDATE()));
