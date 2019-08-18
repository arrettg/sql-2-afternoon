Joins

-- 1 SELECT * FROM invoice i
-- JOIN invoice_line il ON il.invoice_id = i.invoice_id
-- WHERE il.unit_price > 0.99

-- 2 SELECT i.invoice_date, c.first_name, c.last_name, i.total FROM invoice i
-- JOIN customer c ON c.customer_id = i.customer_id

-- 3 SELECT c.first_name, c.last_name, e.first_name,e.last_name
-- FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id

-- 4 SELECT al.title, ar.name
-- FROM album al 
-- JOIN artist ar ON al.artist_id = ar.artist_id

-- 5 SELECT pt.track_id FROM playlist_track pt
-- JOIN playlist pl ON pl.playlist_id = pt.playlist_id
-- WHERE pl.name = 'Music'

--  6 SELECT t.name 
-- FROM track t 
-- JOIN playlist_track pt ON pt.track_id = t.track_id
-- WHERE pt.playlist_id = 5

-- 7 SELECT t.name, p.name
-- FROM track t
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id

-- 8 SELECT t.name, al.title
-- FROM track t
-- JOIN album al ON t.album_id = al.album_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Alternative & Punk'

-- NEsted

-- 1 SELECT *
-- FROM invoice i
-- WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99)

-- 2 SELECT * FROM playlist_track pt
-- WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music')

-- 3 SELECT name FROM track
-- WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5)

--  4 SELECT * FROM track
-- WHERE genre_id  in (SELECT genre_id FROM genre WHERE name ='Comedy')

-- 5 SELECT  * FROM track
-- WHERE album_id IN (SELECT album_id FROM album WHERE title ='Fireball')

-- 6 SELECT * FROM track
-- WHERE album_id IN(
--   SELECT album_id FROM album WHERE artist_id IN(
--     SELECT artist_id FROM artist WHERE name = 'Queen'
--     )
--   )

-- Updating Rows

-- 1 UPDATE customer
-- SET fax= null
-- WHERE fax IS NOT null

-- 2 UPDATE customer
-- SET company = 'self'
-- WHERE company IS null

-- 3 UPDATE customer
-- SET last_name = 'Thompson'
-- WHERE first_name ='Julia' AND last_name = 'Barnett'

-- 4 UPDATE customer
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl'

-- 5 UPDATE track
-- SET composer = 'The darkness around us'
-- WHERE composer is null

--Group By

-- 1. SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- Group BY g.name

-- 2 SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON g.genre_id = t. genre_id
-- Where g.anem = 'Pop' OR g.name = 'Rock'
-- Group BY g.name

-- 3 SELECT ar.name, COUNT(*)
-- FROM album al
-- JOIN artist ar ON ar.artist_id = al.artist_id
-- GROUP BY ar.name;

-- USE Distinct

-- SELECT DISTINCT composer
-- FROM track;

-- SELECT DISTINCT billing_postal_code
-- FROM invoice;

-- SELECT DISTINCT company
-- FROM customer;

--Delet

-- 1 CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

-- 2 DELETE FROM practice_delete
-- WHERE type= 'bronze'

-- 3 DELETE FROM practice_delete
-- WHERE type = 'silver'

-- 4 DELETE FROM practice_delete
-- WHERE value = 150

--eCommerce Sim

-- CREATE TABLE users (user_id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(90));
-- INSERT INTO users (name, email) VALUES ('bob', 'bob@bob.bob');
-- INSERT INTO users (name, email) VALUES ('mary', 'mary@bob.bob');
-- INSERT INTO users (name, email) VAlUES ('ricky', 'ricky@bob.bob');

-- CREATE TABLE product (product_id SERIAL PRIMARY KEY, name VARCHAR(40), price INTEGER)
-- INSERT INTO product (name, price) VALUES ('shoe' , 70);
-- INSERT INTO product (name, price) VALUES ('hat', 25);
-- INSERT INTO product (name, price) VALUES ('shirt',33);

-- CREATE TABLE orders ( order_id INTEGER, product_id INTEGER REFERENCES product(product_id))
-- INSERT INTO orders (order_id, product_id) VALUES(1,2);
-- INSERT INTO orders (order_id, product_id) VALUES(2,1);
-- INSERT INTO orders (order_id, product_id) VALUES(3,3);

-- SELECT * FROM product p
-- JOIN orders o ON o.product_id = p.product_id
-- WHERE o.order_id = 1 

-- SELECT * FROM orders

-- SELECT SUM(price) FROM product p
-- JOIN orders o ON o.product_id = p.product_id
-- WHERE o.order_id = 1

-- ALTER TABLE orders
-- ADD COLUMN user_id INTEGER
-- REFERENCES users (user_id) 

-- UPDATE orders
-- SET user_id = 1
-- WHERE order_id = 1;
-- UPDATE orders
-- SET user_id = 2
-- WHERE order_id = 2;
-- UPDATE orders
-- SET user_id = 3
-- WHERE order_id = 3

-- select order_id
-- from
-- users
-- join orders on
-- (
-- users.user_id = orders.user_id)
-- where
-- users.user_id = 1;

-- select count(*), name
-- from
-- users
-- join orders on
-- (
-- users.user_id = orders.user_id)
-- group by
-- users.user_id;

-- select product.price, 
-- users.name from
-- users
-- join orders on
-- (
-- users.user_id = orders.user_id)
-- join product on
-- (orders.product_id = product.product_id);


