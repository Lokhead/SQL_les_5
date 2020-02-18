/*
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи 
таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/

drop table if exists storehouses_products;

create table storehouses_products(
	id SERIAL primary key,
	product  VARCHAR(50),
	value INT UNSIGNED);

INSERT into users (product, value)
values
	('Доски', 87),
	('Кирпичи', 17),
	('Бетонные блоки', 0),
	('Песок', 7),
	('Стекло 3х4', 0),
	('Стекло 2х4', 19);
	
SELECT * FROM storehouses_products ORDER BY value;

SELECT id, value, IF(value > 0, 0, 1) AS sort FROM  storehouses_products ORDER BY value;

SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;