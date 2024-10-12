# EDA_FoodSales_Deliveries
exploratory data analysis (EDA) on a dataset of food orders
Project Overview
This project performs an exploratory data analysis (EDA) on a dataset of food orders from restaurants in New Delhi. The analysis focuses on understanding sales trends, restaurant performance, payment method preferences, discounts and offers, and refunds or chargebacks.

The dataset contains the following columns:

Order_ID
Customer_ID
Restaurant_ID
Order_Date_Time
Order_Value
Delivery_Fee
Payment_Method
Discounts_and_Offers
Commission_Fee
Payment_Processing_Fee
Refunds_Chargebacks
Data Cleaning
The dataset required some data cleaning and column renaming for better readability and consistency:

Columns with spaces were renamed using underscores.
Checked for duplicates and confirmed no duplicate Order_IDs.
Renamed Columns:

Order ID → Order_ID
Customer ID → Customer_ID
Restaurant ID → Restaurant_ID
Order Date and Time → Order_Date_Time
Delivery Date and Time → Delivery_Date_Time
Order Value → Order_Value
Delivery Fee → Delivery_Fee
Payment Method → Payment_Method
Discounts and Offers → Discounts_and_Offers
Commission Fee → Commission_Fee
Payment Processing Fee → Payment_Processing_Fee
Refunds/Chargebacks → Refunds_Chargebacks
Analysis and Queries
Total Sales, Average Order Value, and Delivery Fees by Restaurant
This query calculates the total number of orders, total sales, average order value, and total delivery fees for each restaurant.
Key Insight: Restaurants differ in terms of total sales, with some restaurants performing much better than others.

Top 5 Restaurants by Total Sales
This query finds the top 5 restaurants in terms of total sales.
Key Insight: The top-performing restaurants are R2726, R2083, R2933, R2329, and R2355.

Monthly Sales Trends
The query extracts year and month from the order date to analyze monthly sales trends.
Key Insight: This helps identify seasonal trends in the food delivery market.

Discount and Offers Usage
This query determines how many orders used discounts or offers and the total value of those discounts.
Key Insight: 815 orders applied discounts, with a total discount amount of 16,265 units.

Net Profit Calculation
This query calculates the net profit for each restaurant after deducting commission fees, payment processing fees, and refunds/chargebacks from gross sales.
Key Insight: The query highlights the importance of fees in reducing net profit, offering insights into restaurant profitability.

Payment Method Usage
This query analyzes how often different payment methods are used and their associated total order values.
Key Insight: The most popular payment methods were credit cards, followed by digital wallets and cash on delivery.

Top 5 Customers by Total Spending
This query identifies the top 5 customers in terms of total order value.
Key Insight: The top customers are valuable to restaurants and might be targeted for loyalty programs.

Refunds and Chargebacks
This query calculates the percentage of total sales that were refunded or resulted in chargebacks.
Key Insight: Approximately 3% of orders involved refunds or chargebacks, which represents a notable portion of lost revenue.

Conclusion

Top Performers: The analysis identified top-performing restaurants and customers, providing insights into which restaurants are driving the most sales and which customers are the biggest spenders.

Discount Usage: Discounts are frequently used, contributing a substantial amount to customer savings, but these also reduce restaurant revenue.
Payment Method Insights: Most payments were made via credit cards, followed by digital wallets, showing the shift towards cashless transactions.

Refunds Impact: A small but significant percentage (around 3%) of total sales were refunded or resulted in chargebacks, which can impact overall profit margins.
This project highlights important patterns in food sales data and provides valuable insights for restaurant owners and food delivery platforms on how to optimize sales, payment options, and discounts.
