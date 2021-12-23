/*
База по защитным  и морским покрытиям, которые применяются в России. 
основные задачи:
 - подбор покрытия или системы покрытий по заданным параметрам;
 - просмотр опыта использования систем покрытий на объектах;
 - извлечение основных свойств покрытия и комплекта документов в одном месте;
 

*/
CREATE TABLE products (
  	id SERIAL PRIMARY KEY,
  	name VARCHAR(50) NOT NULL,
  	brand_name_id SMALLINT NOT NULL,
  	catalog_id SMALLINT NOT NULL,
  	created_at TIMESTAMP
);

CREATE TABLE brands (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TYPE main_functions AS (primer BOOL, intermediate BOOL, finish BOOL, internal BOOL);
CREATE TYPE env AS (air BOOL, immersion BOOL,immersion_water BOOL, immersion_soil BOOL, immersion_chem BOOL);
CREATE TYPE substrate AS (steel BOOL, concrete BOOL, hdg BOOL, nf_metal BOOL);


CREATE TABLE main_technical_data (
  	product_id INT NOT NULL,
  	binder_id INT NOT NULL,
  	volume_solid SMALLINT NOT NULL CHECK (volume_solid <= 100),
  	standard_dft SMALLINT DEFAULT NULL,
  	dry_to_touch real DEFAULT NULL,
  	main_functions main_functions DEFAULT (FALSE,FALSE,FALSE,FALSE),
  	treatment_tolerance BOOL DEFAULT FALSE,
  	env env DEFAULT (TRUE,FALSE,FALSE,FALSE,FALSE),
  	substrate substrate DEFAULT (TRUE,FALSE,FALSE,FALSE),
  	min_temp SMALLINT,
  	max_temp 	SMALLINT,
  	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP DEFAULT NULL
  
);

CREATE TABLE binders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL

	
);
CREATE TABLE labs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL

	
);

CREATE TABLE pds (
	product_id INT NOT NULL,
	url VARCHAR(250) NOT NULL UNIQUE
);
CREATE TABLE approved_tests (
	id SERIAL PRIMARY KEY,
 	lab_id INT NOT NULL,
  	system_id INT NOT NULL,
	standard_id INT NOT NULL,
  	comments TEXT DEFAULT NULL,
  	url VARCHAR(250) NOT NULL UNIQUE,
  	issued_at DATE NOT NULL,
  	expires_at DATE DEFAULT NULL
	);
	
