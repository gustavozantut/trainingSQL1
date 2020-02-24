-- drop database uam;

CREATE DATABASE uam;

USE uam;

CREATE TABLE `orders`
(
  `id` int PRIMARY KEY,
  `user_id` int NOT NULL,
  `status` ENUM ('created', 'running', 'done', 'failure'),
  `created_at` varchar(255) COMMENT 'When order created'
);
usersusers
CREATE TABLE `order_items`
(
  `id` int PRIMARY KEY,
  `order_id` int,
  `item_num` int,
  `product_id` int,
  `quantity` int DEFAULT 1,
  `unit_price` int
);

CREATE TABLE `products`
(
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `merchant_id` int NOT NULL,
  `price` int,
  `status` varchar(255),
  `created_at` datetime DEFAULT now()
);

CREATE TABLE `users`
(
  `id` int PRIMARY KEY,
  `full_name` varchar(255),
  `email` varchar(255) UNIQUE,
  `gender` varchar(255),
  `date_of_birth` varchar(255),
  `created_at` varchar(255),
  `country_code` varchar(255)
);

CREATE TABLE `merchants`
(
  `id` int PRIMARY KEY,
  `merchant_name` varchar(255),
  `country_code` varchar(255),
  `created_at` varchar(255),
  `admin_id` int
);

CREATE TABLE `countries`
(
  `code` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `continent_name` varchar(255)
);

ALTER TABLE `order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`);

ALTER TABLE `merchants` ADD FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`);

ALTER TABLE `products` ADD FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`);

ALTER TABLE `merchants` ADD FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);


CREATE  INDEX `product_status`
ON `products` (`merchant_id`,`status`);

CREATE UNIQUE INDEX `products_index_1`
ON `products` (`id`);


INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'BR',
  'Brasil',
  'America do Sul');
INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'PY',
  'Paraguai',
  'America do Sul');
INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'US',
  'Estados Unidos da America',
  'America do Norte');
INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'EN',
  'Inglaterra',
  'Europa');
INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'CH',
  'China',
  'Asia');

INSERT INTO countries (
  code,
  name,
  continent_name )
VALUES (
  'AR',
  'Argentina',
  'America do Sul');


INSERT INTO users (
  id,
  full_name,
  email,
  gender,
  date_of_birth,
  created_at,
  country_code)
VALUES (
  1,
  'Adriano Bonacin',
  'abonacin@gmail.com',
  'M',
  '1983-07-29',
  '2019-01-07',
  'BR');
INSERT INTO users (
  id,
  full_name,
  email,
  gender,
  date_of_birth,
  created_at,
  country_code)
VALUES (
  2,
  'Scott Adams',
  'scott@email.com',
  'M',
  '1987-04-09',
  '2019-02-07',
  'EN');
INSERT INTO users (
  id,
  full_name,
  email,
  gender,
  date_of_birth,
  created_at,
  country_code)
VALUES (
  3,
  'King Manus',
  'king.manus@email.com',
  'M',
  '1955-01-25',
  '2018-01-08',
  'US');
INSERT INTO users (
  id,
  full_name,
  email,
  gender,
  date_of_birth,
  created_at,
  country_code)
VALUES (
  4,
  'Raul Seixas',
  'maluco@beleza.com',
  'M',
  '1982-12-29',
  '2018-02-27',
  'BR');


INSERT INTO merchants (
  id,
  merchant_name,
  country_code,
  created_at,
  admin_id)
VALUES (
  1,
  'Seu Ze',
  'BR',
  '2015-03-20',
  2);

INSERT INTO merchants (
  id,
  merchant_name,
  country_code,
  created_at,
  admin_id)
VALUES (
  2,
  'Xing Ling',
  'CH',
  '2017-02-10',
  3);

INSERT INTO merchants (
  id,
  merchant_name,
  country_code,
  created_at,
  admin_id)
VALUES (
  3,
  'Cam Elo',
  'PY',
  '2018-04-04',
  1);

INSERT INTO merchants (
  id,
  merchant_name,
  country_code,
  created_at,
  admin_id)
VALUES (
  4,
  'Tio Sam',
  'US',
  '2018-03-07',
  4);

INSERT INTO merchants (
  id,
  merchant_name,
  country_code,
  created_at,
  admin_id)
VALUES (
  5,
  'Rainha da Sucata',
  'EN',
  '2015-03-22',
  2);


INSERT INTO products
( id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES
( 1,
  'Mosca na sopa',
  1,
  10,
  'DISP',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES (
  2,
  'Maluco Beleza',
  1,
  5,
  'DISPONIVEL',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES  (
  3,
  'Tente Outra Vez',
  1,
  8,
  'Em_Falta',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES (
  4,
  'Descascador de Frutas Portatil',
  2,
  25,
  'DISPONIVEL',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES  (
  5,
  'Matador de Mosquito Autonomo',
  2,
  50,
  'DISPONIVEL',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES  (
  6,
  'Hiphone XI',
  2,
  500,
  'DISPONIVEL',
  '2019-08-07');
INSERT INTO products (
  id,
  name,
  merchant_id,
  price,
  status,
  created_at)
VALUES (
  7,
  'iPhone X',
  4,
  5000,
  'DISPONIVEL',
  '2019-08-07');


INSERT INTO orders (
  id,
  user_id,
  status,
  created_at)
VALUES (
  1,
  1,
  'created',
  '2019-08-07');

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  1,
  1,
  1,
  3,
  2,
  4);

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  2,
  1,
  2,
  4,
  1,
  18);

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  3,
  1,
  3,
  6,
  1,
  450);

INSERT INTO orders (
  id,
  user_id,
  status,
  created_at)
VALUES (
  2,
  3,
  'done',
  '2019-08-07');


INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  4,
  2,
  1,
  7,
  1,
  3950);

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  5,
  2,
  2,
  3,
  1,
  30);


INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  6,
  2,
  3,
  1,
  1,
  12);


INSERT INTO orders (
  id,
  user_id,
  status,
  created_at)
VALUES (
  3,
  2,
  'running',
  '2019-08-09');

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  7,
  3,
  1,
  1,
  1,
  12);

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  8,
  3,
  2,
  4,
  3,
  45);


INSERT INTO orders (
  id,
  user_id,
  status,
  created_at)
VALUES (
  4,
  1,
  'created',
  '2019-08-10');

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  9,
  4,
  1,
  1,
  1,
  12);

INSERT INTO order_items (
  id,
  order_id,
  item_num,
  product_id,
  quantity,
  unit_price)
VALUES (
  10,
  4,
  2,
  7,
  1,
  4005);



select * from countries;
select * from users;
select * from merchants;
select * from products;
select * from orders;
select * from order_items;
select COUNT(*) from order_items WHERE ORDER_ID =1;
SELECT ID AS Codigo, upper(name) Descricao from products limit 2;

