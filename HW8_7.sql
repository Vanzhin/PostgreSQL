/*
представление для таблицы проектов - вывести идентификатор и дата последнего обновления последнего отчета, имя инспектора
*/
CREATE VIEW last_reports_projects AS
WITH last_reports AS(
	SELECT 
		projects.id AS project_id, 
		projects.name AS project_name, 
		reports.id AS report_id, 
		reports.updated_at, (tsr.first_name || ' ' || tsr.last_name) AS tsr_name,
	MAX (updated_at) OVER (PARTITION BY projects.id) AS last_date
	FROM projects
	LEFT JOIN reports ON reports.project_id = projects.id
	LEFT JOIN tsr ON tsr.id = reports.tsr_id
	ORDER BY project_id
)
SELECT 
	project_id, 
	project_name, 
	report_id, 
	last_date, 
	tsr_name
FROM last_reports
WHERE last_date = updated_at OR last_date IS NULL;

SELECT * FROM last_reports_projects;

/*
представление для таблицы лабораторные заключения - вывести те системы, у которых заканчивается срок действия сертификата
в этом или следующем годах,
и которые использовались на проектах в этом году.
*/
CREATE VIEW tests_to_update AS
SELECT 
	projects.id AS project_id, 
	used_systems.used_system_id AS system_id, 
	approved_tests.expires_at  FROM projects
JOIN used_systems ON used_systems.project_id = projects.id
JOIN approved_tests ON approved_tests.system_id = used_systems.used_system_id
WHERE EXTRACT (YEAR FROM projects.finished_at) >= EXTRACT( YEAR FROM CURRENT_DATE)
	AND 
	(EXTRACT(YEAR FROM approved_tests.expires_at) >=  EXTRACT(YEAR FROM CURRENT_DATE)
		AND 
	 approved_tests.expires_at >= CURRENT_DATE);

SELECT * FROM tests_to_update;



