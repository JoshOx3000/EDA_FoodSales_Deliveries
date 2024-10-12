

SELECT * 
FROM food_sales.food_orders_new_delhi;

SELECT * 
FROM food_sales.food_orders_new_delhi
LIMIT 10;

# Data Cleaning

#some columns have space, so I will reformat - creating standardize naming for field using _

# reformat order_id field
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Order ID` to  `Order_ID`
;


#reformat Customer ID
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Customer ID` to  `Customer_ID`
;

#reformat Customer ID
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Customer ID` to  `Customer_ID`
;

#reformat Restaurant ID field

ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Restaurant ID` to  `Restaurant_ID`
;

#reformat Order Date And Time field 
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Order Date and Time` to  `Order_Date_Time`
;

#reformat Order Date And Time field 
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Delivery Date and Time` to  `Delivery_Date_Time`
;


#reformat Order Date And Time field 
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Order Value` to  `Order_Value`
;

#reformat Delivery Fee to  Delivery_Fee
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Delivery Fee` to  `Delivery_Fee`
;


#reformat Payment Method  to  Payment_Method
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Payment Method` to  `Payment_Method`
;

#reformat Discounts and Offers to Discounts_and_Offers
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Discounts and Offers` to  `Discounts_and_Offers`
;


#reformat Commission Fee to Commission_Fee
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Commission Fee` to  `Commission_Fee`
;

#reformat Payment Processing_Fee to Payment_Processing_Fee
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Payment Processing Fee` to  `Payment_Processing_Fee`
;

#reformat Refunds/Chargebacks to Refunds_Chargebacks
ALTER TABLE food_sales.food_orders_new_delhi
RENAME COLUMN `Refunds/Chargebacks` to  `Refunds_Chargebacks`
;


# Data cleaning - look for duplicate data

SELECT order_id, COUNT(Order_id)
FROM food_sales.food_orders_new_delhi
GROUP BY order_id
HAVING COUNT(order_id) > 1
;

#output no duplicates

#Analysis Portion
# first, calculate the total sales, average order value and delivery fees for each restaurant

SELECT 
	Restaurant_ID,
	COUNT(order_id) AS total_orders,
    SUM(order_value) AS total_sales,
    ROUND(AVG(order_value), 2) AS avg_order_value,
    SUM(delivery_fee) AS total_delivery_fees
FROM food_sales.food_orders_new_delhi
GROUP BY Restaurant_ID
;

# Find the top 5 restaurant by total sales
SELECT 
	Restaurant_ID,
    SUM(order_value) AS total_sales
FROM food_sales.food_orders_new_delhi
GROUP BY  Restaurant_ID
ORDER BY total_sales DESC
LIMIT 5
;

# output - R2726, R2083, R2933, R2329, R2355



# Look at Monthly Sales Trends

SELECT 
	EXTRACT(YEAR FROM order_date_time) AS year,
    EXTRACT(MONTH FROM order_date_time) AS month,
    SUM(order_value) AS total_sales
FROM food_sales.food_orders_new_delhi
GROUP BY year, month
ORDER BY year, month
;


# Determine how many orders used discount or offers and the total amount of discounts applied.
SELECT 
	COUNT(order_id) AS discount_orders,
    SUM(discounts_and_offers) AS total_discount
FROM food_sales.food_orders_new_delhi
WHERE discounts_and_offers > 0
;

# output discount_order: 815  total_discount: 16,265

#Calculate the net profit for each restaurant

SELECT 
	Restaurant_ID,
	SUM(Order_Value) AS gross_sales,
    SUM(Commission_Fee + Payment_Processing_Fee + Refunds_Chargebacks) AS total_fees,
    (SUM(Order_Value) - SUM(Commission_Fee + Payment_Processing_Fee + Refunds_Chargebacks)) AS net_profit
FROM food_sales.food_orders_new_delhi
GROUP BY Restaurant_ID;

# take a look at Payment Method usage, analyze how often different payment methods are used and their total order value 
SELECT 
	Payment_Method,
    COUNT(Order_ID) AS num_orders,
    SUM(Order_Value) AS total_order_value
FROM food_sales.food_orders_new_delhi
GROUP BY Payment_Method;

#output most payment were Credit card, 2nd Digital Wallet, 3rd Cash on Delivery

# look into the customer
# Find the top 5 customers who spent the most on orders
SELECT  
	Customer_ID,
    SUM(Order_Value) AS total_spent
FROM food_sales.food_orders_new_delhi
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 5
;

#output customer_id C7949, C3832, C8266, C5555, C5146

# take look at the Refunds and Chargebacks
# analyze the percentage of total sales that have been refunded or resulted in chargebacks

SELECT 
	SUM(Order_Value) AS total_order_value,
    SUM(Refunds_Chargebacks) AS total_refunds,
    (SUM(Refunds_Chargebacks) / SUM(Order_Value))*100 AS refund_percent 
FROM food_sales.food_orders_new_delhi
;

# refund percent is %2.6851 if I round roughly %3 of orders are refund

