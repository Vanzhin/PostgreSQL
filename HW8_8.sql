/*
создать функцию, которая показывает название самого используемого финиша в выбранном каталоге.
*/

DROP FUNCTION most_used_finish_in;
CREATE FUNCTION most_used_finish_in (catalog_name VARCHAR) 
RETURNS VARCHAR AS 
$$
  WITH most_used AS(
	SELECT DISTINCT 
	  	products.name AS product_name,
		COUNT (coating_systems.finish_id) OVER (PARTITION BY products.name) AS count_product 
	FROM used_systems
	JOIN coating_systems ON coating_systems.id = used_systems.used_system_id
	JOIN products ON products.id = coating_systems.finish_id
	JOIN catalogs ON catalogs.id = products.catalog_id
	WHERE catalogs.name = catalog_name
	ORDER BY count_product DESC
)
SELECT  product_name
FROM most_used
LIMIT 1; 
$$ 
LANGUAGE SQL;

SELECT * FROM most_used_finish_in ('protective');
