SELECT
    pm.PaymentMethodName,
    SUM(CASE WHEN ct.TransactionAmount > 0 THEN ct.TransactionAmount ELSE 0 END) AS TotalValue,
    COUNT(*) AS TransactionCount
FROM Sales.CustomerTransactions ct
JOIN Application.PaymentMethods pm
    ON ct.PaymentMethodID = pm.PaymentMethodID
WHERE ct.PaymentMethodID IS NOT NULL
GROUP BY pm.PaymentMethodName
ORDER BY TotalValue DESC;
