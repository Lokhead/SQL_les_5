/*
Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них 
долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/

drop table if exists users;
create table users (
	id SERIAL primary key,
	f_name VARCHAR(50),
	l_name VARCHAR(50),
	created_at VARCHAR(50),
	updated_at VARCHAR(50)
	);
	
INSERT into users (f_name, l_name, created_at, updated_at)
values
	('Игорь', 'Петров', '12.07.2017 15:10', '25.11.2018 19:15'),
	('Сергей', 'Иванов', '22.10.2017 12:08', '13.04.2018 18:17'),
	('Василий', 'Дьяков', '12.11.2017 19:11', '19.12.2017 17:02');
	
select STR_TO_DATE(created_at, '%d.%m.%Y %k:%i') from users; -- Здесь дата отображается корректно

update users set 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),  -- Здесь DBeaver выдает ошибку Неверный формат STR_TO_DATE
	updated_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i');  

alter table users
change created_at created_at DATETIME default current_timestamp;

alter table users
change updated_at updated_at DATETIME default current_timestamp;