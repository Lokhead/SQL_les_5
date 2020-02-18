/*
����� � ������� users ���� created_at � updated_at ��������� ��������������. 
��������� �� �������� ����� � ��������.
*/


drop table if exists users;
create table users (
	id SERIAL primary key,
	f_name VARCHAR(50),
	l_name VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME
	);

INSERT into users (f_name, l_name, created_at, updated_at)
values
	('�����', '������', null, null),
	('������', '������', null, null),
	('�������', '������', null, null);
	
update users set created_at = NOW(), updated_at = NOW()