
use homework;
-- ЗАДАЧИ:

-- 1. Вывести имя, фамилию пользователей и даты их заказов(order_date).

-- будут выведены только те покупатели, которые делали заказы.
select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t2.ORDER_DATE
from customers t1
inner join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID;

-- будут выведены все покупатели, у тех, кто не делал заказы - в поле ORDER_DATE будет NULL.
select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t2.ORDER_DATE
from customers t1
left join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID;

-- 2. Вывести даты заказов продуктов и описание этих продуктов(product_description).

-- будут выведены только те продукты, у которых есть описание.
select t1.ORDER_DATE, t3.PRODUCT_DESCRIPTION
from orders t1
inner join order_items t2
on t1.ORDER_ID = t2.ORDER_ID
inner join product_information t3
on t2.PRODUCT_ID = t3.PRODUCT_ID;

-- будут выведены все продукты. Для продуктов, у которых описания нет, в поле ORDER_DATE будет NULL.
select t1.ORDER_DATE, t3.PRODUCT_DESCRIPTION
from orders t1
left join order_items t2
on t1.ORDER_ID = t2.ORDER_ID
left join product_information t3
on t2.PRODUCT_ID = t3.PRODUCT_ID;

-- 3. Вывести имя, фамилию пользователей, даты заказов(orderdate), описание продуктов, которые они заказали и категории соответствующих продуктов (categoryname).

-- Выводятся только те поля, где есть информация
select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t2.ORDER_DATE,  t4.PRODUCT_DESCRIPTION, t5.CATEGORY_NAME
from customers t1
inner join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
inner join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
inner join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
inner join categories_tab t5
on t4.CATEGORY_ID = t5.CATEGORY_ID;

-- выводятся все поля. Там, где информации нет - будет NULL
select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t2.ORDER_DATE,  t4.PRODUCT_DESCRIPTION, t5.CATEGORY_NAME
from customers t1
left join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
left join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
left join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
left join categories_tab t5
on t4.CATEGORY_ID = t5.CATEGORY_ID;


-- Вывести названия(productname), описания категорий(categorydescription) и количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.

select t1.PRODUCT_NAME, t2.CATEGORY_DESCRIPTION, t3.QUANTITY
from product_information t1
inner join categories_tab t2
on t1.CATEGORY_ID = t2.CATEGORY_ID
inner join order_items t3
on t1.PRODUCT_ID = t3.PRODUCT_ID
where t1.MIN_PRICE > 300;

-- Вывести имя, фамилию покупателей, которые купили принтеры.

select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME
from customers t1
inner join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
inner join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
inner join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
inner join categories_tab t5
on t4.CATEGORY_ID = t5.CATEGORY_ID
where t5.CATEGORY_DESCRIPTION like 'printers';

-- Вывести имя, фамилию всех женатых мужчин покупателей, которые покупали продукты со стоимостью (list_price) больше 550.

select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t4.LIST_PRICE
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
where t1.MARITAL_STATUS like 'married' && t1.GENDER like 'M' && t4.LIST_PRICE > 550;
-- выборка пустая, видимо женатые мужчины столько денег не тратят...:))))))

-- Вывести названия(product_name) тех продуктов, у которых стоимость больше, чем у продукта 'LaserPro 600/6/BW’.

select t1.PRODUCT_NAME
from product_information t1
join order_items t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where t2.UNIT_PRICE > (
			select t2.UNIT_PRICE
			from  order_items t2
            join product_information t1
            on  t2.PRODUCT_ID = t1.PRODUCT_ID
			where t1.PRODUCT_NAME like 'LaserPro 600/6/BW' order by t2.UNIT_PRICE limit 1
);
    




