use hr;



-- 1. Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также категорию зарплаты на основе следующих условий:
-- Если зарплата меньше 5000, категория "Низкая".
-- Если зарплата от 5000 до 10000, категория "Средняя".
-- Если зарплата больше 10000, категория "Высокая".

select employee_id,
	first_name,
	last_name,
    case
		when salary < 5000 then 'Низкая'
		when salary < 10000 then 'Средняя'
        else 'Высокая'
	end as salary
    from employees;
    
    
-- Определение размера премии сотрудникам:
-- Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также размер премии на основе следующих условий:

-- Если зарплата меньше 5000, премия составляет 10% от зарплаты.
-- Если зарплата от 5000 до 10000, премия составляет 15% от зарплаты.
-- Если зарплата больше 10000, премия составляет 20% от зарплаты.

select employee_id,
	first_name,
	last_name,
    case
		when salary < 5000 then salary * 10 / 100
		when salary < 10000 then salary * 15 / 100
        else salary * 20 / 100
	end as bonus
    from employees;


-- Получить список стран с указанием их региона и обозначением страны "EU" для стран Европейского союза, "Non-EU" для остальных стран.

select t1. country_name,
case
	when t2.region_name like 'Europe' then 'EU'
	else 'Non-Eu'
end as region_name
from countries t1
 inner join regions t2
 on t1.region_id = t2.region_id;
 

-- Получить список стран с указанием количества символов в их названиях.

select country_name, length(country_name) as symbols
from countries;


-- Получить список стран и их первые три символа в названии

select country_name, left(country_name, 3) as symbols
from countries;

-- Получить список сотрудников с заменой их email на "Confidential", если он содержит слово "sqltutorial"

select first_name, last_name,
case
	when email like upper('%qltutorial%') then 'Confidential'
    else email
end as email
from employees;

-- Получить список сотрудников и указать их email в нижнем регистре.

select first_name, last_name, lower(email)
from employees;


-- Получить список сотрудников(firstname, lastname) с указанием их должности(job_title).

select t1.first_name, t1.last_name, t2.job_title
from employees t1
join jobs t2
on t1.job_id = t2.job_id;


-- Получить список отделов(department_name) и их названий с указанием местоположения(city).

select t1.department_id,  t1.department_name, t2.city
from departments t1
join locations t2
on t1.location_id = t2.location_id;


-- Получить список отделов(departmentname) и их менеджеров(firstname, last_name).

select t1.department_name, t2.first_name, t2.last_name
from departments t1
join employees t2
on t1.manager_id = t2.manager_id;


-- Получить список сотрудников(firstname, lastname) с указанием их департамента(department_name), отсортированный по департаменту.

select t1.first_name, t1.last_name, t2.department_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
order by t2.department_name asc;


-- Получить список сотрудников(firstname, lastname)  и их менеджеров(firstname, lastname)

select t1.first_name, t1.last_name, t2.first_name, t2.last_name
from employees t1
join employees t2
on t2.manager_id = t1.manager_id;


-- Получить список стран, где местоположение находится в США.
-- (наверное тут опечатка, страна не может находится в США, могут города, или имеется ввиду страны, которые находятся в регионе Americas. Ниже приведены оба варианта)

-- Вариант города в США
select t1.city
from locations t1
join countries t2
on t1.country_id = t2.country_id
where country_name like 'United States of America';

-- Вариант страны, которые находятся в регионе Americas
select t1.country_name
from countries t1
join regions t2
on t1.region_id = t2.region_id
where region_name like 'Americas';


