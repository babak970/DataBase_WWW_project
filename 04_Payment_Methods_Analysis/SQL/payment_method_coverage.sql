SELECT
    CASE 
        WHEN PaymentMethodID IS NULL THEN 'No PaymentMethodID'
        ELSE 'Has PaymentMethodID'
    END AS PaymentMethodCoverage,
    COUNT(*) AS TransactionCount
FROM Sales.CustomerTransactions
GROUP BY
    CASE 
        WHEN PaymentMethodID IS NULL THEN 'No PaymentMethodID'
        ELSE 'Has PaymentMethodID'
    END;
