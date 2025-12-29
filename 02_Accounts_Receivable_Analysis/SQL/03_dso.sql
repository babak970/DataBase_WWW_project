DECLARE @Days INT = 365;

DECLARE @AsOfDate DATE =
(
    SELECT MAX(TransactionDate)
    FROM Sales.CustomerTransactions
);

WITH PeriodSales AS (
    SELECT
        SUM(CASE WHEN TransactionAmount > 0 THEN TransactionAmount ELSE 0 END) AS TotalSales
    FROM Sales.CustomerTransactions
    WHERE TransactionDate >= DATEADD(day, -@Days, @AsOfDate)
      AND TransactionDate <= @AsOfDate
),
PeriodAR AS (
    SELECT
        SUM(OutstandingBalance) AS TotalAR
    FROM Sales.CustomerTransactions
    WHERE OutstandingBalance > 0
      AND TransactionDate >= DATEADD(day, -@Days, @AsOfDate)
      AND TransactionDate <= @AsOfDate
)
SELECT
    @AsOfDate AS AsOfDate,
    @Days AS PeriodDays,
    COALESCE(a.TotalAR, 0) AS TotalAR,
    COALESCE(s.TotalSales, 0) AS TotalSales,
    CASE
        WHEN COALESCE(s.TotalSales, 0) = 0 THEN NULL
        ELSE (COALESCE(a.TotalAR, 0) / COALESCE(s.TotalSales, 0)) * @Days
    END AS DSO
FROM PeriodAR a
CROSS JOIN PeriodSales s;
