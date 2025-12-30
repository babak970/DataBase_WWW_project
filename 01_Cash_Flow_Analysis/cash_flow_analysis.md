Cash Flow Analysis
Query 1: Customer Cash Transactions
File: 01_customer_cash_transactions.sql

Purpose:
Analyze cash-related transactions recorded for customers.

Tables Used:

Sales.CustomerTransactions
Logic:
The query retrieves transaction dates and transaction amounts for all customer-related financial transactions.

Insight:
(To be completed after full cash flow analysis)

Query 2: Supplier Cash Transactions
File: 02_supplier_cash_transactions.sql

Purpose:
Analyze cash-related transactions recorded for suppliers, representing cash outflows from the company.

Tables Used:

Purchasing.SupplierTransactions
Logic:
The query retrieves transaction dates and transaction amounts for all supplier-related financial transactions.

Insight:
(To be completed after combining with customer cash flow analysis)

Query 3: Transaction Sign Analysis
File: 03_cash_flow_sign_analysis.sql

Purpose:
Identify whether financial transactions are recorded as positive or negative values in order to correctly distinguish cash inflows and outflows.

Tables Used:

Sales.CustomerTransactions
Purchasing.SupplierTransactions
Logic:
Transactions are grouped based on the sign of TransactionAmount (positive or negative).
This allows separation of inflows and outflows before constructing the cash flow statement.

Insight:
The presence of both positive and negative values indicates that transaction direction must be interpreted carefully rather than assuming all records represent cash inflow or outflow.

Query 4: Monthly Cash Flow Statement
File: 04_monthly_cash_flow_statement.sql

Purpose:
Generate a month-by-month cash flow statement to track inflows, outflows, and net cash flow over time.

Tables Used:

Sales.CustomerTransactions
Purchasing.SupplierTransactions
Logic:
Transactions are grouped by month (MonthStart).
Positive TransactionAmount values are treated as inflows, and negative values are treated as outflows (converted to positive for reporting).
Customer and supplier monthly summaries are combined using a FULL OUTER JOIN to ensure all months are included.

Insight:
(To be completed after reviewing the trend: identify months with negative net cash flow and overall cash flow behavior.)

Query 5: Cash Flow Totals and Net Position
File: 05_cash_flow_totals.sql

Purpose:
Summarize total cash inflows, total cash outflows, and overall net cash flow for the company.

Tables Used:

Sales.CustomerTransactions
Purchasing.SupplierTransactions
Logic:
Positive TransactionAmount values are treated as cash inflows.
Negative TransactionAmount values are converted to positive values and treated as cash outflows.
Totals are aggregated to compute the company’s net cash position.

Insight:
This summary provides a high-level view of the company’s liquidity position and is suitable for KPI cards and executive reporting.