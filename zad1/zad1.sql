use cwiczenia1;

--Zadanie 1
with zad1 as (
SELECT od.[order_details_id]
      ,od.[order_id]
      ,od.[pizza_id]
      ,od.[quantity]
	  ,p.price * od.quantity summarized_amount
	  ,o.date AS order_date

  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  WHERE o.date = '2015-02-18'
 )

SELECT avg(summarized_amount), order_date
FROM zad1
GROUP BY order_date


--Zadanie 2
with zad2 as(
SELECT od.[order_id]
	  ,o.date
	  ,string_agg(pt.ingredients, ', ') ingredients
  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
  group by o.date, od.order_id)

  select order_id from zad2 
  WHERE date LIKE '2015-03-%' AND ingredients NOT LIKE '%Pineapple%'
   

--Zadanie 3 
 with zad3 as (
SELECT od.[order_id]
	  ,sum(p.price * od.quantity) as total_price
  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  WHERE o.date LIKE '%-02-%'
  group by od.order_id
 )

  select top(10) rank () over (
 order by total_price desc) as top_total
 ,order_id
 ,total_price
 from zad3

 --Zadanie 4
with zad4 as (
SELECT od.[order_id]
	  ,sum(p.price * od.quantity) order_amount
	  ,month(o.date) month_date
	  ,o.date
  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  GROUP BY od.order_id, o.date
 ),
average_month_price as(
 SELECT Avg(order_amount) average_month_amount,
          month_date
FROM      zad4
GROUP BY month_date)

SELECT z.order_id
	  ,z.order_amount
	  ,p.average_month_amount
	  ,z.date
	  from zad4 z
JOIN average_month_price p ON p.month_date = z.month_date

--Zadanie 5
 with zad5 as (
SELECT od.order_id
	,o.date
	,DATEPART(HOUR,o.time) as order_hour
  FROM [dbo].[order_details] od
  JOIN orders o ON o.order_id = od.order_id
  WHERE o.date = '2015-01-01'
  group by od.order_id,o.time,o.date
 )
 SELECT count(order_id) as order_count, date, order_hour as order_count 
 FROM zad5 group by order_hour, date

 --Zadanie 6
 with zad6 as(
SELECT pt.name,pt.category, sum(od.quantity) as pizza_count
  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
  WHERE date LIKE '2015-01-%'
  group by pt.name,pt.category)

  select * from zad6

 --Zadanie 7
 with zad7 as(
SELECT p.size, count(p.size) as pizza_count
  FROM [dbo].[order_details] od
  JOIN pizzas p ON p.pizza_id = od.pizza_id
  JOIN orders o ON o.order_id = od.order_id
  JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
  WHERE date LIKE '2015-02-%' or date LIKE '2015-03-%'
  group by p.size)

  select * from zad7

