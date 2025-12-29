# Accounts Receivable Analysis

## Query 1: Accounts Receivable Aging

**File:** 01_ar_aging.sql

**Purpose:**  
Classify outstanding customer balances based on how long they have remained unpaid.

**Tables Used:**  
- Sales.CustomerTransactions

**Logic:**  
Outstanding balances greater than zero are grouped into aging buckets based on the number of days since the transaction date: 0–30, 31–60, 61–90, and over 90 days.

**Insight:**  
(To be completed after reviewing which aging buckets hold the highest outstanding balances.)

--------------------------------------------------------------


## Query 2: Top Debtors

**File:** 02_top_debtors.sql

**Purpose:**  
Identify customers with the highest outstanding balances to assess concentration of credit risk.

**Tables Used:**  
- Sales.CustomerTransactions

**Logic:**  
Outstanding balances are aggregated per customer, and the top 10 customers with the largest unpaid balances are selected.

**Insight:**  
A small number of customers typically account for a significant portion of total receivables, indicating potential risk concentration.



-------------------------------



## Query 3: Days Sales Outstanding (DSO)

**File:** 03_dso.sql

**Purpose:**  
Estimate how long it takes, on average, to collect receivables from customers.

**Tables Used:**  
- Sales.CustomerTransactions

**Logic:**  
DSO is approximated using: (Total Accounts Receivable / Total Sales) × PeriodDays.  
Accounts Receivable is calculated as SUM(OutstandingBalance) for the selected period.  
Sales is calculated as SUM(positive TransactionAmount) for the same period.

**Insight:**  
Higher DSO indicates slower collections and potential liquidity pressure. Lower DSO indicates faster cash collection and healthier receivables management.





--------------------------------


## Query 4: Bad Debt Candidates (High-Risk Receivables)

**File:** 04_bad_debt_candidates.sql

**Purpose:**  
Identify outstanding receivables that are significantly overdue and may become uncollectible (bad debt risk).

**Tables Used:**  
- Sales.CustomerTransactions

**Logic:**  
Receivables are filtered to records with OutstandingBalance > 0 and age > 90 days (DaysOutstanding).  
Results are sorted by OutstandingBalance to prioritize the largest risks.

**Insight:**  
Older outstanding balances represent higher collection risk. A concentration of large balances in the 90+ bucket can indicate weak credit control and potential future write-offs.


