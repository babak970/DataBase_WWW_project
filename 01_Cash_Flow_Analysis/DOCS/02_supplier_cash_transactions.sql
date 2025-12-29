/* =========================================
   Query 3A: Customer Transaction Sign Analysis
   Purpose: Identify positive vs negative
   customer transactions
   ========================================= */

SELECT
    CASE 
        WHEN TransactionAmount >= 0 THEN 'Positive (>= 0)'
        ELSE 'Negative (< 0)'
    END AS TransactionSign,
    COUNT(*) AS TransactionCount,
    SUM(TransactionAmount) AS TotalAmount
FROM Sales.CustomerTransactions
GROUP BY
    CASE 
        WHEN TransactionAmount >= 0 THEN 'Positive (>= 0)'
        ELSE 'Negative (< 0)'
    END;



/* =========================================
   Query 3B: Supplier Transaction Sign Analysis
   Purpose: Identify positive vs negative
   supplier transactions
   ========================================= */

SELECT
    CASE 
        WHEN TransactionAmount >= 0 THEN 'Positive (>= 0)'
        ELSE 'Negative (< 0)'
    END AS TransactionSign,
    COUNT(*) AS TransactionCount,
    SUM(TransactionAmount) AS TotalAmount
FROM Purchasing.SupplierTransactions
GROUP BY
    CASE 
        WHEN TransactionAmount >= 0 THEN 'Positive (>= 0)'
        ELSE 'Negative (< 0)'
    END;
