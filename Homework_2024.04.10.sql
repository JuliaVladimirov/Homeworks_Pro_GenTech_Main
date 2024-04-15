
-- 1. Создать базу данных airport:
-- https://github.com/NelliEfr/MySQL_databases/blob/main/airport.txt

use airport;


-- 2. Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.

select t1.model_name, count(t2.id) as flightcount
from airliners t1
inner join trips t2
on t1.id = t2.airliner_id
group by t1.model_name;


-- 3. Вычислить среднюю стоимость билета по классам обслуживания. Вывести serviceclass и averageprice.

select service_class, avg(price) as average_price 
from tickets
group by service_class;


-- 4. Определить средний возраст клиентов, сгруппированных по классу обслуживания. Вывести serviceclass и averageage.

select t1.service_class, avg(t2.age) as average_age
from tickets t1
inner join clients t2
on t1.client_id = t2.id
group by t1.service_class;


-- 5. Получить общее количество билетов, купленных каждым клиентом. Вывести name и ticket_count.

select t1.name, count(t2.id) as ticket_count
from clients t1
inner join tickets t2
on t1.id = t2.client_id
group by t1.name;


-- 6. Определить количество рейсов, отправленных из каждого аэропорта. Вывести departure и departure_count.

select departure, count(departure) as departure_count
from trips
group by departure;


-- 7. Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. Вывести country и total_sum.

select t1.country, sum(t3.price) as total_sum
from airliners t1
inner join trips t2
on t1.id = t2.airliner_id
inner join tickets t3
on t2.id = t3.trip_id
group by t1.country;
