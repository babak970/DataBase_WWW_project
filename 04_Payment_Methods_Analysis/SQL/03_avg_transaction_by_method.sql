SELECT
    pm.PaymentMethodName,
    AVG(ct.TransactionAmount) AS AvgTransactionAmount,
    MIN(ct.TransactionAmount) AS MinTransactionAmount,
    MAX(ct.TransactionAmount) AS MaxTransactionAmount,
    COUNT(*) AS TransactionCount
FROM Sales.CustomerTransactions ct
JOIN Application.PaymentMethods pm
    ON ct.PaymentMethodID = pm.PaymentMethodID
WHERE ct.PaymentMethodID IS NOT NULL
GROUP BY pm.PaymentMethodName
ORDER BY AvgTransactionAmount DESC;
