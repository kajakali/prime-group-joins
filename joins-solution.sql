--Write the SQL query that answers the question, below that comment.
--Example question and answer

---- 0. Get all the users
--SELECT * FROM customers;


-- Tasks

-- Get all customers and their addresses.

SELECT "first_name", "last_name", "street", "city", "state", "zip" FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items (orders, quantity and product).

SELECT * FROM "orders" JOIN "line_items" ON "line_items"."order_id" = "orders"."id" JOIN "products" ON "products"."id" = "line_items"."product_id";

-- Which warehouses have cheetos?

SELECT "warehouse" FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id" 
WHERE "description" = 'cheetos';

delta

-- Which warehouses have diet pepsi?

SELECT "warehouse" FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id" 
WHERE "description" = 'diet pepsi';

alpha, delta, gamma

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
-- THIS ONE IS KIND OF WRONG, FIX IT LATER!
SELECT "first_name", COUNT("first_name") FROM "customers" JOIN "addresses" ON "addresses"."customer_id" = "customers"."id" JOIN "orders" ON "orders"."address_id" = "addresses"."id" GROUP BY "first_name";

-- How many customers do we have?

SELECT COUNT("customers") FROM "customers";

-- How many products do we carry?

SELECT COUNT("products") FROM "products";

-- What is the total available on-hand quantity of diet pepsi?

SELECT SUM("on_hand") FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'diet pepsi';


-- Stretch

-- How much was the total cost for each order?
-- How much has each customer spent in total?
-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).