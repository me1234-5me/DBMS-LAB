 CREATE TABLE customer
 ( cust_id   INT PRIMARY KEY,
 cust_name VARCHAR(20) NOT NULL ); 
 desc Customer;
 desc sale;
 desc item;
 CREATE TABLE item 
 (
 item_id INT PRIMARY KEY,
 item_name VARCHAR(25),
 price INT);
 DROP TABLE SALE;
  CREATE TABLE sale
  (bill_no   INT PRIMARY KEY, 
  bill_date DATE NOT NULL,
  cust_id INT NOT NULL,
  item_id  INT NOT NULL,
   qty_sold  NUMERIC(6,3) NOT NULL,FOREIGN KEY(item_id)         
   REFERENCES item(item_id),
   FOREIGN KEY (cust_id) REFERENCES customer(cust_id));
  INSERT INTO customer VALUES
  (1,'Rekha'),
  (2,'Rani'),
  (3,'Rocky'),
  (4,'Xin'),
  (5,'Kim');
  INSERT INTO ITEM VALUES
  (1,'Rusk',120),
  (2,'Banana',50),
  (3,'Sanitizer',60),
  (4,'cake',420),
  (5,'Laddu',25);
  INSERT INTO sale values
  (10,'2021-6-11',1,1,3),
  (11,'2020-10-01',1,3,3),
  (12,'2020-10-01',1,5,7),
  (13,'2018-10-01',4,4,1),
  (14,'2018-10-11',4,2,2),
  (15,'2018-09-29',5,1,3),
  (16,'2019-12-25',3,1,3),
  (17,'1995-06-21',5,4,3),
  (18,'2020-04-01',4,5,3),
  (19,'2020-02-12',1,2,3);
  SELECT * FROM CUSTOMER;
  SELECT * FROM SALE;
  SELECT * FROM ITEM;
   SELECT * FROM customer,item,sale WHERE price> 200 AND sale.item_id = item.item_id AND sale.cust_id = customer.cust_id;
  SELECT distinct cust_name,prod_nums, bill_date FROM customer,(SELECT cust_id,COUNT(item_id) AS prod_nums,bill_date   
  FROM sale GROUP BY (bill_date) )ci  WHERE ci.cust_id = customer.cust_id;
  
SELECT cust_name,COUNT(item_id), bill_date FROM customer c, sale s WHERE c.cust_id = s.cust_id  GROUP BY cust_name,bill_date HAVING extract(YEAR FROM bill_date) = 2018;
 SELECT item_name FROM item,sale WHERE sale.item_id = item.item_id  AND sale.cust_id  = 5;
SELECT item_name, price,qty_sold FROM item ,sale, (SELECT CURDATE() AS Today FROM dual ) tod WHERE sale.item_id = item.item_id AND bill_date= today ;
select item_name,qty_sold,price,(qty_sold * price) AS total_amount FROM customer,item, sale WHERE cust_name= 'Rekha' AND sale.item_id = item.item_id 
  AND sale.cust_id = customer.cust_id;