
-- 1. Создать таблицу employees;
-- employeeid целое число первичный ключ автоинкремент;
-- fname строка не null,
-- lastname строка не null,
-- email строка не null,
-- phone строка не null

-- 2. Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),
-- 3. Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer 
-- 4. Переименовать поле fname на first_name
-- 5. Удалить поле phone
-- 6. Добавить поле department строка не null 
-- 7. Заполнить таблицу (7 строк)

use gt171023;

create table employees(
	employeeid int primary key auto_increment, 
	fname varchar(128) not null,
	lastname varchar(128) not null,
	email varchar (128) not null,
    phone varchar(128) not null); 
    
    select* from employees;
    
    alter table employees
    add salary numeric(9, 2);
    
    alter table employees
    modify column salary int;
    
    alter table employees
    change fname first_name varchar(128) not null;
    
    alter table employees
    drop column phone;
    
    alter table employees
    add department varchar(128) not null;
    
    insert into employees(first_name, lastname, email, salary, department)
values ('Tom', 'Austin', 'tom.austin@gmail.com', 3000, 'Development'),
('Bill', 'Lorenz', 'bill.lorenz@gmail.com', 4000, 'Development'),
('Lily', 'May', 'lily.may@gmail.com', 2000, 'Bookkeeping'),
('Nancy', 'Greenberg', 'nancy.greenberg@gmail.com', 2500, 'Bookkeeping'),
('Daniel', 'Chen', 'daniel.chen@gmail.com', 3500, 'Development'),
('Joseph', 'Daniels', 'joseph.daniels@gmail.com', 6500, 'Management'),
('Luis', 'Marlow', 'luis.marlow@gmail.com', 4500, 'Development'),
('Steven', 'Russell', 'steven.russel@gmail.com', 6000, 'Management');
    
   select* from employees;  

 