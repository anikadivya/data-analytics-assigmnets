-- Week 3 Assessment: SQL Foundations
-- Dataset: flipcart.products

-- SECTION A — THEORY
-- A1. b
-- A2. b
-- A3. b
-- A4. c
-- A5. b
-- A6. c
-- A7. b
-- A8. c

-- SECTION B — OUTPUT PREDICTION
-- B1. 1 row, value 8
-- B2. 11 rows
-- B3. 1 row -> The Silent Patient
-- B4. 3 rows -> OnePlus Nord Buds 2, Fabindia Cotton Kurti, IKEA Study Table
-- B5. 1 row, value 499.00
-- B6. 3 rows -> Apparel 6, Electronics 7, Home 5
-- B7. 4 rows -> Nykaa=Mid, Lakme=Budget, Mamaearth=Budget, WOW=Mid
-- B8. 2 rows -> JBL Flip 6 Speaker 4.30, WOW Skin Vitamin C Serum 4.50

-- SECTION C — APPLIED SQL

-- C1
SELECT * FROM products;

-- C2
SELECT product_name, price FROM products WHERE category = 'Books';

-- C3
SELECT * FROM products WHERE price > 10000 ORDER BY price DESC;

-- C4
SELECT product_name, price FROM products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 5;

-- C5
SELECT * FROM products WHERE category IN ('Electronics', 'Apparel');

-- C6
SELECT * FROM products WHERE price BETWEEN 500 AND 2000;

-- C7
SELECT * FROM products WHERE product_name LIKE '%Watch%';

-- C8
SELECT * FROM products WHERE brand LIKE 'S%';

-- C9
SELECT DISTINCT category FROM products;

-- C10
SELECT COUNT(*) AS total_products FROM products;

-- C11
SELECT AVG(price) AS avg_book_price FROM products WHERE category = 'Books';

-- C12
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM products;

-- C13
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- C14
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- C15
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- C16 (no brand has more than 1 product, so this returns 0 rows)
SELECT brand, COUNT(*) AS product_count, AVG(price) AS avg_price
FROM products
GROUP BY brand
HAVING COUNT(*) > 1;

-- C17
SELECT category, COUNT(*) AS active_count
FROM products
WHERE is_active = TRUE
GROUP BY category
HAVING COUNT(*) > 4;

-- C18
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 3;

-- C19
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 2000;

-- C20
SELECT * FROM products WHERE avg_rating IS NULL;

-- C21
SELECT product_name, COALESCE(CAST(avg_rating AS CHAR), 'New Launch') AS rating
FROM products;

-- C22
SELECT product_name, price,
  CASE
    WHEN price < 1000 THEN 'Budget'
    WHEN price < 10000 THEN 'Mid'
    ELSE 'Premium'
  END AS price_tier
FROM products;

-- C23
SELECT category,
  COUNT(*) AS total_count,
  SUM(CASE WHEN price >= 10000 THEN 1 ELSE 0 END) AS premium_count
FROM products
GROUP BY category;

-- C24
SELECT category,
  COUNT(*) AS total_count,
  SUM(CASE WHEN is_active = TRUE THEN 1 ELSE 0 END) AS active_count,
  AVG(price) AS avg_price,
  CASE
    WHEN AVG(price) < 1500 THEN 'Cheap'
    WHEN AVG(price) < 10000 THEN 'Standard'
    ELSE 'Luxury'
  END AS category_tier
FROM products
GROUP BY category
HAVING COUNT(*) >= 3
ORDER BY avg_price DESC;
