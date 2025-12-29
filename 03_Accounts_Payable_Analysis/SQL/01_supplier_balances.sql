SELECT
    SupplierID,
    SUM(OutstandingBalance) AS TotalOutstandingBalance
FROM Purchasing.SupplierTransactions
WHERE OutstandingBalance > 0
GROUP BY SupplierID
ORDER BY TotalOutstandingBalance DESC;
--how much do we owe and to who?