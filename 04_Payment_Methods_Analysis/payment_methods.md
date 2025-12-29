Query 1: Payment Method Usage Distribution

File: 01_payment_method_distribution.sql

Purpose

Identify the most frequently used payment methods and understand how customers typically pay.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

Customer transactions are joined with the payment methods table using PaymentMethodID.
Transactions are grouped by payment method, and the number of transactions per method is counted to determine usage frequency.

Insight

The results show that customer payments are concentrated among a limited number of payment methods. This indicates standardized payment behavior and suggests that customers prefer a small set of familiar payment options. Such concentration simplifies payment processing and reconciliation but may reduce flexibility for customers who prefer alternative methods.

Query 2: Payment Method Share by Transaction Value

File: 02_payment_method_value_share.sql

Purpose

Analyze the contribution of each payment method to total transaction value, not just transaction count.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

Transaction amounts are aggregated by payment method to calculate the total monetary value processed through each method. Only transactions with non-null payment methods are included.

Insight

While some payment methods may appear frequently in terms of transaction count, others account for a larger share of total transaction value. This indicates that certain payment methods are preferred for higher-value transactions, which can influence transaction fees, fraud risk, and settlement timing.

Query 3: Average Transaction Amount by Payment Method

File: 03_avg_transaction_by_method.sql

Purpose

Compare average transaction sizes across different payment methods.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

For each payment method, the average transaction amount is calculated using AVG(TransactionAmount) on customer transactions linked to a valid payment method.

Insight

Differences in average transaction amounts suggest that customers use different payment methods for different purchasing behaviors. Higher average amounts may be associated with more trusted or credit-based payment methods, while lower averages may reflect quick or low-risk payment options.

Query 4: Payment Method Coverage

File: 04_payment_method_coverage.sql

Purpose

Evaluate how many customer transactions are associated with an explicitly recorded payment method.

Tables Used

Sales.CustomerTransactions

Logic

Transactions are divided into two groups: those with a recorded PaymentMethodID and those without. The number of transactions in each group is counted.

Insight

A significant number of transactions without an associated payment method may indicate incomplete data capture or alternative settlement processes. High coverage, on the other hand, reflects strong data quality and reliable payment tracking.

Summary

The payment methods analysis shows that customer payments are largely concentrated among a small number of preferred payment methods. While some methods dominate in transaction count, others contribute more significantly to total transaction value, indicating differences in customer behavior based on payment type.

Variations in average transaction amounts further suggest that customers select payment methods strategically depending on purchase size and perceived risk. Overall, the results highlight the importance of focusing operational and security efforts on the most impactful payment methods while ensuring accurate and consistent payment method recording across all transactions.Query 1: Payment Method Usage Distribution

File: 01_payment_method_distribution.sql

Purpose

Identify the most frequently used payment methods and understand how customers typically pay.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

Customer transactions are joined with the payment methods table using PaymentMethodID.
Transactions are grouped by payment method, and the number of transactions per method is counted to determine usage frequency.

Insight

The results show that customer payments are concentrated among a limited number of payment methods. This indicates standardized payment behavior and suggests that customers prefer a small set of familiar payment options. Such concentration simplifies payment processing and reconciliation but may reduce flexibility for customers who prefer alternative methods.

Query 2: Payment Method Share by Transaction Value

File: 02_payment_method_value_share.sql

Purpose

Analyze the contribution of each payment method to total transaction value, not just transaction count.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

Transaction amounts are aggregated by payment method to calculate the total monetary value processed through each method. Only transactions with non-null payment methods are included.

Insight

While some payment methods may appear frequently in terms of transaction count, others account for a larger share of total transaction value. This indicates that certain payment methods are preferred for higher-value transactions, which can influence transaction fees, fraud risk, and settlement timing.

Query 3: Average Transaction Amount by Payment Method

File: 03_avg_transaction_by_method.sql

Purpose

Compare average transaction sizes across different payment methods.

Tables Used

Sales.CustomerTransactions

Application.PaymentMethods

Logic

For each payment method, the average transaction amount is calculated using AVG(TransactionAmount) on customer transactions linked to a valid payment method.

Insight

Differences in average transaction amounts suggest that customers use different payment methods for different purchasing behaviors. Higher average amounts may be associated with more trusted or credit-based payment methods, while lower averages may reflect quick or low-risk payment options.

Query 4: Payment Method Coverage

File: 04_payment_method_coverage.sql

Purpose

Evaluate how many customer transactions are associated with an explicitly recorded payment method.

Tables Used

Sales.CustomerTransactions

Logic

Transactions are divided into two groups: those with a recorded PaymentMethodID and those without. The number of transactions in each group is counted.

Insight

A significant number of transactions without an associated payment method may indicate incomplete data capture or alternative settlement processes. High coverage, on the other hand, reflects strong data quality and reliable payment tracking.

Summary

The payment methods analysis shows that customer payments are largely concentrated among a small number of preferred payment methods. While some methods dominate in transaction count, others contribute more significantly to total transaction value, indicating differences in customer behavior based on payment type.

Variations in average transaction amounts further suggest that customers select payment methods strategically depending on purchase size and perceived risk. Overall, the results highlight the importance of focusing operational and security efforts on the most impactful payment methods while ensuring accurate and consistent payment method recording across all transactions.