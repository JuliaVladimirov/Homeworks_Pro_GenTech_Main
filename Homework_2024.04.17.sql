

-- Из базы данных shop:
-- https://github.com/NelliEfr/MySQL_databases/blob/main/shop.txt

use shop;

-- Найти общую сумму заказов для каждого клиента.

select t1.CNAME, sum(t2.AMT) as total_AMT
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
group by t1.CNAME;


-- Получить количество заказов для каждого продавца.

select t1.SNAME, count(t2.ORDER_ID) as orders_amount
from sellers t1
inner join orders t2
on t1.SELL_ID = t2.SELL_ID
group by t1.SNAME;


-- Получить количество клиентов с рейтингом выше среднего.

select count(*), RATING
from customers
group by RATING
having RATING > (select avg(RATING) from customers);


-- Получить количество клиентов в каждом городе с рейтингом выше 200.

select CITY, count(*) as customers_amount
from customers
where RATING > 200
group by CITY;


-- Получить количество заказов, сделанных в каждый месяц.

select ODATE, count(*) as order_amount
from orders
group by ODATE;


-- Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.

select t1.CNAME, sum(t2.AMT) as total_AMT
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
group by t1.CNAME
having sum(t2.AMT) > (select avg(AMT) from orders);






