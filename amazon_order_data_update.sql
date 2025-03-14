
USE OSP;

SELECT * FROM AmazonOrder_stagging;

SELECT * FROM AmazonOrderTest;

/*counting the nu. of values that has to be updated*/
select count(*)
from AmazonOrder_stagging as s
join AmazonOrderTest as t
 on 

 /* Finding the no. of amazon_order_id that need to be updated in the primary*/

 select s.amazon_order_id
 from amazonorder_stagging as s
 join amazonordertest as t
	on s.amazon_order_id = t.amazon_order_id
	where s.order_status<> t.order_status
	and t.last_updated_date > s.last_updated_date;



 select s.amazon_order_id as primary_order_id,s.order_status as primary_order_status,t.order_status as secondary_order_status,t.last_updated_date as secondary_last_updated_date,s.last_updated_date as primary_updated_date,t.amazon_order_id as secondary_amazon_order_id
 from amazonorder_stagging as s
 join amazonordertest as t
	on s.amazon_order_id = t.amazon_order_id
	where s.order_status<> t.order_status
	and cast(t.last_updated_date as date) > cast(s.last_updated_date as date);


/*Fetching the details of a single record in the primary table*/
select * from amazonorder_stagging 
where amazon_order_id = '111-7451559-7040222';

/*Fetching the details of a single record in the secondary table*/
select * from amazonordertest
where amazon_order_id = '111-7451559-7040222';

/*updaing  single value in the primary wrt the secondary*/
update s
set s.order_status= t.order_status,
s.last_updated_date = t.last_updated_date
from amazonorder_stagging as s
join AmazonOrderTest as t
	on s.amazon_order_id = t.amazon_order_id
where s.amazon_order_id = '111-7451559-7040222'
	and s.order_status<>t.order_status
	and  t.last_updated_date > s.last_updated_date;


monday 
/*final qwery to remove the all the different values */

use osp

update s
set s.order_status= t.order_status,
s.last_updated_date = t.last_updated_date
from amazonorder_stagging as s
join AmazonOrderTest as t
	on s.amazon_order_id = t.amazon_order_id
where s.order_status<>t.order_status
	and  cast(t.last_updated_date as date) > cast(s.last_updated_date as date);
