/*Q1:- Show the total cost for each order.*/
SELECT orderDetails.order_id, SUM(orderDetails.quantity * products.price) AS total_cost
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
GROUP BY orderDetails.order_id
ORDER BY total_cost DESC;

/*Q2:- Show the customer name for the orders.*/
SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id;

/*Q3:- Show the total amount spent by each customer.*/
SELECT customers.name, SUM(orderDetails.quantity * products.price) AS total_amount_spent
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name;

/*Q4:- Show how many customers per country.*/
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;

/*Q5:- Show the total sales by country.*/
SELECT customers.country, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.country
ORDER BY total_sales DESC;

/*Q6:- Show the total sales by employee.*/
SELECT employees.first_name, employees.last_name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
JOIN employees ON orders.employee_id = employees.employee_id
GROUP BY employees.first_name, employees.last_name
ORDER BY total_sales DESC;

/*Q7:- Show how many products were sold for each product.*/
SELECT products.name, SUM(CONVERT(INT, orderDetails.quantity)) AS total_sold
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
GROUP BY products.name;

/*Q8:- Show the total sales by product.*/
SELECT products.name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
GROUP BY products.name;

/*Q9:- Show how many products were sold for each category.*/
SELECT categories.name AS category_name, SUM(CONVERT(INT,orderDetails.quantity)) AS total_quantity_sold
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
JOIN categories ON products.category_id = categories.id
GROUP BY categories.name;

/*Q10:- Show the total sales by category.*/
SELECT categories.name AS category_name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
JOIN categories ON products.category_id = categories.id
GROUP BY categories.name;

/*Q11:- Show the average order value for each customer.*/
SELECT customers.name, AVG(total.total_order) AS average_order
FROM (
    SELECT orders.customer_id, SUM(orderDetails.quantity * products.price) AS total_order
    FROM orders
    JOIN orderDetails ON orders.id = orderDetails.order_id
    JOIN products ON orderDetails.product_id = products.id
    GROUP BY orders.customer_id, orders.id
) AS total
JOIN customers ON total.customer_id = customers.id
GROUP BY customers.name;

/*Q12:- Show the average order value for each country.*/
SELECT customers.country, AVG(total.total_order) AS average_order
FROM (
    SELECT orders.customer_id, SUM(orderDetails.quantity * products.price) AS total_order
    FROM orders
    JOIN orderDetails ON orders.id = orderDetails.order_id
    JOIN products ON orderDetails.product_id = products.id
    GROUP BY orders.customer_id, orders.id
) AS total
JOIN customers ON total.customer_id = customers.id
GROUP BY customers.country;

/*Q13:- Show the average order value for each employee.*/
SELECT employees.first_name, employees.last_name, AVG(total.total_order) AS average_order
FROM (
    SELECT orders.employee_id, SUM(orderDetails.quantity * products.price) AS total_order
    FROM orders
    JOIN orderDetails ON orders.id = orderDetails.order_id
    JOIN products ON orderDetails.product_id = products.id
    GROUP BY orders.employee_id, orders.id
) AS total
JOIN employees ON total.employee_id = employees.employee_id
GROUP BY employees.first_name, employees.last_name;

/*Q14:- Show the product with the highest total sales.*/
SELECT TOP 1 products.name AS product_name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orderDetails
JOIN products ON orderDetails.product_id = products.id
GROUP BY products.name
ORDER BY total_sales DESC;

/*Q15:- Show the employee with the highest total sales.*/
SELECT employees.first_name, employees.last_name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
JOIN employees ON orders.employee_id = employees.employee_id
GROUP BY employees.first_name, employees.last_name
ORDER BY total_sales DESC;

/*Q16:- Show the customer with the highest total sales.*/
SELECT customers.name, SUM(orderDetails.quantity * products.price) AS total_sales
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name
ORDER BY total_sales DESC;

/*Q17:- Show the month with the highest total sales.*/
SELECT FORMAT(orders.date, 'yyyy-MM') AS month, 
       SUM(orderDetails.quantity * products.price) AS total_sales
FROM orders
JOIN orderDetails ON orders.id = orderDetails.order_id
JOIN products ON orderDetails.product_id = products.id
GROUP BY FORMAT(orders.date, 'yyyy-MM')
ORDER BY total_sales DESC;

/*Q18:- Show the total number of orders per month.*/
SELECT FORMAT(orders.date, 'yyyy-MM') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY FORMAT(orders.date, 'yyyy-MM');

/*Q19:- Show the total number of orders handled by each employee.*/
SELECT employees.first_name, employees.last_name, COUNT(*) AS total_orders
FROM orders
JOIN employees ON orders.employee_id = employees.employee_id
GROUP BY employees.first_name, employees.last_name;

/*Q20:- Show the average number of products per order.*/
SELECT AVG(product_count) AS average_products_per_order
FROM (
    SELECT order_id, COUNT(*) AS product_count
    FROM orderDetails
    GROUP BY order_id
) AS order_product_counts;








