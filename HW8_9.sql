/*
триггер, который не позволяет составлять системы покрытий из разных каталогов
*/

CREATE TRIGGER check_catalog_type 
BEFORE INSERT OR UPDATE OF primer_id, intermediate_id, finish_id ON coating_systems 
FOR EACH ROW
EXECUTE FUNCTION check_coat_types ();

CREATE OR REPLACE FUNCTION check_coat_types()
RETURNS TRIGGER AS 
$$
DECLARE same BOOLEAN;
BEGIN
	IF (
		(SELECT catalogs.id FROM products
		JOIN catalogs ON products.catalog_id = catalogs.id
		WHERE products.id = NEW.primer_id) = 
		(SELECT catalogs.id FROM products
		JOIN catalogs ON products.catalog_id = catalogs.id
		WHERE products.id = NEW.intermediate_id) 
		AND 
		(SELECT catalogs.id FROM products
		JOIN catalogs ON products.catalog_id = catalogs.id
		WHERE products.id = NEW.primer_id) = (SELECT catalogs.id FROM products
		JOIN catalogs ON products.catalog_id = catalogs.id
		WHERE products.id = NEW.finish_id))
	THEN
  	RETURN NEW;
  	END IF; 
  	RAISE NOTICE 'coating catalogs are not the same';
END
$$ 
LANGUAGE PLPGSQL;


INSERT INTO coating_systems (primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ( 9, 224, 4, 211, 14, 222);
SELECT * FROM coating_systems;
UPDATE coating_systems SET primer_id = 14 WHERE id = 102;
