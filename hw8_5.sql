/*
найти эпоксидные покрытия, которые имеют сухой остаток не менее 50%, отобразить системы в которых они присутствуют
в качестве первого или промежуточного слоя.
*/

SELECT 
	(SELECT name FROM products WHERE id = primer_id) AS primer_name, 
	primer_dft,
	(SELECT name FROM products WHERE id = intermediate_id) AS intermediate_name, 
	intermediate_dft,
	(SELECT name FROM products WHERE id = finish_id) AS finish_name, 
	finish_dft 
	FROM coating_systems
WHERE primer_id IN 
	(SELECT id FROM products 
		WHERE id = ANY 
			(SELECT product_id FROM main_technical_data 
			WHERE binder_id = ANY 
		 		(SELECT id FROM binders 
					WHERE name LIKE '%epoxy%') 
			 		AND volume_solid >= 50))
OR intermediate_id IN 
	(SELECT id FROM products 
		WHERE id = ANY 
			(SELECT product_id FROM main_technical_data 
			WHERE binder_id = ANY 
		 		(SELECT id FROM binders 
					WHERE name LIKE '%epoxy%') 
			 		AND volume_solid >= 50));



/*
найти самый популярный из применяемых грунтов на этилсиликатной основе. вывести название продукта и идентификатор системы, в которой он присутствует.
*/
SELECT 
used_system_id, 
(SELECT name 
 	FROM products 
 	WHERE id = 
 		(SELECT primer_id 
		 FROM coating_systems 
		 WHERE id = used_systems.used_system_id )
)
FROM used_systems 
WHERE 
	(SELECT name 
	 FROM binders 
	 WHERE id = 	
	 	(SELECT binder_id 
		 FROM main_technical_data 
		 WHERE product_id = 
		 	(SELECT primer_id 
			 FROM coating_systems 
			 WHERE id = used_systems.used_system_id))) = 'ESI'
GROUP BY used_system_id ORDER BY COUNT(*) DESC LIMIT 1;



