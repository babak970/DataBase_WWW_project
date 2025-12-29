DECLARE @Days INT = 365;

DECLARE @AsOfDate DATE =
(
    SELECT MAX(TransactionDate)
    FROM Purchasing.SupplierTransactions
);

WITH PeriodPurchases AS (
    SELECT
        SUM(CASE WHEN TransactionAmount < 0 THEN -TransactionAmount ELSE 0 END) AS TotalPurchases
    FROM Purchasing.SupplierTransactions
    WHERE TransactionDate BETWEEN DATEADD(day, -@Days, @AsOfDate) AND @AsOfDate
),
PeriodAP AS (
    SELECT
        SUM(OutstandingBalance) AS TotalAP
    FROM Purchasing.SupplierTransactions
    WHERE OutstandingBalance > 0
      AND TransactionDate BETWEEN DATEADD(day, -@Days, @AsOfDate) AND @AsOfDate
)
SELECT
    @AsOfDate AS AsOfDate,
    @Days AS PeriodDays,
    COALESCE(a.TotalAP, 0) AS TotalAccountsPayable,
    COALESCE(p.TotalPurchases, 0) AS TotalPurchases,
    CASE
        WHEN COALESCE(p.TotalPurchases, 0) = 0 THEN NULL
        ELSE (COALESCE(a.TotalAP, 0) / COALESCE(p.TotalPurchases, 0)) * @Days
    END AS DPO
FROM PeriodAP a
CROSS JOIN PeriodPurchases p;