CREATE TABLE standards (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
	
CREATE TABLE coating_systems(
  	id SERIAL PRIMARY KEY,
  	primer_id INT NOT NULL,
  	primer_dft SMALLINT NOT NULL,
  	intermediate_id INT NOT NULL,
  	intermediate_dft SMALLINT NOT NULL,
  	finish_id INT NOT NULL,
  	finish_dft SMALLINT NOT NULL
);	
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE contractors (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE projects (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	customer_id INT NOT NULL,
	contractor_id INT NOT NULL,
	system_ids INT ARRAY,
  	comments TEXT DEFAULT NULL,
  	started_at DATE DEFAULT NULL,
  	finished_at DATE DEFAULT NULL
	);
	
	
CREATE TABLE reports (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
  	project_id INT NOT NULL,
  	url VARCHAR(250) NOT NULL UNIQUE,
  	tsr_id SMALLINT NOT NULL,
  	started_at DATE DEFAULT NULL,
  	finished_at DATE DEFAULT NULL,
  	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP DEFAULT NULL
	);
	
	

CREATE TABLE tsr (
	id SMALLSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
  	last_name VARCHAR(50) NOT NULL,
  	email VARCHAR(120) NOT NULL UNIQUE

);

INSERT INTO reports VALUES (1,'Temporibus aut optio in tempora et earum.',50,'http://www.lebsackboehm.com/',24,'2019-03-17','1975-01-30','2014-03-24 00:09:52','1985-09-26 15:23:34'),(2,'Officia impedit aut molestias.',51,'http://hermann.info/',11,'2012-08-02','2007-12-19','1998-06-13 22:52:02','2006-02-27 12:12:37'),(3,'Sit ut modi nam et.',53,'http://denesik.org/',16,'2007-05-07','1998-05-03','2003-05-03 20:38:28','2018-09-25 03:40:48'),(4,'Amet sapiente et suscipit.',53,'http://olson.com/',18,'1987-08-13','1981-07-27','1981-03-09 12:05:11','2015-10-27 19:48:46'),(5,'Ad hic similique natus officiis sint commodi incid',55,'http://www.schroederhauck.com/',11,'2010-11-15','1984-03-05','2016-04-20 22:54:17','1988-05-03 02:54:51'),(6,'Optio veniam nihil maiores non.',58,'http://zemlakkohler.info/',26,'1978-12-06','2018-12-07','2012-01-27 03:00:23','2006-09-08 05:50:23'),(7,'Eum porro ratione dolore assumenda.',54,'http://konopelski.org/',12,'2014-09-27','1991-06-30','1996-03-28 07:58:25','2012-11-18 11:19:08'),(8,'Fugiat recusandae rerum nemo et.',46,'http://www.reynoldsschmitt.com/',19,'1998-04-21','1975-05-17','1978-02-01 17:05:05','2012-03-01 23:32:19'),(9,'Exercitationem eius earum ipsa saepe.',30,'http://nader.com/',23,'2017-06-02','1984-09-13','1994-09-22 21:39:52','2000-11-03 09:12:26'),(10,'Vel itaque iste veniam rerum qui iusto.',41,'http://batz.biz/',19,'1993-11-07','2017-03-20','2000-05-09 10:35:30','2015-02-22 00:46:31'),(11,'Eos labore facilis rerum ullam et.',31,'http://mcglynn.net/',20,'1995-09-09','2010-04-07','2017-02-04 16:08:28','2014-07-26 10:54:12'),(12,'Et aperiam odit vel blanditiis non est culpa volup',40,'http://www.becker.biz/',28,'2011-12-28','1976-08-05','2000-02-08 19:33:07','1983-10-06 11:26:30'),(13,'Velit tenetur libero excepturi similique veniam vo',56,'http://ankunding.com/',24,'1988-12-04','2012-10-07','1984-08-10 16:46:05','1980-04-06 01:49:08'),(14,'Est aut consectetur provident qui.',34,'http://www.pouros.com/',30,'1994-06-27','2005-02-13','1993-08-21 23:10:25','1994-04-16 20:23:00'),(15,'Non voluptas temporibus a iste adipisci.',61,'http://www.bartoletti.com/',20,'1972-04-02','1983-12-24','2018-01-15 11:48:00','2012-08-03 22:50:14'),(16,'Quos possimus maiores saepe sunt deleniti.',37,'http://frami.info/',28,'2021-06-11','2000-01-10','2021-01-02 05:14:50','1978-09-07 11:31:31'),(17,'Consequatur sed nobis debitis saepe et impedit.',42,'http://www.blandachamplin.com/',29,'1991-08-16','1982-10-18','2015-05-09 10:10:11','1980-08-24 10:02:13'),(18,'Iure sunt quod quos qui sed est deleniti.',52,'http://www.hodkiewicz.com/',21,'1990-06-06','2007-03-14','1970-11-05 23:18:24','2017-05-07 11:36:41'),(19,'Et eveniet culpa accusamus explicabo sunt aperiam.',50,'http://www.lindgren.com/',30,'1998-10-01','1998-01-10','2002-06-18 16:10:14','2015-05-24 04:04:26'),(20,'Et quia debitis voluptatibus ut.',52,'http://harber.info/',11,'2012-10-10','2005-08-22','1982-04-12 16:02:42','2004-05-02 11:12:26'),(21,'Modi laboriosam eveniet sit nulla quam deserunt co',60,'http://herman.com/',24,'1998-03-31','2002-08-07','2020-12-21 04:05:29','2017-03-21 04:28:06'),(22,'Sequi aut est eum fugit sed accusantium repellendu',70,'http://www.goldner.info/',20,'1972-07-13','2014-01-17','1981-12-24 23:39:53','1991-08-28 22:20:37'),(23,'Quam et officiis laudantium et possimus iure sed.',45,'http://www.welch.com/',24,'1988-12-07','1991-11-10','1970-05-04 11:55:35','2018-05-19 23:27:58'),(24,'Voluptas placeat et rerum ut magnam provident fuga',55,'http://lindlittel.com/',26,'1993-03-07','2018-10-20','1991-10-31 05:30:49','1972-03-30 06:25:35'),(25,'Rerum qui quia cupiditate architecto.',34,'http://donnelly.com/',30,'2018-05-20','1982-08-29','1996-08-13 16:38:52','1987-06-29 17:24:55'),(26,'Consequatur accusamus incidunt voluptatibus vel mo',49,'http://www.champlin.info/',29,'1997-04-05','1988-01-11','1989-04-24 08:42:00','1994-12-23 19:45:32'),(27,'Ea in placeat amet libero reprehenderit corrupti s',31,'http://doyle.net/',25,'1996-10-09','2006-01-06','1987-10-24 09:07:10','2007-09-07 13:59:10'),(28,'Et ea debitis consequatur repellat harum natus por',50,'http://murray.com/',16,'1985-03-28','2014-04-04','2000-12-15 03:10:45','1995-10-08 23:42:59'),(29,'Nam ipsam dolorem praesentium blanditiis corrupti ',47,'http://pacochareilly.com/',14,'2001-05-23','2006-07-06','2019-04-14 07:23:06','1984-02-21 22:47:06'),(30,'Et nam et doloremque temporibus corporis soluta.',56,'http://koss.net/',12,'2006-08-10','1984-06-09','1980-01-21 10:37:33','2015-10-22 22:24:45'),(31,'Dolorem error occaecati odio doloremque.',41,'http://www.erdman.com/',14,'1993-04-03','2016-05-03','2012-01-05 15:30:05','2005-11-18 11:59:50'),(32,'Iste fuga magnam dignissimos voluptas et.',59,'http://schmitt.org/',12,'1987-07-13','2008-04-11','2014-01-14 21:36:18','2010-02-25 10:07:38'),(33,'Corporis nemo qui quia maxime.',40,'http://harris.com/',18,'2000-02-18','1972-12-15','1975-04-20 22:16:47','1996-12-29 10:08:35'),(34,'Provident cumque temporibus officiis quibusdam qui',51,'http://www.effertz.com/',28,'2017-07-08','2018-10-15','1991-04-05 04:31:26','1998-03-03 04:05:16'),(35,'Deserunt voluptatem vitae accusamus nisi.',59,'http://hagenesfunk.biz/',23,'1984-07-18','1983-01-10','1987-12-04 01:25:18','2020-06-10 08:30:26'),(36,'Dolores nihil eius corrupti quos.',69,'http://www.schimmel.org/',12,'1970-10-09','2007-04-19','1997-04-26 06:57:01','2010-04-17 09:22:42'),(37,'Modi et aut quasi enim quaerat.',59,'http://www.hudson.org/',23,'1997-06-09','2000-12-24','2008-06-10 05:51:06','1984-02-08 18:33:42'),(38,'Fuga fugit consequatur eos nesciunt.',46,'http://www.oberbrunner.com/',13,'1978-03-31','2013-02-13','1984-09-06 09:25:26','2003-05-29 10:55:44'),(39,'Exercitationem voluptatem similique commodi offici',37,'http://cruickshankbaumbach.net/',11,'2006-05-12','1970-03-13','2005-07-08 16:57:42','1990-08-02 05:56:24'),(40,'Est odit autem eos autem officiis.',34,'http://www.maggio.com/',22,'1983-08-14','2005-01-19','1992-06-14 01:24:57','1992-05-31 02:35:06'),(41,'Voluptatem sequi at magni.',35,'http://mosciski.com/',16,'2018-11-11','1971-04-28','1997-03-08 07:06:19','2020-04-04 16:38:45'),(42,'Possimus aliquid nam blanditiis aut reiciendis.',36,'http://www.padberg.info/',23,'1999-02-02','1989-06-20','1992-05-07 19:03:25','2000-10-15 06:48:33'),(43,'Aliquid et maiores voluptate magni.',42,'http://www.kiehn.net/',27,'1987-10-03','1991-09-06','2004-01-13 20:28:23','2019-07-27 00:19:22'),(44,'Eius sunt aliquam repellat minus minima incidunt t',63,'http://kessler.org/',16,'2000-11-18','1985-01-03','2017-04-20 21:26:55','1978-01-19 08:50:46'),(45,'Veniam rem et est deserunt nam tempore sequi.',49,'http://greenmarks.com/',27,'2010-02-23','1997-01-02','1994-12-16 00:31:38','1999-05-15 21:52:21'),(46,'Ex labore ab a voluptate ut error.',47,'http://becker.info/',28,'1982-09-26','2004-03-31','2018-12-19 02:49:23','1977-12-08 15:47:01'),(47,'Quasi quis aut nisi et distinctio perferendis aut.',43,'http://www.gislason.net/',10,'1979-12-08','2012-01-16','2011-04-21 00:04:00','1993-04-21 19:49:23'),(48,'Dicta eligendi aliquid perspiciatis.',40,'http://www.witting.com/',11,'1979-02-16','1985-11-13','1994-02-24 17:51:17','1977-08-11 15:42:30'),(49,'Repudiandae quod molestias quia pariatur magni mod',56,'http://www.rolfson.net/',15,'1986-07-19','2001-07-29','1990-01-19 17:35:35','1988-01-08 23:25:24'),(50,'Placeat eum ea optio velit eligendi asperiores.',42,'http://www.bartonschneider.biz/',12,'1980-09-28','1974-05-19','1972-10-04 23:29:20','1996-04-17 13:15:58'),(51,'Voluptas esse totam et consequuntur exercitationem',35,'http://www.schinner.org/',18,'1976-10-25','1988-03-17','2007-11-12 20:30:10','2002-04-02 18:07:14'),(52,'Est asperiores non quis quis dolorum.',48,'http://www.franeckilebsack.com/',25,'1978-08-25','1974-12-18','2016-12-21 10:27:10','1985-04-28 18:32:30'),(53,'Sit id et qui autem architecto et.',47,'http://rodriguez.com/',26,'2016-06-13','1993-06-18','1972-05-22 03:14:36','1996-03-07 22:44:12'),(54,'Autem et sit dignissimos unde.',62,'http://www.harvey.com/',21,'2012-02-24','1983-03-17','2009-09-29 00:28:04','2003-02-23 19:42:09'),(55,'Voluptas temporibus consectetur quis facere quae a',63,'http://streicherdman.com/',13,'2002-05-21','1982-12-30','1994-03-25 22:02:54','1998-12-27 00:17:11'),(56,'Est id expedita quaerat.',54,'http://sawaynjones.com/',10,'1990-03-08','1971-05-20','1982-03-24 14:09:03','2014-08-10 09:58:23'),(57,'Doloribus nihil rem at culpa velit quo.',32,'http://www.pfannerstillzboncak.com/',18,'2006-07-09','1995-05-01','1989-04-15 20:08:48','2005-06-02 18:16:59'),(58,'Porro est corrupti tempore qui voluptatem voluptat',32,'http://www.williamson.org/',21,'1991-11-26','2000-08-19','1979-04-20 13:23:05','2014-12-08 06:21:37'),(59,'Sit omnis accusamus deleniti ut.',53,'http://wisozkferry.com/',13,'1987-07-26','1971-08-27','1987-03-13 16:08:03','1980-08-24 20:14:03'),(60,'Magni natus odio impedit.',33,'http://pagac.org/',10,'2013-09-16','1971-01-20','2009-09-18 15:55:33','2020-02-08 03:01:22'),(61,'Hic placeat qui illum aut sint magni.',42,'http://www.schmeler.org/',28,'1988-03-14','1977-10-15','1974-11-23 19:07:35','1994-04-14 20:12:48'),(62,'Possimus magni aut et possimus.',34,'http://metz.biz/',30,'1993-03-30','1999-09-28','2001-10-12 10:28:30','2013-09-25 00:52:04'),(63,'Adipisci quo natus eius adipisci velit.',36,'http://hermiston.com/',18,'1984-05-04','1993-09-03','1982-03-19 17:03:23','1993-09-20 15:29:35'),(64,'Suscipit ea temporibus unde omnis exercitationem e',45,'http://corkery.com/',22,'2019-11-23','2004-05-16','2000-08-09 15:32:32','2014-02-08 21:55:59'),(65,'Voluptate enim ad dolores.',30,'http://www.blanda.com/',13,'1993-04-20','2018-02-16','1991-11-26 04:24:19','1978-06-17 21:54:12'),(66,'Aliquid sapiente reiciendis consectetur consectetu',30,'http://hermiston.net/',20,'2014-08-24','1998-12-08','1999-05-19 18:16:37','1977-11-14 06:27:39'),(67,'Et quis dignissimos distinctio.',44,'http://www.friesen.com/',27,'2010-06-04','1973-05-26','2004-11-27 04:51:59','2011-01-13 22:23:30'),(68,'Est laudantium et ea rerum eum reiciendis voluptat',43,'http://www.durgandicki.com/',29,'2016-07-06','2013-11-13','2019-09-07 13:31:34','1985-07-31 01:54:11'),(69,'Delectus doloribus ea aspernatur.',67,'http://www.corkery.com/',26,'2017-04-27','1983-05-13','1981-12-13 23:08:47','1978-05-23 18:49:50'),(70,'Repellat ullam ut veniam.',44,'http://www.funk.biz/',26,'1992-01-30','2014-10-22','1977-07-08 02:42:58','2000-12-17 09:02:56'),(71,'Et et odit repellat nam.',49,'http://www.greenfelder.com/',26,'1972-07-28','1973-05-29','2012-03-15 13:42:10','2005-03-29 15:18:38'),(72,'Vel sint similique quis velit.',34,'http://keeling.com/',25,'2004-02-15','2015-05-12','2015-09-26 05:04:39','1975-01-09 02:56:10'),(73,'Voluptatum asperiores ut libero deleniti repudiand',42,'http://www.lemke.com/',10,'1984-01-10','2011-10-29','1994-06-10 17:46:45','2021-08-01 21:00:00'),(74,'Non impedit voluptatem aut nihil dolores magnam fu',44,'http://www.quitzonwilkinson.com/',12,'2009-10-29','2019-10-14','1970-12-27 06:22:12','1978-04-07 03:34:17'),(75,'Est amet non et est distinctio ducimus et.',66,'http://swift.net/',29,'2019-08-03','1970-11-10','2011-01-25 08:45:12','1985-08-24 05:28:18'),(76,'Laborum autem neque quasi ut ut molestias aut.',46,'http://www.murphynolan.com/',22,'1984-09-21','2016-07-06','1970-09-04 07:27:58','1989-12-21 05:14:36'),(77,'Placeat accusamus nobis nesciunt sunt corporis quo',41,'http://funk.org/',20,'1976-05-19','1979-06-26','2021-03-13 00:08:25','2016-02-08 00:06:42'),(78,'Et labore mollitia reiciendis.',34,'http://www.hirthe.com/',19,'1991-02-16','2000-04-17','2006-11-15 09:57:21','1989-06-27 01:12:35'),(79,'Nulla illo error placeat ut et qui impedit.',65,'http://gottliebhettinger.com/',10,'1986-10-11','1994-02-02','2003-04-26 14:54:00','1980-02-11 18:29:51'),(80,'Dolorem illum sit enim esse qui aut.',40,'http://www.feest.com/',17,'1975-12-19','1994-11-30','1981-04-21 09:47:56','1981-09-06 06:41:57'),(81,'Officiis fugit eveniet explicabo magni maiores quo',51,'http://okuneva.com/',29,'1994-12-11','1977-01-13','1975-07-15 14:28:26','1987-09-15 09:28:59'),(82,'Dolores qui voluptas iusto.',64,'http://www.kutchherman.net/',25,'1972-07-26','1970-09-06','1973-01-17 03:03:27','2019-05-19 09:43:22'),(83,'Vel quia eos consequatur eveniet laboriosam.',67,'http://parisianjacobson.info/',26,'2015-08-17','1997-01-30','1993-03-03 21:32:26','1985-03-06 10:14:36'),(84,'Voluptas soluta autem recusandae enim sit officiis',54,'http://spinka.com/',18,'2019-01-31','1992-02-02','2005-09-02 04:59:48','2005-05-02 10:54:04'),(85,'Debitis dolorem consequuntur provident debitis ill',37,'http://gusikowski.com/',26,'2010-04-13','2011-12-20','1987-02-27 01:25:21','2013-01-26 08:15:07'),(86,'Provident sunt et quasi culpa perspiciatis quos sa',51,'http://www.gerhold.com/',13,'1998-09-19','1986-08-19','1976-06-03 06:03:12','1974-07-26 18:51:31'),(87,'Rerum commodi sed enim autem aspernatur et.',39,'http://murazik.com/',15,'2015-04-19','2000-07-29','1991-01-12 09:30:37','1993-12-25 18:45:03'),(88,'Et beatae vitae officia aperiam.',54,'http://www.hilllpfeffer.org/',18,'2019-11-12','1986-07-07','1983-05-05 22:00:03','2014-08-26 10:05:01'),(89,'Similique expedita tempore veniam omnis deleniti.',65,'http://www.cruickshankemmerich.com/',25,'1994-09-15','1980-09-29','2017-08-22 23:15:15','2012-06-29 19:48:41'),(90,'A facilis eius beatae eum officiis eos sint.',41,'http://runolfsson.org/',27,'1977-09-15','2010-10-19','1981-03-20 05:51:30','2003-01-13 05:08:45'),(91,'Id labore qui quia placeat dolores ut sunt.',70,'http://www.reichert.info/',22,'2003-02-17','1991-07-28','1980-04-26 22:34:06','2000-05-20 12:48:04'),(92,'Officiis vero est nihil aut sed.',46,'http://nienowspinka.com/',24,'1973-03-02','1977-11-13','1992-08-30 05:25:07','2001-09-27 04:34:57'),(93,'Asperiores aut corrupti molestiae corporis in sunt',44,'http://www.gislasonrunolfsdottir.org/',22,'1999-01-05','1970-05-04','2015-07-21 07:11:18','2011-11-27 14:30:22'),(94,'Aliquam enim aperiam voluptatem aut in.',47,'http://www.stehrrippin.com/',16,'1990-11-23','1984-01-14','2002-11-24 07:46:15','1985-09-14 10:40:01'),(95,'Sunt dicta aut iste aut veritatis est sunt.',40,'http://www.dickinson.com/',12,'1985-12-19','1986-07-01','1977-07-29 23:52:23','2017-01-31 19:35:27'),(96,'Nostrum ratione voluptas ut cupiditate quia libero',63,'http://jakubowski.biz/',16,'2003-05-11','1971-02-24','2001-11-30 16:29:32','1984-10-02 00:30:02'),(97,'At omnis qui cum aut aut officia.',31,'http://erdman.info/',28,'1997-08-18','2001-01-15','1986-06-11 00:52:45','2015-02-22 20:49:55'),(98,'Dolorem quasi aut adipisci ut inventore.',33,'http://www.braun.com/',14,'2003-03-28','2000-11-24','1999-06-29 17:09:06','1970-03-08 22:47:23'),(99,'Maxime deleniti in autem libero ab nobis non.',50,'http://www.strosin.com/',19,'1992-09-16','1994-01-29','2000-12-19 00:08:38','1989-05-10 20:37:43'),(100,'Et minima soluta nisi et nam ut.',36,'http://witting.com/',12,'1975-01-05','2012-11-24','1981-09-28 22:24:32','2011-04-03 00:54:20');


INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('1', 19, 1, 1, 'Et numquam sed saepe. Ad repudiandae nostrum et omnis cumque excepturi. Voluptatum et ipsa quo aut porro.', 'http://www.pourosjohnson.com/', '2003-04-25', '1992-06-06');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('2', 2, 2, 2, 'Perspiciatis aliquam officia nobis. Quidem aut est odio aut id distinctio asperiores. Repellat facilis molestias nihil deserunt. Ut eveniet hic officia explicabo voluptas. Deserunt qui dicta aliquam reiciendis debitis.', 'http://keeling.com/', '2011-10-08', '1998-12-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('3', 7, 3, 3, 'Quaerat tenetur architecto sit dicta illum molestiae dignissimos. Sint aut non maiores magni est debitis. Quis et perspiciatis mollitia vero consectetur facilis.', 'http://purdydonnelly.com/', '1984-11-29', '2013-10-12');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('4', 19, 4, 4, 'Voluptatem ratione fuga ea labore ea amet beatae adipisci. Sunt sint incidunt doloremque eos in. In voluptates ratione ipsum ut nihil. Quo totam iure sit occaecati nobis.', 'http://mclaughlin.com/', '1972-12-21', '1986-03-05');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('5', 18, 5, 5, 'Ea commodi non repellendus officia necessitatibus iusto dolore. Voluptatem veritatis consequuntur voluptas amet reiciendis.', 'http://schmitt.com/', '1982-12-31', '1976-02-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('6', 2, 6, 6, 'Sequi laudantium ut facilis qui non. Necessitatibus et sunt quas sint deleniti nostrum.', 'http://www.harris.info/', '2021-12-21', '1996-11-23');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('7', 18, 7, 7, 'Laborum ut provident dicta non optio officia unde. Eos cum voluptate aut laboriosam libero beatae. Atque numquam enim atque molestiae quam et.', 'http://kub.com/', '1980-06-14', '2017-11-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('8', 20, 8, 8, 'Consectetur nemo est itaque voluptas nostrum praesentium. Voluptas eos explicabo sit. Qui ut perferendis et ut.', 'http://www.sporer.com/', '1976-12-24', '2005-04-15');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('9', 8, 9, 9, 'Velit laudantium saepe vel numquam quos delectus placeat. Voluptatum autem facere odit velit quo exercitationem. Beatae et eum minus ut itaque.', 'http://www.veum.info/', '1987-07-06', '2012-12-01');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('10', 20, 10, 10, 'Et minima possimus autem consequatur. Sint corporis eum harum reprehenderit consequatur asperiores occaecati. Architecto eos ab cupiditate odit non repellendus.', 'http://blandalakin.com/', '1992-07-26', '1978-11-02');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('11', 12, 11, 11, 'Ea dolorem qui nam. Earum a voluptates porro laborum occaecati explicabo aut. Quibusdam autem officiis accusantium enim molestias fugiat soluta. Cumque libero est alias vitae.', 'http://www.balistreri.net/', '1989-06-22', '2020-02-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('12', 4, 12, 12, 'Nisi sed officiis et enim cupiditate et saepe. Fuga quas eum vel nihil eveniet ipsam nesciunt omnis. Sunt ut asperiores sit.', 'http://king.info/', '1993-02-17', '2006-04-20');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('13', 18, 13, 13, 'Expedita fugit sed sunt voluptatem dolores. Amet est repellat adipisci consequatur nulla.', 'http://monahanbatz.com/', '2015-06-19', '1988-02-07');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('14', 16, 14, 14, 'Asperiores autem fugiat animi eum rem similique et exercitationem. Animi vitae adipisci harum ducimus mollitia adipisci. Libero illo alias neque consequuntur in maxime.', 'http://larson.biz/', '2014-04-29', '1980-06-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('15', 13, 15, 15, 'Ab totam labore eligendi illo. Animi pariatur expedita pariatur corrupti porro velit perspiciatis.', 'http://www.sawayn.com/', '2016-06-28', '2010-07-12');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('16', 14, 16, 16, 'Ipsa ab placeat facere aut mollitia ad ipsam. Qui quia et iusto modi. Natus aut aspernatur consequatur. Et deleniti sunt ratione impedit nobis quia.', 'http://www.kirlinbogisich.com/', '1980-07-27', '1979-03-16');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('17', 10, 17, 17, 'Nemo est esse neque odio corporis. Et qui sit quibusdam dolore. Voluptas quos alias et tenetur iure.', 'http://www.huelcrooks.com/', '2007-11-10', '2016-03-14');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('18', 12, 18, 18, 'Aliquid blanditiis ea architecto distinctio aperiam et. Doloribus libero et non qui. Et et sunt et cumque itaque laboriosam et. Ipsa et illum aut et quo ut est. Reiciendis voluptatem id animi et asperiores sunt mollitia.', 'http://www.nicolasfadel.com/', '2002-12-09', '1988-06-14');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('19', 3, 19, 19, 'Vitae maxime quaerat ea animi. Laboriosam placeat et sapiente repudiandae ullam. Laudantium qui quia perferendis non. Iusto quasi iusto nulla sed excepturi iste.', 'http://www.gleasonwelch.com/', '2000-05-21', '2000-02-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('20', 19, 20, 20, 'Aliquam pariatur quibusdam officiis non debitis iusto placeat. Et perferendis at in eius. Nulla dolore debitis rerum iure omnis sunt nostrum magni.', 'http://www.bode.org/', '2017-10-21', '2004-03-11');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('21', 16, 21, 21, 'Consequatur ipsam et tempora corrupti minus repellendus reprehenderit. Rem magni dolor reprehenderit tenetur minus quia. Porro rerum dolores harum et.', 'http://flatleybrakus.info/', '1981-04-17', '1986-02-06');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('22', 12, 22, 22, 'Deserunt et et nostrum. Delectus quis soluta et molestiae totam architecto enim explicabo. Occaecati quia itaque commodi in. Perferendis mollitia sit natus quaerat ad.', 'http://www.littelwindler.com/', '1998-08-10', '2003-09-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('23', 5, 23, 23, 'Nostrum aliquam perspiciatis saepe esse a et dolores debitis. Perspiciatis velit ut nulla eligendi et et. Mollitia facilis omnis facere unde eum ut voluptate fuga.', 'http://orn.com/', '2008-02-26', '1997-03-01');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('24', 1, 24, 24, 'Velit ut qui animi saepe voluptas. In ipsum ut ea earum quae ad quos enim. Suscipit rerum necessitatibus reiciendis officiis aut omnis.', 'http://www.thompsonbecker.com/', '1985-05-21', '1999-09-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('25', 20, 25, 25, 'Voluptatum nostrum vero quia. Ut velit quas necessitatibus animi maxime. Quos velit quasi aut. Error in dolor nihil ut odit.', 'http://johnsroberts.org/', '2018-07-27', '1983-03-24');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('26', 20, 26, 26, 'Laboriosam corporis aliquam numquam quaerat delectus quibusdam eos velit. Illo iusto quia repellat et nobis possimus. Hic minima cum modi quasi et quos.', 'http://www.rueckermurray.com/', '2020-03-10', '1984-12-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('27', 12, 27, 27, 'Dolor nisi consequatur reprehenderit debitis. Tempore commodi dolorem tempore cum et perspiciatis qui. Voluptate ea dicta libero tempora.', 'http://www.hodkiewicz.com/', '1971-07-07', '1978-03-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('28', 1, 28, 28, 'Quae odio vitae mollitia alias unde. Est voluptatum sunt hic quam. Ut consequuntur et qui quia non sed id. Voluptas provident sapiente tempore nisi libero.', 'http://www.bartoletti.com/', '1981-07-07', '2018-08-30');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('29', 15, 29, 29, 'Accusantium dolorum tempora doloribus. Commodi aut impedit aut amet est iste rerum. Iure fuga et doloribus minus quia. Voluptatem eius et saepe blanditiis iusto eum enim.', 'http://www.lowehoppe.com/', '1999-02-15', '1989-10-31');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('30', 8, 30, 30, 'Aperiam quidem corrupti voluptas rerum delectus perspiciatis. Earum repudiandae occaecati voluptatem dolores. Voluptatibus adipisci itaque aliquam sed dolorum est et. Ex et ut earum sit.', 'http://gleichnerbernhard.com/', '2018-12-02', '1980-08-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('31', 14, 31, 31, 'Eaque accusantium ad ipsa exercitationem veniam est nobis. Dolores nemo ut pariatur exercitationem. Odit mollitia sit voluptatem esse occaecati autem in voluptas. Magnam nihil cumque libero debitis incidunt excepturi.', 'http://keelinghomenick.com/', '1998-04-13', '2014-10-06');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('32', 4, 32, 32, 'Amet iste temporibus sit aliquid. Ut facere dignissimos et illum quo. Laboriosam beatae aperiam quisquam dicta non eveniet. Maxime omnis sint excepturi beatae exercitationem iusto eum.', 'http://www.durgan.net/', '1976-05-15', '2006-07-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('33', 16, 33, 33, 'Minima omnis debitis reprehenderit et repellat. Ipsam voluptatem optio dolor ut. In amet non voluptas neque. Sed eaque in eligendi aliquam.', 'http://cole.com/', '1998-12-26', '1974-10-25');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('34', 8, 34, 34, 'Velit et officia quis odit. Temporibus fugit eum aperiam et possimus ut. Cumque quia ab maiores itaque possimus nisi et. Et qui et ut nihil voluptates et aliquam.', 'http://langworth.com/', '1990-02-28', '1993-03-18');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('35', 9, 35, 35, 'Mollitia veritatis qui voluptates rem. Itaque inventore dolorem ducimus vel. Commodi quo dolor eius enim. Perferendis et quia optio sit non qui.', 'http://www.metzbogan.org/', '1994-02-27', '1991-07-17');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('36', 9, 36, 36, 'Dolorem est itaque iusto provident perspiciatis illum. Omnis tempora et ducimus alias itaque provident et. Optio eveniet facere vel.', 'http://runolfsdottir.com/', '1988-11-15', '1988-06-21');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('37', 7, 37, 37, 'Vel sunt eaque nam ut laudantium in qui. Soluta inventore sit iusto facilis sit ut doloremque ex. Nesciunt ipsa possimus veniam.', 'http://daniel.com/', '2005-07-10', '2017-06-19');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('38', 18, 38, 38, 'Qui nesciunt delectus exercitationem deserunt. Est et fugit maxime culpa autem facilis dolores. Cupiditate ut voluptatem voluptatem delectus deserunt quos assumenda animi. Eos consequatur quas odio aperiam ipsam voluptate. Corporis voluptatem autem qui enim architecto vero eos animi.', 'http://gleichnerkuhlman.biz/', '1976-09-01', '1983-06-20');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('39', 17, 39, 39, 'Nobis dolorum eum veniam iure consequatur. Consequatur labore aspernatur nesciunt amet nemo quia. Consequuntur dolores et nostrum sed. Officiis maiores aut aperiam pariatur et.', 'http://loweleuschke.biz/', '2007-12-02', '1992-09-20');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('40', 12, 40, 40, 'Veritatis harum ipsam perspiciatis. Nam quibusdam dolor fugiat iusto sed et. Perferendis minima asperiores aut quo et.', 'http://www.westfeest.com/', '2013-04-02', '1974-11-03');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('41', 1, 41, 41, 'Et nobis quis fugit laudantium. Minus aut voluptatem reiciendis aut corporis. Dolores voluptatem enim accusamus ducimus nulla quod.', 'http://www.bednarcummings.biz/', '1989-08-13', '1979-10-15');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('42', 5, 42, 42, 'Earum iure dolor doloribus molestias voluptas. Occaecati enim qui ab tempora aut. Rerum ea ipsam asperiores veniam culpa laudantium. Amet id enim voluptatem non et.', 'http://www.greengoodwin.com/', '1983-06-16', '2020-08-04');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('43', 7, 43, 43, 'Ut in culpa aliquam enim aut. Ab sapiente quam et in minima explicabo. Cum adipisci quasi consequatur est aut porro.', 'http://walterkessler.com/', '1990-12-29', '2003-01-19');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('44', 1, 44, 44, 'Officia perferendis animi aut et accusamus iure. Iusto qui id ipsa sit a ipsa at. Explicabo voluptatibus velit repellat nostrum.', 'http://www.schinner.com/', '2002-10-30', '2011-01-05');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('45', 12, 45, 45, 'Vel quibusdam omnis cumque et rerum. Ut optio vel sapiente sit rerum qui. Quis officiis eaque ab tempore doloremque nobis suscipit. Magnam quis officia ut dolorem nisi. At sit quisquam molestiae optio sunt.', 'http://www.kohler.net/', '1990-11-19', '2003-11-19');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('46', 11, 46, 46, 'Est vel aliquam magnam tempora repellendus quia labore. Magnam fugit aspernatur est ratione ipsum. Veniam enim qui velit consequatur animi asperiores. Quo sapiente quae est.', 'http://handcrona.net/', '2011-09-04', '1975-08-17');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('47', 13, 47, 47, 'Aperiam aut illo non ipsa magnam quas. Possimus ab id autem. Laborum eligendi porro perspiciatis dolores non eaque facere. At deleniti vero atque repellat sequi sunt consequuntur maiores.', 'http://erdman.com/', '2002-05-29', '2000-12-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('48', 10, 48, 48, 'Porro sed voluptas velit labore culpa consequuntur. Unde ipsa tempore ullam. Iste repellendus autem ipsam quia.', 'http://www.flatleystamm.com/', '1975-09-09', '1995-08-23');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('49', 14, 49, 49, 'Eaque qui explicabo aliquid sint. Reiciendis quia quod earum itaque cumque et. Sed adipisci debitis hic dolorem magni atque dolor.', 'http://kulas.com/', '2016-07-19', '2015-09-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('50', 17, 50, 50, 'Corporis est distinctio tempore laudantium dolores ad. Laudantium consequatur eius sed et aliquam. Quis accusamus libero cumque voluptatem corrupti.', 'http://reinger.biz/', '1978-03-09', '2015-02-15');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('51', 3, 51, 1, 'Quia est possimus sed. Qui quis quas et temporibus odio explicabo voluptates. Magnam numquam earum qui veritatis suscipit soluta magnam. Adipisci fuga debitis consequatur esse ullam.', 'http://jones.com/', '1981-02-23', '2006-02-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('52', 17, 52, 2, 'Omnis dignissimos eius impedit consequatur quos aut. Consectetur ad porro incidunt quisquam sit voluptate adipisci. Ducimus praesentium natus quos qui nobis iste voluptate. Veniam vel et fugit ad. Eius tempora omnis delectus accusamus.', 'http://effertz.com/', '1976-03-11', '1978-12-13');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('53', 18, 53, 3, 'Itaque laboriosam rem placeat ut quia provident veniam. Voluptatum tempora quasi dicta. Ut sed voluptatem alias quasi. Et in quaerat fugiat eius illo sunt.', 'http://kossschumm.com/', '1985-08-10', '2004-04-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('54', 3, 54, 4, 'Voluptas natus dolor ipsa in odio hic. In minus et labore voluptatum odit. Sapiente et consequatur impedit ullam commodi id illum. Aperiam qui autem aliquam ea aut porro quo laboriosam.', 'http://www.kunze.info/', '1981-11-01', '2001-05-25');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('55', 5, 55, 5, 'Placeat officia consequatur autem rerum tempora aut qui dolores. Sint harum dolorem harum saepe libero. Quis accusamus et ratione cumque pariatur ut tempora quaerat.', 'http://www.hane.com/', '1997-06-04', '1978-11-23');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('56', 20, 56, 6, 'Laborum natus qui reiciendis aliquam commodi. Et et rerum ea non temporibus qui non. Voluptatibus possimus sit est. Ea et autem in voluptate esse.', 'http://www.padbergbeahan.com/', '1987-12-30', '1982-07-04');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('57', 10, 57, 7, 'Facilis unde est est modi aut. Labore aperiam et voluptatem reiciendis ex omnis molestiae. Ducimus similique sit praesentium excepturi qui non. Quisquam laboriosam qui repellendus.', 'http://www.hauck.net/', '1994-04-11', '1995-08-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('58', 9, 58, 8, 'Officia ipsa similique ea recusandae quis odio alias iure. Omnis provident corrupti alias animi. Sint praesentium rerum rem consequatur blanditiis quia.', 'http://hoegerdouglas.com/', '2015-01-03', '2009-05-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('59', 19, 59, 9, 'Sed eveniet maxime voluptates amet in id perspiciatis. Nam et eum alias sint iusto at sunt. Voluptatem temporibus quidem et porro quod. Aperiam quia numquam neque corporis voluptas.', 'http://cummeratahowell.com/', '2005-03-22', '1975-08-03');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('60', 8, 60, 10, 'Sit ducimus dolor omnis corporis id mollitia facilis. Labore earum quas est nostrum sit. Error eos tenetur distinctio dolore. Et veniam ipsum in ad totam magnam totam.', 'http://www.jaskolski.com/', '2011-09-04', '2013-05-03');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('61', 11, 61, 11, 'Fugiat quisquam repellendus ea magnam natus. Ut perspiciatis est vero. Nesciunt voluptatem cupiditate repellendus iure eius commodi. Nam vel quo veritatis et consequatur magnam impedit. Dolor blanditiis sint voluptas sint aliquam id.', 'http://gibson.info/', '1975-12-09', '2005-11-05');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('62', 11, 62, 12, 'Distinctio qui et quasi minus placeat. Hic ipsa exercitationem qui totam porro illum. Eligendi veritatis quod natus eos quis.', 'http://senger.com/', '2011-06-12', '1977-02-13');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('63', 7, 63, 13, 'Dolores quia ipsum veniam eius earum dicta id. Tempore velit nihil vero repudiandae corrupti atque. Sed quidem impedit qui dolorem sit et sit.', 'http://www.brekke.biz/', '1975-08-31', '1998-06-23');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('64', 6, 64, 14, 'Quis omnis et porro occaecati eum qui. Atque eligendi fugiat ut autem. Est dolorem quidem et.', 'http://balistreri.com/', '1990-11-15', '2017-11-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('65', 16, 65, 15, 'Adipisci est eum quod maxime dolorem dolorem. Sunt asperiores velit accusantium perferendis praesentium eum. Accusantium ut temporibus sed tempora minima totam possimus deserunt.', 'http://www.becker.com/', '2021-11-07', '1970-03-26');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('66', 15, 66, 16, 'Eos hic nulla accusamus et illum optio. Inventore aspernatur est omnis. Nesciunt quas eius veniam et aut magnam.', 'http://romaguera.biz/', '1983-08-17', '2005-09-02');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('67', 3, 67, 17, 'Nostrum exercitationem beatae hic perferendis et tempora eligendi hic. Asperiores fugiat vitae quis quia beatae facere et molestias. Sit voluptatem similique excepturi qui est error.', 'http://daviscrona.com/', '1979-08-24', '1993-09-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('68', 16, 68, 18, 'Et suscipit est aspernatur minima aspernatur autem magni. Quia sapiente velit et consequuntur ipsam. Non nulla mollitia qui esse ea dicta. Quod est perferendis illum adipisci.', 'http://altenwerthdietrich.info/', '1970-09-16', '1977-05-29');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('69', 18, 69, 19, 'Aut commodi quis autem sint aut dolore consequatur. Autem illo excepturi adipisci velit ipsum expedita. Illo repellat adipisci et qui id.', 'http://www.kirlin.info/', '1993-03-23', '1998-06-30');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('70', 5, 70, 20, 'Commodi reiciendis quasi magnam id. Voluptatem repudiandae quos hic blanditiis. Laudantium recusandae placeat fugiat.', 'http://swiftlarson.com/', '2007-11-07', '1972-01-25');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('71', 9, 71, 21, 'Velit sint possimus deleniti molestiae ex voluptates. Dolorem in error blanditiis nihil fugiat ratione cupiditate. Consequatur mollitia sit optio est reprehenderit omnis. Voluptas provident numquam et labore cum quas.', 'http://www.torphyarmstrong.biz/', '1989-05-26', '1972-04-01');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('72', 6, 72, 22, 'Eos libero omnis nam odit fuga omnis enim. Beatae dignissimos qui natus consequatur nobis ab ex.', 'http://www.hills.org/', '1983-12-23', '2010-05-21');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('73', 5, 73, 23, 'Voluptatem excepturi officiis molestiae. In eos repudiandae officiis tempora. Sed libero sint id voluptatem.', 'http://www.cummerata.org/', '1995-09-09', '2003-12-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('74', 15, 74, 24, 'Sequi libero nihil perferendis natus libero. Dignissimos velit nostrum velit quo. Accusantium ab occaecati nihil dignissimos totam.', 'http://toy.com/', '2001-05-04', '1976-06-07');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('75', 15, 75, 25, 'Rem dolorem a quia nulla atque expedita occaecati. Excepturi voluptas nihil est placeat distinctio beatae voluptates magni. Illum exercitationem modi delectus aut itaque inventore.', 'http://hoppe.biz/', '1985-04-21', '2006-08-20');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('76', 16, 76, 26, 'Deleniti nam aspernatur quia velit praesentium distinctio maxime. Et dolorem enim velit porro. Delectus molestias perferendis quo odio praesentium facere. Dicta iure dolores officia quis et nulla cupiditate. Et quo animi culpa error ut.', 'http://wiza.org/', '1991-11-30', '1977-05-12');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('77', 16, 77, 27, 'Illo totam perferendis corrupti deleniti dolorem ex sequi. Pariatur eveniet sunt tempora vel. Repudiandae aut eligendi quasi perferendis. Quis natus provident velit quae eaque at.', 'http://gibson.com/', '1977-05-16', '1986-06-24');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('78', 14, 78, 28, 'Ad vero recusandae exercitationem quae nulla qui odio. Autem quia omnis reiciendis. Quo impedit fugiat expedita laudantium.', 'http://www.stark.biz/', '1985-10-08', '1990-09-28');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('79', 19, 79, 29, 'Et dolorem ut praesentium animi deleniti tenetur. Ratione inventore doloribus doloremque sed. Nam ipsam velit quaerat qui. Quisquam aut nobis minima incidunt provident sed esse.', 'http://www.stehrkovacek.com/', '1983-04-17', '2001-02-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('80', 4, 80, 30, 'Et nesciunt quia est commodi ea esse dolore quasi. Provident sed consequatur repellat eum.', 'http://wisoky.net/', '2014-01-21', '2002-02-13');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('81', 19, 81, 31, 'Sed quisquam quo dolores aut aliquid eaque rerum. Ut molestias error omnis eveniet neque est aliquid. Dolore et porro quia sint voluptas expedita deleniti.', 'http://collier.net/', '1986-07-05', '1978-09-17');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('82', 2, 82, 32, 'Beatae nisi omnis illum accusamus. Accusamus hic eos qui modi. Molestias repellat aperiam magnam veritatis.', 'http://flatleyrowe.com/', '1991-11-30', '2014-08-09');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('83', 20, 83, 33, 'Voluptatem expedita eius nobis et. Explicabo eum aut consectetur aliquid necessitatibus. Voluptatum eum culpa asperiores qui. Eos nemo tempora eos voluptas maxime dolores.', 'http://ryan.com/', '1987-05-24', '1985-10-15');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('84', 3, 84, 34, 'Dicta aperiam at veritatis facere totam neque et. Eos facilis et nobis non provident architecto molestiae minima. Sit et nemo odit id facilis.', 'http://www.zieme.com/', '1996-01-10', '1998-06-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('85', 4, 85, 35, 'Quaerat deserunt dignissimos neque ex atque et quisquam quae. Voluptate explicabo sint assumenda. Dolorem rerum nam placeat ut consequatur est. Rerum ab rerum quia dolores.', 'http://www.hartmann.com/', '1971-11-21', '1989-01-11');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('86', 8, 86, 36, 'Cum perspiciatis dolores assumenda eos. Nemo tempora consequatur tempora. Ut ratione ipsam nobis aut.', 'http://www.satterfieldbechtelar.info/', '1996-06-12', '1988-08-26');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('87', 4, 87, 37, 'Eum accusantium ut et et. Architecto qui at ut molestias et magnam fugiat iste. Cupiditate praesentium qui atque delectus dolore.', 'http://www.daniel.org/', '1985-10-06', '1976-01-23');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('88', 11, 88, 38, 'Est fugiat quaerat architecto omnis. Unde rerum earum voluptatem dolores aut. Dolores quae veniam officiis omnis. Provident aut itaque voluptas molestiae corrupti.', 'http://quitzonkassulke.net/', '1974-04-14', '1985-06-29');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('89', 17, 89, 39, 'Vitae et exercitationem quidem non qui sit. Ut beatae non quasi et officia. Ratione deleniti voluptas dolorem tempora est quis.', 'http://durganledner.biz/', '1985-01-16', '1996-04-04');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('90', 5, 90, 40, 'Illo tempore quia omnis temporibus autem ducimus. Non voluptatem rerum sint reiciendis deleniti. Beatae ex error voluptates aperiam ratione nihil. Harum et est hic amet rem ut dolores voluptatem. Et maiores dolor et eius itaque ipsum error ea.', 'http://www.hirthe.com/', '2006-01-13', '1988-07-03');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('91', 19, 91, 41, 'Rerum officiis nisi rerum esse veritatis blanditiis. Et ut ullam numquam doloribus enim sequi. Dolorem consequatur assumenda qui officia id iusto cumque nulla.', 'http://boyle.net/', '2005-01-20', '1981-12-21');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('92', 8, 92, 42, 'Voluptatem debitis dolores omnis quos ducimus voluptas perspiciatis. Explicabo qui eveniet sint eius ad qui unde. Est debitis ipsam aperiam ut.', 'http://effertz.net/', '1971-08-26', '1995-08-22');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('93', 17, 93, 43, 'Dolore beatae accusamus ratione. Quia voluptas et ut fugit. Quisquam et eveniet iusto velit. Minus molestiae saepe repellat quidem.', 'http://www.fisher.com/', '2002-01-06', '2016-05-13');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('94', 2, 94, 44, 'Veniam nulla reiciendis voluptas minus. Explicabo non tenetur pariatur et voluptatem voluptas facere. Fugit quos at laborum fugiat voluptatum aut. Sed ipsam harum sint molestiae molestiae dolorem illo rerum.', 'http://www.jacobs.info/', '1987-12-09', '1984-08-18');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('95', 7, 95, 45, 'Et eos amet voluptas quod dolorem recusandae accusamus consequatur. Explicabo repudiandae provident magni natus. Non mollitia quo voluptate at odio veniam.', 'http://www.schimmelmiller.biz/', '1987-06-27', '2004-11-18');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('96', 18, 96, 46, 'Qui dolores ducimus temporibus perspiciatis et. Recusandae dolorem rerum aspernatur est velit quo. Sit delectus molestiae numquam eius ut esse.', 'http://www.sipes.net/', '1987-07-11', '1996-11-21');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('97', 3, 97, 47, 'Non sed ex ut et quasi at facilis. Optio quasi quo natus perspiciatis minima et occaecati molestiae. A et qui dolor pariatur qui ut est.', 'http://hintz.info/', '2008-06-21', '1987-10-12');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('98', 18, 98, 48, 'Earum deserunt et dolores adipisci. Atque velit libero nihil quasi maiores nobis quos. Qui et corrupti sed voluptatem rem molestiae nam.', 'http://cartwrightwilkinson.com/', '1983-09-03', '1986-08-27');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('99', 20, 99, 49, 'Earum dolor minus quia aliquam. Qui ipsum consequatur quam. Veritatis veniam distinctio molestiae necessitatibus mollitia et reprehenderit.', 'http://www.mckenzie.com/', '2021-01-21', '2004-06-19');
INSERT INTO approved_tests (id, lab_id, system_id, standard_id, comments, url, issued_at, expires_at) VALUES ('100', 13, 100, 50, 'Deserunt temporibus totam perspiciatis voluptatem molestiae ipsum assumenda. Voluptatum delectus est dolor explicabo nesciunt mollitia voluptatem. Qui rerum ipsam cum illum rerum perspiciatis. Voluptatem eum consequatur iusto odio tempora.', 'http://yundtrowe.org/', '2018-12-11', '2000-12-27');



INSERT INTO binders (id, name) VALUES ('1', 'epoxy');
INSERT INTO binders (id, name) VALUES ('2', 'ESI');
INSERT INTO binders (id, name) VALUES ('3', 'polyurethane');
INSERT INTO binders (id, name) VALUES ('4', 'alkyd');
INSERT INTO binders (id, name) VALUES ('5', 'acrilycs');
INSERT INTO binders (id, name) VALUES ('6', 'phenol-epoxy');
INSERT INTO binders (id, name) VALUES ('7', 'amide epoxy');
INSERT INTO binders (id, name) VALUES ('8', 'polysiloxane');
INSERT INTO binders (id, name) VALUES ('9', 'anti-fouling');
INSERT INTO binders (id, name) VALUES ('10', 'matrix');


INSERT INTO brands (id, name) VALUES ('1', 'Schumm-Dibbert');
INSERT INTO brands (id, name) VALUES ('2', 'Donnelly-Crist');
INSERT INTO brands (id, name) VALUES ('3', 'Swaniawski-Predovic');
INSERT INTO brands (id, name) VALUES ('4', 'Kris-Luettgen');
INSERT INTO brands (id, name) VALUES ('5', 'Aufderhar Group');
INSERT INTO brands (id, name) VALUES ('6', 'Cole and Sons');
INSERT INTO brands (id, name) VALUES ('7', 'Steuber Group');
INSERT INTO brands (id, name) VALUES ('8', 'Hagenes-Connell');
INSERT INTO brands (id, name) VALUES ('9', 'Weimann, Bashirian and Anderson');
INSERT INTO brands (id, name) VALUES ('10', 'Sipes, Howell and Grady');
INSERT INTO brands (id, name) VALUES ('11', 'Davis, Kilback and Balistreri');
INSERT INTO brands (id, name) VALUES ('12', 'Morar Inc');
INSERT INTO brands (id, name) VALUES ('13', 'Mante, Gerlach and Kshlerin');
INSERT INTO brands (id, name) VALUES ('14', 'Feest, Watsica and Tremblay');
INSERT INTO brands (id, name) VALUES ('15', 'Emard, Casper and Stokes');


INSERT INTO catalogs (id, name) VALUES ('1', 'protective');
INSERT INTO catalogs (id, name) VALUES ('2', 'marine');
INSERT INTO catalogs (id, name) VALUES ('3', 'industrial');
INSERT INTO catalogs (id, name) VALUES ('4', 'architect');
INSERT INTO catalogs (id, name) VALUES ('5', 'coil');

INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('1', 29, 224, 54, 211, 75, 222);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('2', 14, 186, 51, 231, 66, 182);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('3', 9, 134, 36, 84, 80, 73);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('4', 4, 192, 48, 80, 61, 91);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('5', 30, 198, 53, 107, 61, 113);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('6', 14, 73, 44, 71, 81, 211);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('7', 7, 133, 35, 117, 79, 235);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('8', 5, 219, 34, 146, 64, 172);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('9', 30, 183, 31, 176, 77, 138);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('10', 23, 142, 49, 75, 85, 178);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('11', 8, 247, 31, 155, 87, 132);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('12', 12, 78, 35, 151, 63, 237);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('13', 21, 207, 31, 238, 84, 124);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('14', 1, 165, 52, 250, 62, 170);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('15', 18, 249, 53, 146, 80, 146);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('16', 10, 232, 37, 52, 92, 171);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('17', 12, 82, 58, 139, 87, 144);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('18', 7, 91, 60, 173, 80, 245);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('19', 19, 55, 50, 63, 66, 166);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('20', 26, 132, 37, 136, 80, 221);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('21', 22, 163, 46, 63, 78, 51);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('22', 24, 67, 59, 194, 89, 76);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('23', 15, 155, 51, 180, 77, 65);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('24', 8, 190, 60, 196, 64, 229);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('25', 3, 154, 59, 94, 64, 87);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('26', 30, 177, 43, 165, 99, 248);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('27', 20, 226, 50, 90, 96, 150);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('28', 19, 189, 37, 100, 92, 248);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('29', 1, 249, 56, 231, 98, 226);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('30', 9, 217, 34, 209, 96, 249);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('31', 4, 191, 49, 111, 95, 123);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('32', 27, 227, 49, 247, 98, 203);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('33', 2, 155, 55, 155, 83, 154);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('34', 28, 56, 56, 227, 92, 160);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('35', 23, 168, 32, 223, 66, 223);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('36', 21, 173, 42, 249, 76, 124);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('37', 1, 179, 36, 116, 76, 163);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('38', 25, 80, 56, 106, 88, 64);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('39', 5, 250, 57, 93, 71, 127);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('40', 14, 202, 42, 113, 66, 73);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('41', 20, 133, 60, 71, 97, 106);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('42', 28, 183, 53, 65, 83, 223);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('43', 5, 111, 39, 111, 64, 237);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('44', 30, 170, 49, 198, 69, 185);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('45', 10, 60, 52, 210, 86, 81);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('46', 10, 187, 60, 231, 91, 140);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('47', 11, 237, 44, 144, 82, 64);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('48', 2, 84, 43, 105, 84, 223);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('49', 24, 82, 57, 142, 93, 167);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('50', 12, 193, 35, 199, 100, 177);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('51', 8, 167, 49, 164, 76, 123);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('52', 2, 114, 56, 131, 98, 125);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('53', 1, 247, 35, 84, 89, 97);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('54', 7, 160, 59, 214, 98, 183);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('55', 9, 158, 42, 85, 92, 59);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('56', 26, 231, 60, 93, 87, 188);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('57', 6, 136, 55, 105, 63, 56);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('58', 2, 152, 59, 85, 91, 84);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('59', 25, 247, 49, 55, 68, 51);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('60', 30, 190, 54, 50, 93, 100);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('61', 16, 207, 39, 181, 75, 108);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('62', 17, 102, 33, 194, 71, 179);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('63', 12, 242, 40, 140, 78, 179);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('64', 28, 233, 31, 144, 84, 243);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('65', 25, 192, 37, 245, 93, 101);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('66', 12, 135, 31, 158, 70, 138);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('67', 20, 50, 56, 228, 66, 62);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('68', 4, 179, 50, 144, 72, 161);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('69', 14, 233, 31, 189, 94, 107);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('70', 24, 50, 37, 155, 65, 155);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('71', 28, 249, 43, 53, 86, 69);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('72', 4, 51, 33, 97, 100, 79);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('73', 18, 107, 51, 76, 83, 244);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('74', 7, 199, 50, 250, 83, 103);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('75', 27, 101, 35, 214, 79, 244);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('76', 30, 244, 39, 174, 85, 112);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('77', 13, 236, 48, 248, 92, 172);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('78', 26, 208, 36, 168, 83, 232);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('79', 14, 89, 49, 137, 84, 98);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('80', 17, 74, 49, 78, 78, 199);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('81', 16, 138, 34, 228, 91, 158);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('82', 26, 138, 50, 240, 84, 87);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('83', 16, 175, 48, 174, 94, 207);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('84', 6, 128, 39, 121, 84, 55);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('85', 12, 97, 34, 152, 80, 129);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('86', 26, 238, 32, 136, 90, 89);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('87', 15, 214, 43, 178, 82, 87);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('88', 24, 54, 34, 83, 91, 189);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('89', 17, 250, 42, 236, 96, 192);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('90', 2, 60, 34, 104, 71, 171);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('91', 17, 181, 38, 143, 78, 57);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('92', 10, 242, 50, 230, 74, 108);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('93', 16, 57, 51, 52, 80, 119);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('94', 10, 144, 41, 73, 69, 78);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('95', 16, 147, 51, 130, 94, 215);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('96', 1, 122, 41, 170, 61, 162);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('97', 23, 160, 31, 164, 99, 174);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('98', 5, 184, 33, 74, 97, 54);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('99', 10, 202, 40, 59, 62, 200);
INSERT INTO coating_systems (id, primer_id, primer_dft, intermediate_id, intermediate_dft, finish_id, finish_dft) VALUES ('100', 12, 239, 50, 209, 98, 219);



INSERT INTO contractors (id, name) VALUES ('1', 'Bergstrom-Blick');
INSERT INTO contractors (id, name) VALUES ('2', 'Raynor-Trantow');
INSERT INTO contractors (id, name) VALUES ('3', 'Hackett LLC');
INSERT INTO contractors (id, name) VALUES ('4', 'Bauch, Pfeffer and Beer');
INSERT INTO contractors (id, name) VALUES ('5', 'Littel and Sons');
INSERT INTO contractors (id, name) VALUES ('6', 'Lakin-Pfannerstill');
INSERT INTO contractors (id, name) VALUES ('7', 'Mann PLC');
INSERT INTO contractors (id, name) VALUES ('8', 'Hammes-Schowalter');
INSERT INTO contractors (id, name) VALUES ('9', 'Beahan, Lehner and Balistreri');
INSERT INTO contractors (id, name) VALUES ('10', 'Weissnat LLC');
INSERT INTO contractors (id, name) VALUES ('11', 'Schultz, Jakubowski and Lang');
INSERT INTO contractors (id, name) VALUES ('12', 'Rodriguez LLC');
INSERT INTO contractors (id, name) VALUES ('13', 'Weimann PLC');
INSERT INTO contractors (id, name) VALUES ('14', 'Osinski and Sons');
INSERT INTO contractors (id, name) VALUES ('15', 'Kirlin, Pfeffer and Sauer');
INSERT INTO contractors (id, name) VALUES ('16', 'Kirlin, Greenfelder and Powlowski');
INSERT INTO contractors (id, name) VALUES ('17', 'Gorczany-Casper');
INSERT INTO contractors (id, name) VALUES ('18', 'Connelly-Mertz');
INSERT INTO contractors (id, name) VALUES ('19', 'Bradtke, Baumbach and Wisoky');
INSERT INTO contractors (id, name) VALUES ('20', 'Bailey-Corkery');
INSERT INTO contractors (id, name) VALUES ('21', 'Medhurst-Hirthe');
INSERT INTO contractors (id, name) VALUES ('22', 'Swaniawski, Weimann and Corkery');
INSERT INTO contractors (id, name) VALUES ('23', 'Koss-Wintheiser');
INSERT INTO contractors (id, name) VALUES ('24', 'Schmeler, Stroman and Padberg');
INSERT INTO contractors (id, name) VALUES ('25', 'Osinski, Hackett and Stark');
INSERT INTO contractors (id, name) VALUES ('26', 'Hammes Ltd');
INSERT INTO contractors (id, name) VALUES ('27', 'Kreiger Group');
INSERT INTO contractors (id, name) VALUES ('28', 'Schiller and Sons');
INSERT INTO contractors (id, name) VALUES ('29', 'Langworth and Sons');
INSERT INTO contractors (id, name) VALUES ('30', 'McGlynn and Sons');
INSERT INTO contractors (id, name) VALUES ('31', 'Kris-Bins');
INSERT INTO contractors (id, name) VALUES ('32', 'Champlin-Leuschke');
INSERT INTO contractors (id, name) VALUES ('33', 'Legros, Roob and Ledner');
INSERT INTO contractors (id, name) VALUES ('34', 'Smith, Hettinger and Schaden');
INSERT INTO contractors (id, name) VALUES ('35', 'OReilly, Upton and Durgan');
INSERT INTO contractors (id, name) VALUES ('36', 'Johnson Ltd');
INSERT INTO contractors (id, name) VALUES ('37', 'Greenholt Inc');
INSERT INTO contractors (id, name) VALUES ('38', 'Steuber-Pfeffer');
INSERT INTO contractors (id, name) VALUES ('39', 'Ullrich Inc');
INSERT INTO contractors (id, name) VALUES ('40', 'Turcotte, Shanahan and Hara');
INSERT INTO contractors (id, name) VALUES ('41', 'Kozey Group');
INSERT INTO contractors (id, name) VALUES ('42', 'Pollich, Green and Watsica');
INSERT INTO contractors (id, name) VALUES ('43', 'Paucek, Bogisich and Morissette');
INSERT INTO contractors (id, name) VALUES ('44', 'Mohr, Yundt and Sauer');
INSERT INTO contractors (id, name) VALUES ('45', 'Adams Inc');
INSERT INTO contractors (id, name) VALUES ('46', 'Legros LLC');
INSERT INTO contractors (id, name) VALUES ('47', 'Zieme, Bayer and Champlin');
INSERT INTO contractors (id, name) VALUES ('48', 'Considine and Sons');
INSERT INTO contractors (id, name) VALUES ('49', 'Senger LLC');
INSERT INTO contractors (id, name) VALUES ('50', 'McCullough-Schumm');



INSERT INTO customers (id, name) VALUES ('1', 'Kertzmann, Stiedemann and Vandervort');
INSERT INTO customers (id, name) VALUES ('2', 'Brown, Vandervort and Larkin');
INSERT INTO customers (id, name) VALUES ('3', 'Towne, Torp and Pagac');
INSERT INTO customers (id, name) VALUES ('4', 'Schumm Inc');
INSERT INTO customers (id, name) VALUES ('5', 'Sipes Group');
INSERT INTO customers (id, name) VALUES ('6', 'Kessler-Bradtke');
INSERT INTO customers (id, name) VALUES ('7', 'Dach-Breitenberg');
INSERT INTO customers (id, name) VALUES ('8', 'Howe, Koelpin and Dibbert');
INSERT INTO customers (id, name) VALUES ('9', 'Marquardt Ltd');
INSERT INTO customers (id, name) VALUES ('10', 'Cassin, Muller and Aufderhar');
INSERT INTO customers (id, name) VALUES ('11', 'Renner-Nikolaus');
INSERT INTO customers (id, name) VALUES ('12', 'Koelpin PLC');
INSERT INTO customers (id, name) VALUES ('13', 'Gibson-Stokes');
INSERT INTO customers (id, name) VALUES ('14', 'Jakubowski-Mann');
INSERT INTO customers (id, name) VALUES ('15', 'Swaniawski, Boyle and Von');
INSERT INTO customers (id, name) VALUES ('16', 'Reichel Group');
INSERT INTO customers (id, name) VALUES ('17', 'Kiehn-Rath');
INSERT INTO customers (id, name) VALUES ('18', 'Friesen-Quitzon');
INSERT INTO customers (id, name) VALUES ('19', 'Batz-Gerlach');
INSERT INTO customers (id, name) VALUES ('20', 'West, Leuschke and Little');
INSERT INTO customers (id, name) VALUES ('21', 'Waters Group');
INSERT INTO customers (id, name) VALUES ('22', 'Metz LLC');
INSERT INTO customers (id, name) VALUES ('23', 'Friesen, Dietrich and Haag');
INSERT INTO customers (id, name) VALUES ('24', 'Haley, Von and Jacobs');
INSERT INTO customers (id, name) VALUES ('25', 'Beahan Ltd');
INSERT INTO customers (id, name) VALUES ('26', 'Goodwin-Barton');
INSERT INTO customers (id, name) VALUES ('27', 'Hodkiewicz-Pagac');
INSERT INTO customers (id, name) VALUES ('28', 'Parisian Group');
INSERT INTO customers (id, name) VALUES ('29', 'Feeney, Nitzsche and Bosco');
INSERT INTO customers (id, name) VALUES ('30', 'Bauch, Homenick and Quigley');
INSERT INTO customers (id, name) VALUES ('31', 'Mraz-Thiel');
INSERT INTO customers (id, name) VALUES ('32', 'Cremin, Keebler and Wuckert');
INSERT INTO customers (id, name) VALUES ('33', 'Ferry-Price');
INSERT INTO customers (id, name) VALUES ('34', 'Nitzsche-Jerde');
INSERT INTO customers (id, name) VALUES ('35', 'Eichmann, Gislason and Cronin');
INSERT INTO customers (id, name) VALUES ('36', 'Russel, Kohler and Okuneva');
INSERT INTO customers (id, name) VALUES ('37', 'Lubowitz Group');
INSERT INTO customers (id, name) VALUES ('38', 'Satterfield-Vandervort');
INSERT INTO customers (id, name) VALUES ('39', 'Cole and Sons');
INSERT INTO customers (id, name) VALUES ('40', 'Gleason-Lakin');
INSERT INTO customers (id, name) VALUES ('41', 'Waters-Blanda');
INSERT INTO customers (id, name) VALUES ('42', 'Heidenreich, Walker and Ruecker');
INSERT INTO customers (id, name) VALUES ('43', 'Bosco, Kassulke and Runolfsdottir');
INSERT INTO customers (id, name) VALUES ('44', 'Ferry Inc');
INSERT INTO customers (id, name) VALUES ('45', 'Wuckert, Hessel and Veum');
INSERT INTO customers (id, name) VALUES ('46', 'Keeling-Hammes');
INSERT INTO customers (id, name) VALUES ('47', 'Kirlin Ltd');
INSERT INTO customers (id, name) VALUES ('48', 'DuBuque-Collins');
INSERT INTO customers (id, name) VALUES ('49', 'Leuschke-Satterfield');
INSERT INTO customers (id, name) VALUES ('50', 'Bradtke, Bins and Bartoletti');
INSERT INTO customers (id, name) VALUES ('51', 'Hauck, Roob and Beahan');
INSERT INTO customers (id, name) VALUES ('52', 'Mueller, Lubowitz and Cummerata');
INSERT INTO customers (id, name) VALUES ('53', 'Rath, Hahn and Rath');
INSERT INTO customers (id, name) VALUES ('54', 'Krajcik, Grimes and Fay');
INSERT INTO customers (id, name) VALUES ('55', 'Sawayn, Baumbach and Schultz');
INSERT INTO customers (id, name) VALUES ('56', 'Okuneva LLC');
INSERT INTO customers (id, name) VALUES ('57', 'Braun-Hansen');
INSERT INTO customers (id, name) VALUES ('58', 'Lockman, Klocko and Daniel');
INSERT INTO customers (id, name) VALUES ('59', 'Bailey, Kemmer and Ruecker');
INSERT INTO customers (id, name) VALUES ('60', 'Larkin-Auer');
INSERT INTO customers (id, name) VALUES ('61', 'Torp LLC');
INSERT INTO customers (id, name) VALUES ('62', 'Davis, Blanda and Quigley');
INSERT INTO customers (id, name) VALUES ('63', 'Sanford, Hudson and Dooley');
INSERT INTO customers (id, name) VALUES ('64', 'Mertz, Reichert and Dicki');
INSERT INTO customers (id, name) VALUES ('65', 'Beier Ltd');
INSERT INTO customers (id, name) VALUES ('66', 'Padberg, Cole and Kuhic');
INSERT INTO customers (id, name) VALUES ('67', 'McDermott-Moen');
INSERT INTO customers (id, name) VALUES ('68', 'Ferry-Parker');
INSERT INTO customers (id, name) VALUES ('69', 'Koch, Hilpert and Lang');
INSERT INTO customers (id, name) VALUES ('70', 'Armstrong and Sons');
INSERT INTO customers (id, name) VALUES ('71', 'Effertz-Klein');
INSERT INTO customers (id, name) VALUES ('72', 'Beier, Volkman and Considine');
INSERT INTO customers (id, name) VALUES ('73', 'Fisher, Kulas and Hara');
INSERT INTO customers (id, name) VALUES ('74', 'Herman-Weber');
INSERT INTO customers (id, name) VALUES ('75', 'Hintz LLC');
INSERT INTO customers (id, name) VALUES ('76', 'Hilpert-Doyle');
INSERT INTO customers (id, name) VALUES ('77', 'Jaskolski-Bogan');
INSERT INTO customers (id, name) VALUES ('78', 'Jast, Morissette and Corwin');
INSERT INTO customers (id, name) VALUES ('79', 'Spencer, Wunsch and Kassulke');
INSERT INTO customers (id, name) VALUES ('80', 'Schowalter, Conner and Cormier');
INSERT INTO customers (id, name) VALUES ('81', 'Hand, Labadie and Corwin');
INSERT INTO customers (id, name) VALUES ('82', 'Torphy-Kuhn');
INSERT INTO customers (id, name) VALUES ('83', 'Johnston and Sons');
INSERT INTO customers (id, name) VALUES ('84', 'Schinner LLC');
INSERT INTO customers (id, name) VALUES ('85', 'Shields-Hilll');
INSERT INTO customers (id, name) VALUES ('86', 'Gutmann and Sons');
INSERT INTO customers (id, name) VALUES ('87', 'Towne, Bosco and Kuhlman');
INSERT INTO customers (id, name) VALUES ('88', 'Balistreri Inc');
INSERT INTO customers (id, name) VALUES ('89', 'Pouros-Ruecker');
INSERT INTO customers (id, name) VALUES ('90', 'Rice, Wisozk and Reichel');
INSERT INTO customers (id, name) VALUES ('91', 'Goldner, Mohr and Prohaska');
INSERT INTO customers (id, name) VALUES ('92', 'Beer, Feeney and Moore');
INSERT INTO customers (id, name) VALUES ('93', 'Johns-Towne');
INSERT INTO customers (id, name) VALUES ('94', 'Kub-Mitchell');
INSERT INTO customers (id, name) VALUES ('95', 'Hermann PLC');
INSERT INTO customers (id, name) VALUES ('96', 'Hickle PLC');
INSERT INTO customers (id, name) VALUES ('97', 'Carroll, Kemmer and Williamson');
INSERT INTO customers (id, name) VALUES ('98', 'Medhurst-Smith');
INSERT INTO customers (id, name) VALUES ('99', 'Runte-Goldner');
INSERT INTO customers (id, name) VALUES ('100', 'Greenfelder Ltd');


INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (1, 1, 59, 195, '1', 4, 50, '1993-09-22', '1992-11-20');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (2, 2, 60, 161, '2', -4, 41, '2013-03-15', '2019-01-16');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (3, 3, 76, 217, '0', 10, 40, '1980-12-22', '2015-09-30');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (4, 4, 73, 110, '0', 7, 56, '1996-07-29', '1981-11-06');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (5, 5, 42, 171, '3', 4, 43, '1985-11-10', '1984-05-04');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (6, 6, 90, 219, '3', 5, 49, '2005-05-26', '1994-07-15');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (7, 7, 81, 176, '3', -2, 48, '1990-10-30', '2001-10-02');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (8, 8, 62, 192, '0', 5, 51, '1996-04-01', '2017-11-20');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (9, 9, 96, 145, '0', 6, 55, '2013-09-07', '2017-09-21');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (10, 10, 62, 77, '0', 1, 59, '1983-03-26', '2013-09-16');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (11, 1, 79, 57, '2', 6, 44, '1994-08-03', '1981-08-11');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (12, 2, 61, 234, '0', -9, 59, '1971-12-22', '2007-01-26');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (13, 3, 94, 99, '1', -10, 47, '1985-09-16', '1982-11-17');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (14, 4, 38, 213, '2', -1, 49, '2011-08-08', '1997-12-18');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (15, 5, 51, 226, '2', -10, 47, '1982-02-13', '2016-10-03');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (16, 6, 75, 95, '0', -10, 53, '1997-05-05', '1986-04-26');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (17, 7, 86, 98, '0', 0, 58, '2010-08-10', '1971-08-09');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (18, 8, 86, 154, '1', 2, 59, '2016-04-20', '2017-04-11');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (19, 9, 59, 146, '1', -2, 49, '2007-01-07', '1981-07-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (20, 10, 52, 199, '2', 10, 57, '2015-03-21', '2021-07-28');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (21, 1, 66, 143, '3', -5, 52, '2004-10-13', '2011-11-30');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (22, 2, 64, 62, '0', 9, 57, '1988-07-28', '2013-02-05');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (23, 3, 98, 97, '0', 9, 49, '1976-12-30', '1995-04-19');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (24, 4, 64, 159, '2', -8, 42, '1979-05-22', '2016-01-31');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (25, 5, 94, 217, '2', 6, 57, '2000-02-05', '1999-09-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (26, 6, 47, 97, '2', -6, 53, '2021-01-26', '1996-05-25');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (27, 7, 79, 107, '1', -3, 60, '2006-10-26', '1984-03-24');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (28, 8, 42, 213, '1', 2, 43, '2007-08-16', '2002-05-17');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (29, 9, 83, 62, '0', 8, 49, '1975-10-27', '1983-12-06');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (30, 10, 59, 136, '3', -8, 55, '1985-10-20', '1988-03-18');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (31, 1, 41, 72, '3', 7, 44, '1984-02-25', '2000-04-03');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (32, 2, 68, 153, '0', -6, 52, '2002-12-17', '1984-01-29');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (33, 3, 89, 206, '0', 4, 41, '1972-12-19', '1984-06-23');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (34, 4, 58, 64, '0', 7, 43, '2013-04-08', '1977-05-18');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (35, 5, 86, 215, '2', -10, 47, '2011-06-24', '2001-10-28');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (36, 6, 51, 170, '1', 10, 55, '1998-09-13', '2002-04-11');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (37, 7, 58, 86, '1', -6, 49, '2013-03-02', '1996-10-04');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (38, 8, 69, 137, '3', 0, 53, '1983-07-20', '2003-11-13');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (39, 9, 99, 161, '1', -1, 55, '1977-03-08', '1977-06-25');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (40, 10, 62, 128, '2', 10, 41, '2007-05-14', '1974-11-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (41, 1, 100, 107, '3', 9, 49, '1996-08-11', '1989-02-14');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (42, 2, 81, 104, '3', 7, 44, '2002-04-22', '1991-01-29');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (43, 3, 57, 74, '1', -6, 45, '1985-05-07', '1992-03-07');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (44, 4, 74, 63, '3', 6, 51, '1987-10-26', '1995-01-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (45, 5, 78, 100, '0', -7, 52, '2007-10-06', '2005-10-07');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (46, 6, 36, 143, '0', 1, 60, '1970-04-22', '1970-01-05');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (47, 7, 50, 121, '3', -1, 49, '1989-01-24', '1979-10-06');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (48, 8, 67, 217, '2', -9, 44, '2011-07-21', '1999-12-23');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (49, 9, 53, 207, '3', 5, 43, '2003-09-10', '2007-10-13');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (50, 10, 55, 74, '0', 7, 60, '2007-05-16', '2000-06-20');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (51, 1, 93, 207, '3', 2, 47, '1987-10-20', '2003-05-09');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (52, 2, 83, 119, '1', -4, 53, '2015-11-11', '1975-01-16');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (53, 3, 41, 151, '2', -8, 51, '1985-01-11', '2017-08-08');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (54, 4, 63, 84, '0', 1, 50, '2006-06-27', '2005-04-24');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (55, 5, 52, 73, '1', 9, 49, '2014-01-03', '2016-01-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (56, 6, 52, 118, '2', -9, 45, '1978-09-10', '1978-05-26');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (57, 7, 82, 212, '3', 10, 49, '2007-09-29', '1971-03-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (58, 8, 37, 200, '3', 7, 53, '1977-02-28', '1982-12-29');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (59, 9, 37, 67, '1', 5, 43, '1995-01-29', '1972-11-26');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (60, 10, 56, 193, '1', 8, 59, '1991-07-04', '1971-03-14');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (61, 1, 91, 84, '3', -10, 50, '2003-04-09', '2005-06-11');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (62, 2, 93, 109, '1', -9, 60, '1980-07-29', '2007-02-05');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (63, 3, 84, 228, '3', -9, 47, '2014-05-24', '1970-02-24');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (64, 4, 95, 229, '2', -6, 59, '1992-07-12', '2006-12-17');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (65, 5, 77, 140, '0', 0, 40, '1981-12-13', '2000-03-01');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (66, 6, 35, 243, '1', 1, 58, '1979-01-12', '2021-08-05');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (67, 7, 64, 225, '3', 5, 45, '1989-06-10', '1974-01-13');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (68, 8, 88, 126, '0', 1, 51, '2007-01-21', '1987-02-09');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (69, 9, 59, 201, '1', 3, 52, '2016-10-18', '1989-10-26');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (70, 10, 88, 151, '2', -7, 48, '1975-06-27', '2003-07-30');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (71, 1, 52, 162, '3', 0, 53, '1983-07-09', '1994-08-12');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (72, 2, 78, 175, '1', -9, 48, '1988-10-15', '2019-08-19');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (73, 3, 54, 165, '0', 10, 56, '2010-10-10', '1982-02-10');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (74, 4, 54, 147, '3', -1, 46, '1982-02-22', '1984-12-09');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (75, 5, 80, 144, '1', 0, 42, '2016-03-18', '1991-04-25');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (76, 6, 59, 96, '0', -4, 58, '2010-12-10', '1988-10-22');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (77, 7, 95, 73, '0', -1, 49, '1996-08-09', '2004-04-08');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (78, 8, 47, 199, '3', -1, 41, '1976-11-29', '1978-09-28');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (79, 9, 48, 238, '3', -10, 56, '1992-07-17', '1985-01-19');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (80, 10, 40, 139, '1', 8, 48, '1989-07-08', '2014-08-18');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (81, 1, 52, 95, '2', 10, 48, '1996-10-02', '2000-04-09');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (82, 2, 99, 78, '3', 0, 47, '1981-12-29', '1993-05-22');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (83, 3, 58, 189, '2', -5, 40, '2009-12-29', '1989-04-01');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (84, 4, 73, 141, '3', -7, 42, '2011-03-24', '1997-07-01');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (85, 5, 91, 180, '1', 6, 46, '1975-12-23', '2019-03-02');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (86, 6, 67, 192, '0', -10, 53, '1991-11-10', '1980-06-01');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (87, 7, 46, 223, '0', -5, 53, '2004-02-10', '1974-06-14');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (88, 8, 91, 128, '1', 8, 58, '1991-06-12', '1976-09-24');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (89, 9, 40, 96, '0', 5, 59, '1976-09-12', '2000-07-07');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (90, 10, 97, 220, '0', 6, 60, '1970-11-02', '2005-07-05');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (91, 1, 80, 241, '3', 10, 60, '1973-07-24', '2017-04-27');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (92, 2, 53, 161, '3', -1, 41, '2021-08-31', '2020-04-06');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (93, 3, 53, 98, '2', -3, 46, '1974-04-21', '1997-10-22');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (94, 4, 77, 74, '2', -1, 50, '2018-10-26', '1995-01-30');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (95, 5, 91, 180, '2', 8, 49, '2000-03-31', '1986-08-31');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (96, 6, 95, 156, '2', -4, 52, '1988-02-29', '2017-03-19');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (97, 7, 68, 212, '1', -5, 43, '1980-11-25', '2010-04-22');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (98, 8, 57, 53, '1', 10, 42, '1992-06-20', '2012-07-15');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (99, 9, 81, 143, '2', -8, 53, '1970-10-13', '2021-08-14');
INSERT INTO main_technical_data (product_id, binder_id, volume_solid, standard_dft, dry_to_touch, min_temp, max_temp, created_at, updated_at) VALUES (100, 10, 61, 237, '1', -7, 56, '1987-04-23', '1977-03-31');


INSERT INTO pds (product_id, url) VALUES (22, 'http://bailey.org/');
INSERT INTO pds (product_id, url) VALUES (64, 'http://beahanreilly.info/');
INSERT INTO pds (product_id, url) VALUES (83, 'http://brekkepagac.com/');
INSERT INTO pds (product_id, url) VALUES (35, 'http://connellyolson.com/');
INSERT INTO pds (product_id, url) VALUES (81, 'http://cormier.org/');
INSERT INTO pds (product_id, url) VALUES (51, 'http://dicki.com/');
INSERT INTO pds (product_id, url) VALUES (68, 'http://ebert.net/');
INSERT INTO pds (product_id, url) VALUES (4, 'http://ferry.com/');
INSERT INTO pds (product_id, url) VALUES (1, 'http://flatley.net/');
INSERT INTO pds (product_id, url) VALUES (72, 'http://franecki.com/');
INSERT INTO pds (product_id, url) VALUES (69, 'http://funkprice.com/');
INSERT INTO pds (product_id, url) VALUES (95, 'http://grant.com/');
INSERT INTO pds (product_id, url) VALUES (62, 'http://greenholtbogisich.com/');
INSERT INTO pds (product_id, url) VALUES (71, 'http://hickle.com/');
INSERT INTO pds (product_id, url) VALUES (23, 'http://hickle.org/');
INSERT INTO pds (product_id, url) VALUES (82, 'http://hirthe.com/');
INSERT INTO pds (product_id, url) VALUES (26, 'http://hoegerboyer.com/');
INSERT INTO pds (product_id, url) VALUES (55, 'http://jones.com/');
INSERT INTO pds (product_id, url) VALUES (37, 'http://kilbacknolan.com/');
INSERT INTO pds (product_id, url) VALUES (24, 'http://koch.com/');
INSERT INTO pds (product_id, url) VALUES (90, 'http://kuphal.com/');
INSERT INTO pds (product_id, url) VALUES (32, 'http://lednermcglynn.com/');
INSERT INTO pds (product_id, url) VALUES (98, 'http://mayerullrich.info/');
INSERT INTO pds (product_id, url) VALUES (78, 'http://mcdermottebert.com/');
INSERT INTO pds (product_id, url) VALUES (73, 'http://mills.org/');
INSERT INTO pds (product_id, url) VALUES (3, 'http://morarkuphal.com/');
INSERT INTO pds (product_id, url) VALUES (80, 'http://mueller.info/');
INSERT INTO pds (product_id, url) VALUES (61, 'http://muller.com/');
INSERT INTO pds (product_id, url) VALUES (7, 'http://murray.org/');
INSERT INTO pds (product_id, url) VALUES (65, 'http://oconner.com/');
INSERT INTO pds (product_id, url) VALUES (57, 'http://okuneva.com/');
INSERT INTO pds (product_id, url) VALUES (86, 'http://pfannerstill.info/');
INSERT INTO pds (product_id, url) VALUES (52, 'http://pourosbrekke.info/');
INSERT INTO pds (product_id, url) VALUES (13, 'http://prohaska.com/');
INSERT INTO pds (product_id, url) VALUES (30, 'http://quitzon.biz/');
INSERT INTO pds (product_id, url) VALUES (47, 'http://reilly.com/');
INSERT INTO pds (product_id, url) VALUES (50, 'http://schimmel.net/');
INSERT INTO pds (product_id, url) VALUES (21, 'http://stammsmith.com/');
INSERT INTO pds (product_id, url) VALUES (85, 'http://stiedemannrenner.net/');
INSERT INTO pds (product_id, url) VALUES (28, 'http://thiel.net/');
INSERT INTO pds (product_id, url) VALUES (27, 'http://thompson.info/');
INSERT INTO pds (product_id, url) VALUES (40, 'http://tillman.com/');
INSERT INTO pds (product_id, url) VALUES (94, 'http://torp.org/');
INSERT INTO pds (product_id, url) VALUES (29, 'http://tremblay.com/');
INSERT INTO pds (product_id, url) VALUES (67, 'http://wunsch.com/');
INSERT INTO pds (product_id, url) VALUES (93, 'http://www.altenwerth.biz/');
INSERT INTO pds (product_id, url) VALUES (84, 'http://www.armstrong.com/');
INSERT INTO pds (product_id, url) VALUES (96, 'http://www.bartolettibecker.org/');
INSERT INTO pds (product_id, url) VALUES (79, 'http://www.bashirian.com/');
INSERT INTO pds (product_id, url) VALUES (43, 'http://www.baumbach.com/');
INSERT INTO pds (product_id, url) VALUES (5, 'http://www.beckergislason.com/');
INSERT INTO pds (product_id, url) VALUES (54, 'http://www.bernhardrosenbaum.biz/');
INSERT INTO pds (product_id, url) VALUES (88, 'http://www.block.net/');
INSERT INTO pds (product_id, url) VALUES (58, 'http://www.caspermitchell.net/');
INSERT INTO pds (product_id, url) VALUES (10, 'http://www.conn.com/');
INSERT INTO pds (product_id, url) VALUES (11, 'http://www.conroypagac.org/');
INSERT INTO pds (product_id, url) VALUES (17, 'http://www.cremin.com/');
INSERT INTO pds (product_id, url) VALUES (39, 'http://www.crona.com/');
INSERT INTO pds (product_id, url) VALUES (87, 'http://www.crooks.com/');
INSERT INTO pds (product_id, url) VALUES (70, 'http://www.cummingsmurray.biz/');
INSERT INTO pds (product_id, url) VALUES (6, 'http://www.dietrich.org/');
INSERT INTO pds (product_id, url) VALUES (44, 'http://www.durgan.com/');
INSERT INTO pds (product_id, url) VALUES (20, 'http://www.greenholtwisoky.net/');
INSERT INTO pds (product_id, url) VALUES (42, 'http://www.gusikowski.info/');
INSERT INTO pds (product_id, url) VALUES (99, 'http://www.halvorson.com/');
INSERT INTO pds (product_id, url) VALUES (75, 'http://www.harrisschmidt.com/');
INSERT INTO pds (product_id, url) VALUES (12, 'http://www.hartmannkutch.com/');
INSERT INTO pds (product_id, url) VALUES (92, 'http://www.hayes.info/');
INSERT INTO pds (product_id, url) VALUES (19, 'http://www.heaneydenesik.com/');
INSERT INTO pds (product_id, url) VALUES (38, 'http://www.hegmann.com/');
INSERT INTO pds (product_id, url) VALUES (48, 'http://www.homenick.biz/');
INSERT INTO pds (product_id, url) VALUES (16, 'http://www.jacobshauck.com/');
INSERT INTO pds (product_id, url) VALUES (91, 'http://www.keeling.org/');
INSERT INTO pds (product_id, url) VALUES (63, 'http://www.kemmerhalvorson.com/');
INSERT INTO pds (product_id, url) VALUES (76, 'http://www.kertzmann.com/');
INSERT INTO pds (product_id, url) VALUES (41, 'http://www.klockowisozk.com/');
INSERT INTO pds (product_id, url) VALUES (74, 'http://www.larkinkunde.com/');
INSERT INTO pds (product_id, url) VALUES (18, 'http://www.lehner.com/');
INSERT INTO pds (product_id, url) VALUES (33, 'http://www.marksgottlieb.com/');
INSERT INTO pds (product_id, url) VALUES (34, 'http://www.mcclurebruen.biz/');
INSERT INTO pds (product_id, url) VALUES (100, 'http://www.mclaughlinhammes.com/');
INSERT INTO pds (product_id, url) VALUES (46, 'http://www.metz.com/');
INSERT INTO pds (product_id, url) VALUES (56, 'http://www.morissette.com/');
INSERT INTO pds (product_id, url) VALUES (9, 'http://www.oconnell.biz/');
INSERT INTO pds (product_id, url) VALUES (59, 'http://www.pourosfahey.org/');
INSERT INTO pds (product_id, url) VALUES (89, 'http://www.quigley.info/');
INSERT INTO pds (product_id, url) VALUES (31, 'http://www.reichert.com/');
INSERT INTO pds (product_id, url) VALUES (36, 'http://www.robel.com/');
INSERT INTO pds (product_id, url) VALUES (77, 'http://www.rosenbaumschaefer.biz/');
INSERT INTO pds (product_id, url) VALUES (15, 'http://www.ryancremin.com/');
INSERT INTO pds (product_id, url) VALUES (14, 'http://www.schroeder.org/');
INSERT INTO pds (product_id, url) VALUES (49, 'http://www.smith.org/');
INSERT INTO pds (product_id, url) VALUES (2, 'http://www.streichbartell.com/');
INSERT INTO pds (product_id, url) VALUES (25, 'http://www.tillman.biz/');
INSERT INTO pds (product_id, url) VALUES (97, 'http://www.turcotte.org/');
INSERT INTO pds (product_id, url) VALUES (8, 'http://www.von.biz/');
INSERT INTO pds (product_id, url) VALUES (45, 'http://www.walker.com/');
INSERT INTO pds (product_id, url) VALUES (66, 'http://www.wiegand.org/');
INSERT INTO pds (product_id, url) VALUES (60, 'http://www.willms.com/');
INSERT INTO pds (product_id, url) VALUES (53, 'http://www.wisozktoy.net/');



INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('1', 'autem', 1, 1, '2018-12-06 13:39:59');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('2', 'nisi', 2, 2, '2011-01-10 05:45:29');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('3', 'accusamus', 3, 3, '2016-06-01 08:20:11');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('4', 'iste', 4, 4, '2008-09-20 17:04:04');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('5', 'ab', 5, 5, '1979-10-29 05:22:22');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('6', 'incidunt', 6, 1, '1970-12-11 06:33:49');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('7', 'repudiandae', 7, 2, '2006-02-18 18:17:31');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('8', 'molestiae', 8, 3, '1973-07-13 19:36:21');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('9', 'reiciendis', 9, 4, '1997-05-21 04:04:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('10', 'assumenda', 10, 5, '1998-04-01 01:14:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('11', 'tenetur', 11, 1, '1984-12-14 23:55:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('12', 'non', 12, 2, '2007-03-05 22:41:26');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('13', 'voluptates', 13, 3, '1997-07-05 23:17:55');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('14', 'nostrum', 14, 4, '2012-10-03 08:14:35');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('15', 'autem', 15, 5, '2017-08-05 09:47:29');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('16', 'qui', 1, 1, '2021-08-21 03:20:06');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('17', 'provident', 2, 2, '2016-05-27 12:22:05');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('18', 'consequatur', 3, 3, '1976-10-22 05:07:29');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('19', 'animi', 4, 4, '2017-05-31 15:44:17');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('20', 'non', 5, 5, '1980-08-24 15:25:17');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('21', 'est', 6, 1, '2005-07-29 23:36:39');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('22', 'et', 7, 2, '1972-04-25 22:15:35');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('23', 'qui', 8, 3, '2020-04-10 21:12:01');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('24', 'non', 9, 4, '1982-10-22 01:08:34');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('25', 'et', 10, 5, '1983-03-18 04:44:35');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('26', 'qui', 11, 1, '2011-10-26 19:28:50');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('27', 'numquam', 12, 2, '1996-08-23 07:45:32');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('28', 'impedit', 13, 3, '2008-12-30 10:08:15');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('29', 'non', 14, 4, '1986-02-22 21:37:53');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('30', 'odit', 15, 5, '2004-03-18 10:36:28');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('31', 'expedita', 1, 1, '1971-12-15 23:26:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('32', 'dolorum', 2, 2, '2010-01-10 04:28:37');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('33', 'non', 3, 3, '2002-11-22 11:46:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('34', 'laudantium', 4, 4, '1991-10-07 14:41:55');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('35', 'maiores', 5, 5, '1980-03-27 13:01:43');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('36', 'animi', 6, 1, '2004-11-18 00:03:53');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('37', 'cupiditate', 7, 2, '1985-08-23 17:58:03');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('38', 'doloremque', 8, 3, '2019-03-17 11:21:55');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('39', 'similique', 9, 4, '1999-07-25 23:39:25');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('40', 'qui', 10, 5, '1992-11-30 21:04:09');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('41', 'voluptatem', 11, 1, '2005-03-19 23:09:54');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('42', 'doloribus', 12, 2, '2000-11-06 04:03:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('43', 'perferendis', 13, 3, '1972-07-16 17:52:57');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('44', 'sit', 14, 4, '1983-08-25 14:10:00');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('45', 'facere', 15, 5, '1975-03-21 22:48:58');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('46', 'iste', 1, 1, '1971-12-04 16:09:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('47', 'et', 2, 2, '2004-11-18 21:02:13');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('48', 'deserunt', 3, 3, '2002-03-06 08:00:06');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('49', 'voluptate', 4, 4, '1976-09-18 23:42:34');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('50', 'non', 5, 5, '2014-10-09 12:16:08');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('51', 'exercitationem', 6, 1, '1991-08-27 23:22:43');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('52', 'natus', 7, 2, '2014-06-08 18:45:17');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('53', 'voluptatem', 8, 3, '2009-11-09 16:01:17');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('54', 'repudiandae', 9, 4, '2010-04-11 19:06:38');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('55', 'aliquid', 10, 5, '2002-03-03 02:39:23');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('56', 'nostrum', 11, 1, '1975-12-23 10:41:15');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('57', 'qui', 12, 2, '1990-06-16 17:53:04');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('58', 'veniam', 13, 3, '1988-10-29 23:32:52');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('59', 'velit', 14, 4, '2015-10-08 10:49:40');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('60', 'voluptatem', 15, 5, '1971-11-21 14:22:09');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('61', 'aliquid', 1, 1, '1990-04-22 08:43:59');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('62', 'sint', 2, 2, '1981-11-09 12:49:46');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('63', 'nihil', 3, 3, '1994-04-17 22:20:06');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('64', 'deleniti', 4, 4, '2002-05-07 03:44:07');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('65', 'molestiae', 5, 5, '1991-11-12 10:48:49');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('66', 'voluptates', 6, 1, '2005-11-26 22:24:51');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('67', 'occaecati', 7, 2, '2021-01-21 10:48:00');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('68', 'quo', 8, 3, '2019-09-20 02:34:57');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('69', 'deserunt', 9, 4, '2012-10-11 23:42:36');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('70', 'et', 10, 5, '1971-03-30 21:02:54');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('71', 'deserunt', 11, 1, '1994-11-07 21:07:49');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('72', 'cupiditate', 12, 2, '1970-03-19 22:37:33');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('73', 'commodi', 13, 3, '1973-01-02 06:47:49');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('74', 'cumque', 14, 4, '2019-10-07 00:47:38');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('75', 'ipsum', 15, 5, '2020-01-13 20:25:44');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('76', 'cupiditate', 1, 1, '2018-09-30 08:23:27');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('77', 'aut', 2, 2, '1978-05-11 05:17:27');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('78', 'omnis', 3, 3, '1984-10-14 01:49:01');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('79', 'autem', 4, 4, '2013-04-26 06:57:22');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('80', 'sit', 5, 5, '1983-06-28 11:44:24');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('81', 'accusamus', 6, 1, '1982-02-08 15:02:41');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('82', 'sunt', 7, 2, '2014-06-22 03:58:34');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('83', 'est', 8, 3, '2003-03-18 04:11:25');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('84', 'atque', 9, 4, '2011-04-11 19:33:32');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('85', 'pariatur', 10, 5, '2003-10-26 11:45:20');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('86', 'tenetur', 11, 1, '1996-05-23 08:26:03');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('87', 'optio', 12, 2, '2009-03-10 02:47:41');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('88', 'aut', 13, 3, '1992-12-11 11:22:59');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('89', 'fugiat', 14, 4, '2003-10-10 19:27:57');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('90', 'dignissimos', 15, 5, '1998-11-11 12:59:37');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('91', 'enim', 1, 1, '1986-02-16 11:38:00');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('92', 'quod', 2, 2, '1986-11-18 06:14:56');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('93', 'minus', 3, 3, '2001-12-31 06:19:28');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('94', 'id', 4, 4, '2016-11-02 13:07:27');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('95', 'magnam', 5, 5, '2004-11-18 00:23:09');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('96', 'in', 6, 1, '2018-03-30 08:37:08');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('97', 'quia', 7, 2, '1975-10-26 10:04:16');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('98', 'eum', 8, 3, '1996-02-05 07:56:16');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('99', 'dicta', 9, 4, '1983-11-11 09:40:00');
INSERT INTO products (id, name, brand_name_id, catalog_id, created_at) VALUES ('100', 'culpa', 10, 5, '1987-07-25 05:10:03');



INSERT INTO standards (id, name) VALUES ('1', 'Sit nemo et veritatis explicabo perspiciatis sit a');
INSERT INTO standards (id, name) VALUES ('2', 'Laudantium quae ab sit dolores repudiandae necessi');
INSERT INTO standards (id, name) VALUES ('3', 'Dolores et illum aperiam tempora voluptas porro es');
INSERT INTO standards (id, name) VALUES ('4', 'In et necessitatibus vel placeat.');
INSERT INTO standards (id, name) VALUES ('5', 'Consectetur accusamus enim magnam aperiam facere d');
INSERT INTO standards (id, name) VALUES ('6', 'Architecto sint tenetur maiores quia molestiae cum');
INSERT INTO standards (id, name) VALUES ('7', 'Sed provident non sit accusamus aliquam fugit quae');
INSERT INTO standards (id, name) VALUES ('8', 'Laudantium labore cumque sequi laborum ipsum conse');
INSERT INTO standards (id, name) VALUES ('9', 'Itaque ex accusamus repellat tempore.');
INSERT INTO standards (id, name) VALUES ('10', 'Sed nihil quibusdam tempora vero perspiciatis quia');
INSERT INTO standards (id, name) VALUES ('11', 'Vero non eligendi repudiandae voluptatibus sit.');
INSERT INTO standards (id, name) VALUES ('12', 'Omnis quis in consequatur autem.');
INSERT INTO standards (id, name) VALUES ('13', 'Sed harum explicabo quis.');
INSERT INTO standards (id, name) VALUES ('14', 'Fugiat consequatur aspernatur in minus sequi.');
INSERT INTO standards (id, name) VALUES ('15', 'Voluptas maxime dolore sint.');
INSERT INTO standards (id, name) VALUES ('16', 'Nostrum quo consequatur hic sit necessitatibus cul');
INSERT INTO standards (id, name) VALUES ('17', 'Voluptates sed velit excepturi natus quia.');
INSERT INTO standards (id, name) VALUES ('18', 'Aut ullam et amet voluptatem vero incidunt dolores');
INSERT INTO standards (id, name) VALUES ('19', 'Quia at perferendis voluptatem amet assumenda qui ');
INSERT INTO standards (id, name) VALUES ('20', 'Nemo distinctio nulla provident molestias unde ape');
INSERT INTO standards (id, name) VALUES ('21', 'Est blanditiis non recusandae et eos.');
INSERT INTO standards (id, name) VALUES ('22', 'Facere velit dolores earum maxime.');
INSERT INTO standards (id, name) VALUES ('23', 'Ea possimus ea dolores ipsum pariatur recusandae v');
INSERT INTO standards (id, name) VALUES ('24', 'Omnis rem voluptas facere iure.');
INSERT INTO standards (id, name) VALUES ('25', 'Perspiciatis laudantium repellat optio.');
INSERT INTO standards (id, name) VALUES ('26', 'Magni quasi reiciendis nisi et.');
INSERT INTO standards (id, name) VALUES ('27', 'Soluta ipsum voluptatem consequatur reprehenderit ');
INSERT INTO standards (id, name) VALUES ('28', 'Animi magni rerum quis.');
INSERT INTO standards (id, name) VALUES ('29', 'Totam enim velit ea nulla deserunt nisi enim.');
INSERT INTO standards (id, name) VALUES ('30', 'Voluptas incidunt alias et alias iste quasi est.');
INSERT INTO standards (id, name) VALUES ('31', 'Aut aut aut quisquam dolorem qui vitae animi.');
INSERT INTO standards (id, name) VALUES ('32', 'Suscipit laboriosam sapiente enim consequatur volu');
INSERT INTO standards (id, name) VALUES ('33', 'Iste vero aut nihil amet et consequuntur.');
INSERT INTO standards (id, name) VALUES ('34', 'At officiis sit ea consequatur autem numquam.');
INSERT INTO standards (id, name) VALUES ('35', 'Nulla id id temporibus asperiores sit placeat veli');
INSERT INTO standards (id, name) VALUES ('36', 'Mollitia eum ipsa et ipsum sit.');
INSERT INTO standards (id, name) VALUES ('37', 'Hic in tempora distinctio officia qui et aliquid.');
INSERT INTO standards (id, name) VALUES ('38', 'Nesciunt et atque modi.');
INSERT INTO standards (id, name) VALUES ('39', 'Vero ea quis dolorum nulla aperiam praesentium tem');
INSERT INTO standards (id, name) VALUES ('40', 'Non facere unde delectus voluptas quo non reiciend');
INSERT INTO standards (id, name) VALUES ('41', 'Explicabo non quasi eum et quam.');
INSERT INTO standards (id, name) VALUES ('42', 'Quos repellat quia vero velit eos dolores eos sed.');
INSERT INTO standards (id, name) VALUES ('43', 'Eum nihil occaecati vel sapiente assumenda.');
INSERT INTO standards (id, name) VALUES ('44', 'Voluptas eius sapiente laboriosam vel molestias et');
INSERT INTO standards (id, name) VALUES ('45', 'Quas est quam consectetur.');
INSERT INTO standards (id, name) VALUES ('46', 'Consequatur rerum omnis sint doloremque.');
INSERT INTO standards (id, name) VALUES ('47', 'Odit voluptas quia et dolores qui qui ad.');
INSERT INTO standards (id, name) VALUES ('48', 'Vel odit sed eaque ut sed quia ex.');
INSERT INTO standards (id, name) VALUES ('49', 'Quae sint dolor necessitatibus omnis veritatis sae');
INSERT INTO standards (id, name) VALUES ('50', 'Voluptatem ullam perferendis officiis architecto q');



INSERT INTO tsr (id, first_name, last_name, email) VALUES ('1', 'Marquis', 'Predovic', 'heller.johnny@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('2', 'Sterling', 'Mante', 'schaefer.alf@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('3', 'Jerod', 'Kreiger', 'smertz@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('4', 'Rogelio', 'Huels', 'devonte.konopelski@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('5', 'Anabel', 'Feil', 'pwuckert@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('6', 'Walton', 'Schmidt', 'quitzon.wilfrid@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('7', 'Gustave', 'Douglas', 'ihyatt@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('8', 'Lyda', 'Krajcik', 'ahyatt@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('9', 'Lera', 'Kulas', 'gilberto13@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('10', 'Shawna', 'Nicolas', 'wintheiser.tressie@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('11', 'Zander', 'Emard', 'kabbott@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('12', 'Donnie', 'Rippin', 'oliver.jenkins@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('13', 'Gino', 'Murphy', 'elisa.schumm@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('14', 'Cielo', 'Kassulke', 'ona.heller@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('15', 'Woodrow', 'Jacobson', 'cristian36@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('16', 'Kenyon', 'Tillman', 'amira.heidenreich@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('17', 'Fernando', 'Robel', 'shawn.hudson@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('18', 'Ignacio', 'Wyman', 'laverna23@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('19', 'Stefan', 'Miller', 'ohamill@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('20', 'Marcelina', 'Kuhic', 'elliott29@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('21', 'Edward', 'Pollich', 'huels.jacinthe@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('22', 'Murray', 'Kunze', 'lang.verda@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('23', 'Merritt', 'Hane', 'dashawn.ruecker@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('24', 'Margarett', 'OHara', 'crolfson@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('25', 'Sofia', 'Rohan', 'eldon.walsh@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('26', 'Jazmyne', 'Hane', 'houston.west@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('27', 'Kenya', 'Schinner', 'crooks.darrion@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('28', 'Eduardo', 'Fay', 'zkertzmann@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('29', 'Queen', 'Kuhlman', 'delphine24@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('30', 'Rudolph', 'Abbott', 'idurgan@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('31', 'Earnestine', 'Mayer', 'spencer.tianna@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('32', 'Wilfredo', 'Kohler', 'ollie.huel@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('33', 'Rocky', 'Bradtke', 'rrempel@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('34', 'Flo', 'Shanahan', 'carmel34@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('35', 'Mario', 'Pagac', 'roman.hane@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('36', 'Stan', 'Weissnat', 'tre83@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('37', 'Cheyanne', 'Koss', 'abdullah.frami@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('38', 'Milton', 'OKeefe', 'eriberto.weimann@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('39', 'Jaime', 'Nikolaus', 'sgrimes@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('40', 'Hailie', 'Von', 'konopelski.max@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('41', 'Alexis', 'Williamson', 'omari.metz@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('42', 'Rosie', 'Nitzsche', 'dmosciski@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('43', 'Derek', 'Feest', 'cschulist@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('44', 'Nicole', 'Hauck', 'donavon59@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('45', 'Mabel', 'Fahey', 'raul.ullrich@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('46', 'Maye', 'Schultz', 'yzemlak@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('47', 'Joany', 'Rodriguez', 'walsh.sim@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('48', 'Mario', 'Anderson', 'qtreutel@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('49', 'Shaylee', 'Heidenreich', 'slowe@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('50', 'Astrid', 'Kerluke', 'micheal.durgan@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('51', 'Annabell', 'Roob', 'ondricka.nadia@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('52', 'Brayan', 'Rice', 'stuart28@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('53', 'Lucas', 'Hodkiewicz', 'jovanny00@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('54', 'Yadira', 'Abshire', 'douglas.luigi@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('55', 'Arlene', 'Terry', 'garret20@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('56', 'Niko', 'Abbott', 'lesly.douglas@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('57', 'Wade', 'Gerlach', 'oberbrunner.corine@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('58', 'Brent', 'Bartell', 'xschuppe@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('59', 'Kyra', 'Zulauf', 'domenico71@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('60', 'Whitney', 'Dach', 'skiles.magali@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('61', 'Nannie', 'Kris', 'tanner73@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('62', 'Trever', 'Hintz', 'llubowitz@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('63', 'Rhea', 'Schneider', 'uriah.dach@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('64', 'Jacklyn', 'Greenholt', 'maryam.senger@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('65', 'Euna', 'Reinger', 'bruce97@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('66', 'Monica', 'Kulas', 'viviane.lang@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('67', 'Norma', 'Yost', 'aliya.hammes@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('68', 'Taylor', 'Kerluke', 'hoyt58@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('69', 'Selena', 'Wolff', 'predovic.bella@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('70', 'Ettie', 'Littel', 'njerde@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('71', 'Jackeline', 'Aufderhar', 'ogottlieb@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('72', 'Delaney', 'Carter', 'eernser@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('73', 'Anita', 'Mills', 'bechtelar.vernon@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('74', 'David', 'Adams', 'sheller@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('75', 'Esperanza', 'Kemmer', 'bernhard.anderson@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('76', 'Danika', 'Oberbrunner', 'labadie.emery@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('77', 'Kelsie', 'Lowe', 'danyka70@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('78', 'Barry', 'Turcotte', 'carissa.grimes@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('79', 'Britney', 'Ferry', 'kimberly91@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('80', 'Heber', 'Murphy', 'nathan97@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('81', 'Beth', 'Bernier', 'maye30@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('82', 'Jordan', 'OKon', 'nedra.reilly@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('83', 'Devin', 'Roberts', 'brennan32@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('84', 'Elisha', 'Wilkinson', 'mlockman@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('85', 'Leila', 'Dickinson', 'tamia96@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('86', 'Aniyah', 'Kuhn', 'kunde.alexandra@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('87', 'Kim', 'Swaniawski', 'horacio31@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('88', 'Otha', 'Halvorson', 'bstiedemann@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('89', 'Frederik', 'Hammes', 'dahlia.hermiston@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('90', 'Judson', 'Grady', 'mayert.jana@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('91', 'Jermey', 'Hauck', 'lucas.brakus@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('92', 'Adolphus', 'Robel', 'bobby97@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('93', 'Agnes', 'Torp', 'reinger.hilma@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('94', 'Abigail', 'Considine', 'gisselle64@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('95', 'Simeon', 'Kemmer', 'taya.gaylord@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('96', 'Kaylee', 'Simonis', 'zwill@example.com');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('97', 'Alayna', 'Welch', 'katherine95@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('98', 'Adeline', 'Lesch', 'dlangosh@example.net');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('99', 'Serenity', 'OKon', 'quentin01@example.org');
INSERT INTO tsr (id, first_name, last_name, email) VALUES ('100', 'Melvin', 'Huel', 'oconnell.sonia@example.org');


INSERT INTO labs (id, name) VALUES ('1', 'Hartmann-Lesch');
INSERT INTO labs (id, name) VALUES ('2', 'Tromp-Jacobi');
INSERT INTO labs (id, name) VALUES ('3', 'Abernathy Ltd');
INSERT INTO labs (id, name) VALUES ('4', 'Sanford-Botsford');
INSERT INTO labs (id, name) VALUES ('5', 'Zieme, Deckow and Baumbach');
INSERT INTO labs (id, name) VALUES ('6', 'Satterfield, Krajcik and Boyle');
INSERT INTO labs (id, name) VALUES ('7', 'Kreiger, Pouros and Schulist');
INSERT INTO labs (id, name) VALUES ('8', 'Legros Ltd');
INSERT INTO labs (id, name) VALUES ('9', 'Gutmann LLC');
INSERT INTO labs (id, name) VALUES ('10', 'Wiza Ltd');
INSERT INTO labs (id, name) VALUES ('11', 'Reichel, Walker and Lynch');
INSERT INTO labs (id, name) VALUES ('12', 'Mills Inc');
INSERT INTO labs (id, name) VALUES ('13', 'Witting-Maggio');
INSERT INTO labs (id, name) VALUES ('14', 'Kilback Ltd');
INSERT INTO labs (id, name) VALUES ('15', 'Stoltenberg, Kerluke and McKenzie');


INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('1', 'aliquam', 3, 20, '{11}', 'Occaecati hic itaque et sapiente. Ut ducimus corporis omnis esse vel sunt. Voluptatem asperiores porro laborum voluptatibus aut consequatur qui.', '1978-06-05', '1979-06-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('2', 'consectetur', 4, 4, '{11,12}', 'Omnis veniam ut odio ut. Autem cum corporis tempora ex ea est qui. Iste et perspiciatis ab voluptas.', '2015-07-13', '2017-05-19');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('3', 'quidem', 4, 2, '{15}', 'Quia nemo et officia aut. Sed quasi mollitia totam ullam quis. Non rem voluptatibus nostrum architecto. Nam ut nihil error magnam harum.', '2000-12-06', '1979-03-08');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('4', 'ea', 10, 11, '{19}', 'Nisi labore ipsa aspernatur consequatur. Aliquid aliquam non ipsum id aut. Dolores sit consequuntur dolore provident illo rerum et dolor. Vel quia occaecati laboriosam est ut repudiandae.', '1988-01-24', '2006-04-07');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('5', 'earum', 13, 12, '{9}', 'Voluptatem non et nemo eos. Et et sit accusantium cupiditate accusantium eum illo. Sit sequi assumenda quibusdam omnis inventore. Quasi rem eius qui doloremque et nostrum autem doloribus.', '1976-10-25', '1993-05-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('6', 'minima', 2, 8, '{12}', 'Odio debitis rem tempora eaque. Vel dolorum nulla eligendi recusandae quisquam et. Tempora voluptatem qui deleniti. Delectus rerum dolores molestiae consequuntur.', '1994-02-21', '2013-12-13');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('7', 'corrupti', 24, 17, '{5,1}', 'Voluptas maxime ex dolor asperiores atque. Neque dolor sed eos similique commodi suscipit quo. Totam qui aliquid perspiciatis explicabo eligendi. Et eveniet dolor sequi officia asperiores magni eum.', '1998-11-20', '1982-05-29');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('8', 'est', 6, 4, '{3}', 'Molestiae sit eaque voluptatem magni ut facilis. Eaque quia molestiae quam alias in. Dolorum eveniet alias ducimus quis. Quia voluptatem enim et nihil incidunt ipsa voluptatem.', '1991-11-18', '1975-07-12');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('9', 'qui', 20, 4, '{14,2}', 'Sint excepturi porro officiis debitis rerum. Quod optio illo eos sint. Nesciunt et esse dolores aliquid voluptatem aut nulla. Et ea qui explicabo dolorum voluptates.', '2001-04-02', '1993-11-27');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('10', 'sint', 13, 18, '{19}', 'Sint eum voluptates quae consequatur facere commodi. Ad maiores optio maiores doloremque non incidunt. Sed quia aliquid amet accusamus laborum itaque. Nobis sapiente dicta explicabo nulla illo odit.', '1995-03-12', '1971-11-09');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('11', 'nulla', 11, 12, '{16}', 'Quo et occaecati et et quia rerum. Neque pariatur molestiae quo impedit consequuntur sit et qui. Magni adipisci atque assumenda vitae culpa.', '1972-12-19', '2001-05-19');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('12', 'provident', 6, 12, '{16}', 'Repellendus et aut magni. Dolor repellendus consequatur culpa iusto beatae. Dolor et qui ut a veniam esse. Est similique dolores ea impedit et.', '1994-08-12', '2004-02-21');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('13', 'corporis', 25, 2, '{15}', 'Ab et in voluptate neque. Molestias necessitatibus adipisci qui in repudiandae voluptatem assumenda.', '1980-09-13', '2009-11-20');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('14', 'id', 14, 17, '{12}', 'Quis ut corporis in provident magni. Praesentium sequi quis aut nostrum. Impedit et numquam sint vitae similique rem possimus. Debitis doloribus vero sed modi minus quisquam.', '2003-06-10', '1987-01-16');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('15', 'dolor', 8, 9, '{4}', 'Ut rerum inventore expedita aliquam nulla. Ab tempore ut impedit magni. Ut molestiae magni expedita doloribus eos ut sed impedit.', '1984-05-14', '1983-07-15');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('16', 'quia', 9, 13, '{17,1,3}', 'Rerum et quod ullam dolor autem. Laboriosam quod odit ut vero. Commodi officiis magni minima.', '1972-03-17', '1996-02-24');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('17', 'voluptate', 10, 2, '{4, 12}', 'Voluptatem ab sit inventore quidem corporis. Voluptatem repellat ullam recusandae sit. Est non voluptatem reprehenderit unde tempore debitis esse.', '1971-08-07', '2000-01-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('18', 'et', 14, 17, '{4}', 'Laudantium in recusandae recusandae quia voluptatem totam voluptas. Quam id aut nulla.', '1974-11-14', '1973-05-10');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('19', 'eum', 15, 5, '{17}', 'Tempora ea voluptatum omnis. Praesentium et maiores officiis omnis. Sed est iste non explicabo quasi iste saepe.', '2001-02-15', '1978-04-14');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('20', 'rerum', 20, 19, '{8,2}', 'Labore qui id vero neque. Ut est et consequuntur optio ratione est cupiditate suscipit. Est qui nemo autem consequatur.', '1993-10-03', '1996-04-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('21', 'voluptatem', 3, 13, '{1,3}', 'Suscipit animi consectetur aut. Quidem voluptatibus quis dolore vel ad. Earum et culpa voluptatibus ratione. Consequatur recusandae sed soluta earum sit dolore.', '1992-03-03', '2008-09-02');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('22', 'error', 9, 10, '{14}', 'Minima eum aut ducimus expedita deleniti id voluptatum. Ut quidem a eum quasi amet ab. Non quia ea consequuntur laudantium ratione libero.', '1976-07-25', '1973-09-28');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('23', 'est', 4, 3, '{15}', 'Natus aut voluptatem minima vero rerum qui at. Laboriosam provident libero blanditiis tenetur et. Quod tenetur veniam eius unde delectus et est. Earum dolorum alias mollitia facere doloribus id.', '1999-01-31', '2011-08-09');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('24', 'delectus', 10, 15, '{19}', 'Quo quis sequi rerum voluptatem. Perspiciatis sit nulla sit ut similique error. Eaque expedita odit assumenda quasi.', '2018-12-07', '2018-06-22');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('25', 'et', 20, 3, '{14}', 'Quos reiciendis sunt sequi iure impedit. Asperiores culpa molestiae molestias ut voluptatibus a. Voluptatem molestiae est quo. Voluptates aspernatur assumenda ut animi optio esse.', '1975-12-12', '2003-10-24');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('26', 'distinctio', 24, 16, '{12,1}', 'At rerum consequatur aspernatur et rerum ad et. Quaerat laudantium dolores alias vel. Non cumque quibusdam et voluptatibus rerum nihil.', '1999-08-15', '1975-01-03');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('27', 'consequuntur', 10, 18, '{3,1}', 'Esse dolores quia soluta praesentium sed officia. Aliquid illo quis dolores est illum. Quia id consequatur sunt est enim. Et non et aut sit eligendi.', '2002-05-01', '1975-04-06');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('28', 'nobis', 3, 8, '{6}', 'Officia nam sunt aliquam dolor id. Sit nesciunt rerum sit et ut pariatur.', '1984-02-03', '1998-07-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('29', 'repellat', 14, 2, '{9}', 'Mollitia suscipit odit tenetur dolorum inventore unde sit molestiae. Eius voluptas cumque soluta quia aut iste eius suscipit. Dolores hic est expedita sint distinctio.', '2020-11-22', '1978-06-19');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('30', 'omnis', 22, 8, '{11,9}', 'Impedit consequatur quia quo. Dicta non nihil sint occaecati occaecati illum eaque eligendi. Est sed dolorem quae accusantium et rem. Non nulla hic ipsum qui blanditiis id.', '2019-07-24', '1985-10-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('31', 'atque', 2, 18, '{14,15}', 'Cupiditate sequi totam facilis incidunt quia. Quasi aut repudiandae est voluptatum esse dolorem voluptates. Rem et necessitatibus nobis iste iure nemo.', '2017-05-03', '1985-08-08');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('32', 'ea', 16, 6, '{8,2}', 'Omnis optio aut aperiam laboriosam voluptatem eos. Et quas inventore corporis.', '2020-01-02', '1980-04-21');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('33', 'veritatis', 16, 5, '{7,30}', 'In aut eos est cum voluptate. Quibusdam quasi expedita ut sapiente qui et beatae autem. Modi repellat debitis sed sit ab velit.', '1975-10-21', '1998-11-22');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('34', 'molestiae', 15, 11, '{18,88}', 'Sed a sed et ducimus. Fugiat quia totam numquam. Sed impedit est velit in consequatur itaque. Qui reiciendis et quia facere accusantium ut quia.', '2004-09-13', '2003-04-27');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('35', 'inventore', 17, 18, '{20,4}', 'Quibusdam est minus et. Dolorem iste aliquid qui consectetur voluptas aut. Repellendus aliquid porro sunt non tempore modi voluptatem.', '1977-10-02', '2010-08-11');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('36', 'aut', 7, 2, '{19,55}', 'Dicta autem non impedit voluptates voluptas sed. Vero corporis mollitia beatae adipisci excepturi.', '2010-12-22', '1985-08-05');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('37', 'est', 23, 2, '{9}', 'Rem nobis ipsum et ducimus. Accusamus voluptate debitis officia nostrum possimus velit. Blanditiis delectus soluta rerum atque. Nobis ex odio ut.', '1970-05-06', '1971-07-04');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('38', 'quia', 4, 1, '{3,22}', 'Magnam sed et voluptatibus dolor est. Similique hic aut aperiam quia.', '2001-03-27', '1971-05-03');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('39', 'doloremque', 6, 16, '{12,13,18}', 'Enim et illum numquam consectetur vero pariatur fugiat. Omnis itaque aliquam quia culpa fugiat. Repudiandae mollitia eos perspiciatis tempora quibusdam ut.', '2013-04-29', '2012-02-28');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('40', 'non', 14, 9, '{13,77}', 'Ea fugit beatae a cupiditate quasi. Voluptas vel dicta ipsam in in velit. Maiores illo quasi voluptatibus est.', '2000-02-19', '2012-06-03');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('41', 'quo', 4, 14, '{15}', 'Optio est sit eum non velit pariatur delectus. Error error provident velit eaque illum est pariatur itaque. Dicta nulla vel aspernatur quas.', '2001-12-02', '1986-04-17');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('42', 'et', 25, 6, '{1}', 'Possimus est dolores odit debitis soluta et nulla quam. Neque voluptas est molestiae iure nam. Omnis placeat et cumque illum deserunt.', '2015-11-25', '1994-04-11');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('43', 'optio', 23, 5, '{12,66}', 'Eos in perspiciatis sed sint. Ea ut dolorem dolores quae reprehenderit qui provident. Et similique vel qui blanditiis laudantium et corporis.', '2001-03-14', '1997-01-20');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('44', 'voluptatem', 20, 14, '{7}', 'Recusandae consequuntur qui voluptas similique. Aut placeat corrupti iusto est sint minus. Laudantium temporibus voluptatem mollitia ipsum eius. Nostrum fugit numquam autem aut.', '2001-06-09', '1988-11-12');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('45', 'occaecati', 7, 12, '{6}', 'Facilis labore reprehenderit ut vel distinctio saepe. Ab deserunt cupiditate et repellat. Veniam aut tempora aspernatur voluptas. Iste sed excepturi rem voluptas. Et vero culpa esse.', '1992-10-10', '1993-02-02');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('46', 'necessitatibus', 20, 19, '{13,23,33}', 'Magnam rerum quia tenetur rerum quis rerum. Eveniet quis dolorum asperiores quidem dolorem. Et quis voluptatem dolor voluptatibus expedita exercitationem odit non.', '1996-05-24', '2000-04-22');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('47', 'necessitatibus', 9, 19, '{12}', 'Quis enim repellat porro eos et modi molestiae. Qui enim excepturi pariatur sunt perferendis. Amet quia nobis ex ut.', '1986-05-25', '2006-12-06');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('48', 'accusamus', 8, 7, '{6,1}', 'Quia est laudantium corrupti accusamus. Iusto sunt velit beatae tenetur. Ex libero vel voluptas.', '1985-11-12', '2004-04-09');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('49', 'voluptate', 21, 1, '{6}', 'Doloremque voluptas molestiae et incidunt modi deleniti. Voluptatem sint et rerum. Explicabo doloremque corrupti natus velit non odit dolore.', '1986-02-26', '2012-03-04');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('50', 'dolores', 3, 11, '{11,8}', 'Sit in quia itaque et harum sed eos. Aspernatur est inventore sit. Voluptatem reprehenderit libero sunt illo ab ea qui. Ea atque et omnis amet.', '1989-05-04', '1979-04-24');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('51', 'consequatur', 7, 7, '{5}', 'Occaecati eos sunt iure et repellendus qui. Omnis eius eligendi beatae quo molestiae. Sunt sit velit quibusdam facere voluptatem nesciunt est.', '2002-03-14', '1970-11-13');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('52', 'non', 16, 13, '{6,99}', 'Voluptatum velit beatae dolores est. Et aut dolorem fugit repellendus perferendis commodi quis. Et quo voluptas quaerat vero consequatur animi dignissimos.', '1975-06-11', '2002-06-14');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('53', 'laborum', 16, 19, '{10}', 'Sunt dignissimos impedit dolorum provident aspernatur rerum quas. Quidem harum expedita excepturi rerum culpa quo. Molestias soluta ipsa consequatur eius. Illum dolore qui voluptas explicabo autem.', '2007-01-20', '1991-06-26');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('54', 'at', 16, 2, '{6,7}', 'Cum facilis quia et saepe sapiente. Ipsa tenetur quam voluptatem alias veritatis ad harum. Dolorem illum consequatur dolorem dolore quas aspernatur rerum. Velit aliquid sunt voluptatem ut eum.', '1994-06-13', '2008-05-30');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('55', 'amet', 14, 2, '{1}', 'Dicta officiis perferendis ex aut distinctio. Aut facilis qui nobis provident. Repellendus commodi quo incidunt provident ea architecto fugit. Accusamus ex consequuntur aut id.', '1972-07-15', '2016-11-10');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('56', 'dignissimos', 17, 13, '{4}', 'Quo quo odit beatae. Autem aut tempore quibusdam eos maxime ut. Eveniet expedita aut maxime officia enim alias. Dolorem et reprehenderit facere nihil.', '2019-02-03', '1982-12-09');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('57', 'porro', 25, 9, '{2,9}', 'Est nisi ratione atque ipsum esse dolores reprehenderit dolores. Voluptatem optio esse qui in. Ipsa est dolores similique veniam quisquam nam ut.', '2014-04-07', '2020-10-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('58', 'suscipit', 13, 20, '{15}', 'Eos sunt aut molestiae ut velit est. Nihil voluptatem ut labore accusantium at est. Qui aut et non molestias qui sapiente quia.', '2002-07-04', '1982-02-24');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('59', 'aliquid', 7, 9, '{18,19}', 'Cum dolorem dignissimos quibusdam amet explicabo repellat. Ut distinctio atque ipsum cumque facilis ipsam. Vel vero totam et qui.', '1984-11-06', '1978-06-07');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('60', 'est', 9, 20, '{14,43}', 'Facere sit expedita voluptates omnis. A sit blanditiis sint a ut a. Impedit et a id voluptatem nihil. Ut ab totam vel.', '1982-02-04', '2020-12-26');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('61', 'corrupti', 7, 11, '{17,1,2,3}', 'Et non quia sed est beatae. Provident et adipisci quis. Doloribus beatae qui est asperiores. Vel dignissimos et corporis sit vel.', '2005-09-29', '1986-03-23');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('62', 'dolor', 6, 17, '{18}', 'Aliquam itaque tempora sunt. Consequatur qui qui minima consectetur facere omnis rerum. Consequatur recusandae sunt occaecati laudantium.', '1991-11-30', '1970-05-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('63', 'facilis', 12, 5, '{7}', 'Quisquam rem assumenda dolores voluptatem qui dolores. Quos quo sunt nisi voluptatem eum nam omnis. Molestiae animi repellat occaecati hic sunt.', '2018-11-12', '1984-09-10');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('64', 'optio', 20, 11, '{1}', 'Nam distinctio sed explicabo. Ut nostrum dicta quia doloribus ut doloribus distinctio impedit.', '1998-08-16', '1997-02-27');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('65', 'totam', 19, 18, '{3,6}', 'Exercitationem sunt sed earum rerum asperiores doloribus. Rerum quia et labore quam saepe. Laboriosam quasi corporis omnis. Voluptatem dolores quia debitis est quia dicta consequatur.', '2001-02-28', '1995-02-28');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('66', 'explicabo', 7, 2, '{16}', 'Nostrum odit aliquid vitae incidunt molestias et. Quisquam minus necessitatibus consequuntur placeat. Aut veniam sapiente alias beatae vel et dolor.', '2003-02-14', '2017-10-17');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('67', 'praesentium', 17, 5, '{11}', 'Aut earum veniam ut eaque doloribus laudantium. Distinctio esse est beatae et cupiditate rerum fugiat. Doloribus veritatis facilis numquam autem corporis.', '1996-03-04', '1997-01-17');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('68', 'ut', 6, 12, '{4,87,77,90,93}', 'Odit nulla velit et aut quia illo ratione. Distinctio aperiam aut dolorum sint suscipit. Aut reiciendis dolor nihil voluptatem soluta.', '1970-06-14', '1991-05-11');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('69', 'et', 1, 18, '{8}', 'Deserunt quos cum provident sunt. Praesentium voluptate dolorem provident ea rerum repellat aut. Similique qui aperiam voluptas neque labore. In autem rerum provident provident consequatur et.', '1986-10-30', '2021-12-12');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('70', 'perferendis', 25, 6, '{19}', 'Et omnis odit ex sint est qui est ullam. Et praesentium ducimus laudantium vitae eius deleniti saepe quia. Aut omnis accusamus ut qui quaerat. Non commodi fugit sint quia ut.', '1998-07-14', '1979-11-07');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('71', 'quos', 14, 2, '{10}', 'Et velit voluptatem iusto quod dolor ad. Voluptas mollitia omnis est debitis quod et.', '1983-01-31', '2017-03-04');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('72', 'aut', 13, 16, '{20}', 'Molestiae beatae quia rerum ab maxime nihil dolorem. Nam suscipit ut quaerat numquam qui labore ipsa corrupti. Non quis iusto rem quia voluptatum accusamus porro.', '2014-06-26', '2014-09-14');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('73', 'alias', 2, 10, '{18}', 'Aut dicta aut minima est qui necessitatibus harum in. Mollitia id rem voluptate. Laborum magnam omnis vitae illo et officia est.', '1970-06-30', '1974-11-13');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('74', 'voluptatem', 17, 15, '{13}', 'Et temporibus tempora dignissimos. Libero repellat ad maiores totam rerum quasi rerum. Distinctio aspernatur non explicabo quo doloribus. Quam officia ex officiis hic expedita.', '1977-04-21', '1978-08-19');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('75', 'doloremque', 16, 2, '{9}', 'Quia nisi saepe ipsa eos. Et vel sed aut quia reiciendis facilis. Magnam voluptatem autem et eligendi.', '1994-12-24', '1977-03-18');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('76', 'vel', 25, 12, '{19}', 'A error id ut dolores sit. Voluptatem harum et natus et et quis.', '1993-06-24', '1997-01-17');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('77', 'doloribus', 8, 2, '{19}', 'Adipisci distinctio consequuntur dolores nulla. Quia architecto est totam id dolor. Ut placeat illo nesciunt suscipit dolores ut aperiam. Deleniti voluptatem consequatur iure quibusdam.', '1975-04-27', '1970-12-30');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('78', 'illo', 2, 14, '{2}', 'Eos voluptatem beatae corrupti rem quae. Nesciunt quaerat aut consequuntur est quis qui pariatur. Et eum repudiandae expedita nostrum. Dolores dolores iure maiores necessitatibus ipsa aut.', '1973-02-22', '1992-01-23');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('79', 'nemo', 20, 13, '{16}', 'Pariatur non et eos facilis. Deleniti facilis architecto quod et repellat.', '2000-01-21', '2020-05-09');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('80', 'culpa', 17, 20, '{18}', 'Sequi animi qui natus ratione ut impedit. Qui sed rerum eum ut vel consequatur. Reiciendis ratione repellat consequatur quam ut expedita.', '2001-09-18', '2021-04-27');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('81', 'quia', 15, 6, '{16}', 'Ea nisi quos voluptas labore dolor praesentium. Eveniet quaerat totam distinctio excepturi et eos ab vel. Ut laborum debitis minus.', '1977-07-28', '1976-11-30');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('82', 'delectus', 12, 15, '{16}', 'Facilis eum id possimus ratione harum saepe quisquam porro. Hic non fugiat omnis est voluptate quam. Nihil deserunt in quia soluta vero soluta quia. Nisi labore qui aut aperiam ratione ducimus enim.', '1999-12-29', '2002-11-27');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('83', 'est', 11, 10, '{11}', 'Sit dignissimos culpa nobis molestias quae. Rerum natus a nihil quia amet harum sed.', '2002-01-13', '2018-11-05');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('84', 'quas', 19, 14, '{18}', 'Magnam dolorum nisi fuga in voluptatem animi. Quos fugiat sint at consequuntur. Eum non voluptatum at suscipit.\nAspernatur sed incidunt similique esse eaque. Rerum laudantium esse animi iste.', '2003-05-02', '1997-02-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('85', 'iste', 13, 5, '{5,89}', 'Ut cum exercitationem quos nobis odit beatae. Eos aut dolorem aut fuga consequuntur ipsam labore. Cumque enim accusantium mollitia laborum sint quia harum.', '1999-01-09', '2016-12-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('86', 'nulla', 7, 13, '{3}', 'Labore et quisquam animi necessitatibus hic voluptatum. Qui sunt ea ut atque et exercitationem vel. Placeat ducimus consequatur in fuga. Eos aut et iure ea illum sed alias nulla.', '2009-01-30', '1984-04-10');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('87', 'quae', 14, 10, '{3}', 'Consequatur eum odit magnam quia sit tempore enim. Tenetur ea reiciendis fuga nisi.', '1985-03-26', '2020-01-03');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('88', 'commodi', 16, 3, '{18}', 'Soluta repudiandae necessitatibus velit repellendus eos deserunt. Ducimus sit sit magni quos blanditiis. Non rerum sed est laboriosam qui.', '2001-09-02', '1990-07-20');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('89', 'eum', 10, 20, '{2}', 'Laborum nobis unde numquam officiis. Voluptatum quisquam iure qui dolore sed. Quibusdam doloribus molestiae ratione rerum enim.', '1989-12-14', '2017-06-29');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('90', 'dolor', 7, 1, '{2}', 'Quia ut reiciendis vel et provident mollitia. Eligendi aut est sint quia qui itaque. Nisi nihil consequatur et totam ad.', '1997-09-19', '2001-11-19');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('91', 'nisi', 6, 11, '{1}', 'Voluptas vel sunt aperiam. Maiores molestiae iste voluptatem placeat reprehenderit. Ab illo natus aut facilis.', '1997-03-03', '1980-01-20');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('92', 'quis', 17, 5, '{9}', 'Sapiente dolores voluptatum iure beatae corporis mollitia voluptatem. Expedita quos vitae nam inventore eum architecto aliquam. Voluptatem molestias explicabo ut ab explicabo quos.', '1994-05-27', '1988-10-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('93', 'est', 3, 3, '{16}', 'Dolores molestiae deleniti et ipsum. Enim sed nesciunt fugiat. Et omnis rem incidunt consequatur. Fuga odit aut et quo.', '2011-12-05', '1995-04-23');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('94', 'voluptatem', 2, 1, '{17}', 'Dolor et maiores non rem illum. Nemo architecto placeat et voluptatem nostrum hic et. Sint ipsa ex omnis accusantium.', '1975-02-25', '1977-04-01');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('95', 'dolor', 20, 20, '{11}', 'Voluptatem adipisci ex quibusdam cupiditate tenetur. Perferendis dolores doloremque placeat quos quis optio tempore. Qui sunt veritatis delectus ullam aut dignissimos dolorum deleniti.', '1987-10-28', '1971-12-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('96', 'qui', 9, 9, '{2}', 'Fugit dolor natus quo ipsum facilis. Debitis qui voluptas rerum aut. Et cupiditate qui vitae omnis veritatis.\nConsequuntur adipisci nobis quam. Et error illo reprehenderit.', '1994-02-28', '1999-12-14');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('97', 'ut', 12, 19, '{10}', 'Quis odio odio magnam pariatur. Ipsam in voluptatibus id. Neque corporis voluptas rerum aspernatur sit beatae neque. Tempore tenetur sint beatae illum. Est est iusto assumenda non fugiat.', '2012-03-26', '2017-07-25');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('98', 'veritatis', 13, 13, '{8,2,3}', 'Et optio modi velit qui sed ea. Voluptatem qui iure reiciendis. Aut quos voluptas quaerat rerum.', '1993-03-11', '1979-07-08');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('99', 'excepturi', 12, 1, '{3}', 'Cumque temporibus laudantium nulla. Sed quaerat omnis ipsam. Sit veritatis in pariatur iste iusto sed. Omnis aut hic perspiciatis dolorem nesciunt.', '1980-05-07', '2017-08-26');
INSERT INTO projects (id, name, customer_id, contractor_id, system_ids, comments, started_at, finished_at) VALUES ('100', 'enim', 4, 4, '{12,13,14,15}', 'Beatae a fuga iste ut quas. Mollitia eum totam et. Veniam recusandae voluptas sint nulla.', '2007-07-26', '2003-04-10');


