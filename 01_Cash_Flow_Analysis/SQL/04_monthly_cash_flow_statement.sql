WITH CustomerMonthly AS (
    SELECT
        DATEFROMPARTS(YEAR(TransactionDate), MONTH(TransactionDate), 1) AS MonthStart,
        SUM(CASE WHEN TransactionAmount > 0 THEN TransactionAmount ELSE 0 END) AS CashIn_Customers,
        SUM(CASE WHEN TransactionAmount < 0 THEN -TransactionAmount ELSE 0 END) AS CashOut_Customers
    FROM Sales.CustomerTransactions
    GROUP BY DATEFROMPARTS(YEAR(TransactionDate), MONTH(TransactionDate), 1)
),
SupplierMonthly AS (
    SELECT
        DATEFROMPARTS(YEAR(TransactionDate), MONTH(TransactionDate), 1) AS MonthStart,
        SUM(CASE WHEN TransactionAmount > 0 THEN TransactionAmount ELSE 0 END) AS CashIn_Suppliers,
        SUM(CASE WHEN TransactionAmount < 0 THEN -TransactionAmount ELSE 0 END) AS CashOut_Suppliers
    FROM Purchasing.SupplierTransactions
    GROUP BY DATEFROMPARTS(YEAR(TransactionDate), MONTH(TransactionDate), 1)
)
SELECT
    COALESCE(c.MonthStart, s.MonthStart) AS MonthStart,

    COALESCE(c.CashIn_Customers, 0) AS CashIn_Customers,
    COALESCE(c.CashOut_Customers, 0) AS CashOut_Customers,

    COALESCE(s.CashIn_Suppliers, 0) AS CashIn_Suppliers,
    COALESCE(s.CashOut_Suppliers, 0) AS CashOut_Suppliers,

    -- Company-level view (simple, explainable):
    -- Inflows: customer cash-in + any supplier-side inflows (credits/adjustments)
    -- Outflows: customer-side outflows (refunds) + supplier cash-out
    (COALESCE(c.CashIn_Customers, 0) + COALESCE(s.CashIn_Suppliers, 0)) AS TotalCashIn,
    (COALESCE(c.CashOut_Customers, 0) + COALESCE(s.CashOut_Suppliers, 0)) AS TotalCashOut,
    (COALESCE(c.CashIn_Customers, 0) + COALESCE(s.CashIn_Suppliers, 0))
      - (COALESCE(c.CashOut_Customers, 0) + COALESCE(s.CashOut_Suppliers, 0)) AS NetCashFlow
FROM CustomerMonthly c
FULL OUTER JOIN SupplierMonthly s
    ON c.MonthStart = s.MonthStart
ORDER BY MonthStart;
