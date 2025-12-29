SELECT
    pm.PaymentMethodName,
    COUNT(*) AS TransactionCount
FROM Sales.CustomerTransactions ct
JOIN Application.PaymentMethods pm
    ON ct.PaymentMethodID = pm.PaymentMethodID
WHERE ct.PaymentMethodID IS NOT NULL
GROUP BY pm.PaymentMethodName
ORDER BY TransactionCount DESC;
