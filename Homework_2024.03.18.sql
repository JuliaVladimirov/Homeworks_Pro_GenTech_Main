
use homework;

-- Таблица - customers
-- Вывести максимальный и минимальный credit_limit.

select max(CREDIT_LIMIT) as max_credit_limit,
min(CREDIT_LIMIT) as min_credit_limit
from customers;

-- Вывести покупателей у которых creditlimit выше среднего creditlimit.

select CUST_FIRST_NAME,
CUST_LAST_NAME
from customers
where CREDIT_LIMIT > (select avg (CREDIT_LIMIT) from customers);


-- Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
-- по имени
select count(*) as number_of_customers
from customers
where CUST_FIRST_NAME like 'D%' and CREDIT_LIMIT > 500;

-- по фамилии
select count(*) as number_of_customers
from customers
where CUST_LAST_NAME like 'D%' and CREDIT_LIMIT > 500;


-- Таблица - order_items
-- Найти среднее значение unit_price

select avg(unit_price) as unit_average_price
from order_items;


-- Таблицы - order_items, product_information
-- Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

select t1. PRODUCT_NAME
from product_information t1
inner join order_items t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where QUANTITY < (select avg(QUANTITY) from order_items);

-- Таблицы - orders, customers
-- Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).

select t1.CUST_FIRST_NAME,
t1.CUST_LAST_NAME
from customers t1
inner join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t2.ORDER_TOTAL = (select max(ORDER_TOTAL) from orders);


-- Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.

select sum(t1.ORDER_TOTAL) as total_sum
from orders t1
inner join customers t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t2.MARITAL_STATUS like 'married';
