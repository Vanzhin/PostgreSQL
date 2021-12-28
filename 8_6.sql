/*
найти 3-х самых опытных инспекторов по покрытиям из каталога protective. условно принял, что если первый слой - из
каталога защитных покртытий, то и вся система тоже.
*/

WITH systems_primer_count AS( 
	SELECT DISTINCT 
		used_systems.project_id, 
		COUNT(coating_systems.primer_id) OVER (PARTITION BY used_systems.project_id) AS primer_count
	FROM used_systems
	JOIN coating_systems ON coating_systems.id = used_systems.used_system_id
	JOIN products ON products.id =  coating_systems.primer_id
	JOIN catalogs ON catalogs.id = products.catalog_id
	WHERE catalogs.name = 'protective' 
	ORDER BY primer_count DESC
) 
SELECT DISTINCT  
	(tsr.first_name || ' ' || tsr.last_name) AS TSR_name,
	SUM (systems_primer_count.primer_count)  OVER (PARTITION BY tsr.id) AS coat_sum
FROM systems_primer_count
JOIN reports ON reports.project_id = systems_primer_count.project_id
JOIN tsr ON tsr_id = tsr.id
ORDER BY coat_sum DESC 
LIMIT 3;

/*
показать рейтинг инспекторов, которые работали больше всего на проектах заказчика. 
вывести название и идентификатор заказчика, имя, фамилию, почту инспектора, 
количество инспекций на проекте заказчика, рейтинг.
*/

WITH most_experiensed_tsr_customer AS(
SELECT 
	customers.id AS customer_id, 
	customers.name AS customer,
	projects.id AS project_id,
	projects.name AS project,
	COUNT (projects.id ) OVER (PARTITION BY customers.id) AS customer_count,
	COUNT (reports.tsr_id) OVER (PARTITION BY  customers.id, reports.tsr_id) AS tsr_count,
	reports.tsr_id
FROM customers
JOIN projects ON projects.customer_id = customers.id
JOIN reports ON reports.project_id = projects.id
ORDER BY customer_count DESC,  
	customers.id, 
	tsr_count DESC
)
SELECT DISTINCT 
	customer_id, 
	customer, 
	(tsr.first_name || ' ' || tsr.last_name) AS tsr_name, tsr.email,
	DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY tsr_count DESC) AS tsr_customer_rank,
	tsr_count AS projects_inspected
FROM most_experiensed_tsr_customer 
JOIN tsr ON tsr.id = most_experiensed_tsr_customer.tsr_id
ORDER BY 
customer_id, 
tsr_customer_rank;



