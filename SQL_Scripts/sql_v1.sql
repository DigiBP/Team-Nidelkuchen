CREATE TABLE usersearch (
	businessKey VARCHAR ( 50 ) PRIMARY KEY,
	userName VARCHAR ( 50 ) NOT NULL,
	geoLng VARCHAR ( 50 ),
	geoLat VARCHAR ( 50 ),
	startDateTime timestamp,
	endDateTime timestamp,
	created_on timestamp NOT NULL,
	updated_at timestamp NOT NULL
);
DROP Table usersearch;

select * from usersearch;

---------------------------------------

CREATE TABLE assetList (
	assetID VARCHAR ( 50 ) PRIMARY KEY,
	HostType VARCHAR ( 50 ) NOT NULL,
	HostName VARCHAR ( 100 ) NOT NULL,
	Longitude VARCHAR ( 100 ) NOT NULL,
	Latitude VARCHAR ( 100 ) NOT NULL,
	HostCategroy VARCHAR ( 100 ),
	adr_street VARCHAR ( 100 ),
	adr_streetNR VARCHAR ( 100 ),
	adr_ZIP VARCHAR ( 100 ),
	adr_City VARCHAR ( 100 ),
	adr_County VARCHAR ( 100 ),
	RoomCategory VARCHAR ( 100 ),
	AvailabeFrom timestamp,
	AvailableTo timestamp,
	RoomPrice VARCHAR ( 100 ),
	Bed Boolean,
	BedPrice VARCHAR ( 100 ),
	Bath Boolean,
	BathPrice VARCHAR ( 100 ),
	Parking Boolean,
	ParkingPrice VARCHAR ( 100 ),
	Gym Boolean,
	GymPrice VARCHAR ( 100 ),
	Spa Boolean,
	SpaPrice VARCHAR ( 100 )
);

drop table assetList
select * from assetList


INSERT INTO assetList
VALUES (value1, value2, value3, ...);

INSERT INTO assetList VALUES ('100001','Hotel','Hotel Altstadt','47,36936','8,54411','3*','Kirchgasse','4','8001','Zürich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100002','Hotel','Hotel Old Town','47,37362','8,54368','3*','Niederdorfstrasse','17','8001','Zürich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100003','Hotel','Hotel Plattenhof','47,3743','8,55302','3*','Plattenstrasse','26','8032','Zurich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100004','Hotel','Hotel Sorell Rüti','47,37616','8,54449','3*','Zähringerstrasse','43','8001','Zurich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100005','Hotel','Hotel Alexander','47,37456','8,5439','3*','Niederdorfstrasse','40','8001','Zürich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','23','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100006','Hotel','Hotel Florhof','47,37248','8,54795','3*','Florhofgasse','4','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','23','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100007','Hotel','Hotel Kindli','47,37244','8,54069','3*','Pfalzgasse','1','8001','Zürich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','23','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100008','Hotel','Hotel Royal Zürich','47,37898','8,54502','3*','Leonhardstrasse','6','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','23','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100009','Hotel','Hotel Adler','47,37319','8,54366','3*','Rosengasse','10','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100010','Hotel','Hotel Felix Zürich','47,37523','8,54454','3*','Zähringerstrasse','25','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100011','Hotel','Hotel Leoneck Swiss Hotel','47,37918','8,54514','3*','Leonhardstrasse','1','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100012','Hotel','Hotel Platzhirsch','47,37352','8,544','3*','Spitalgasse','3','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100013','Hotel','Hotel Rösli','47,36924','8,54443','3*','Rösligasse','7','8001','Zürich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100014','Hotel','Hotel Scheuble','47,37444','8,54488','3*','Mühlegasse','17','8001','Zürich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100015','Hotel','Hotel Townhouse','47,37631','8,54007','3*','Schützengasse','7','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100016','Hotel','Hotel Walhalla Zürich','47,38028','8,53721','3*','Limmatstrasse','5','8005','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100017','Hotel','Hotel Zürcherhof Beste Western Plus','47,37568','8,54433','3*','Zähringerstrasse','21','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100018','Hotel','Hotel California','47,36872','8,5446','3*','Schifflände','18','8001','Zürich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100019','Hotel','Hotel Garni Bristol ','47,37967','8,54349','3*','Stampfenbachstrasse','34','8006','Zurich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100020','Hotel','Hotel Hirschen','47,3734','8,54367','3*','Niederdorfstrasse','13','8001','Zurich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100021','Hotel','Hotel St. Josef','47,37534','8,5458','3*','Hirschengraben','64','8001','Zurich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100022','Hotel','Hotel Savoy Baur en Ville','47,36997','8,53961','5*','Poststrasse','12','8001','Zurich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','30','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100023','Hotel','Hotel Schweizerhof','47,37697','8,53945','4*','Bahnhofplatz','7','8001','Zurich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','30','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100024','Hotel','Hotel Sorell St. Peter','47,3708','8,54066','4*','In Gassen','10','8001','Zürich','Switzerland','SingleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','30','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100025','Hotel','Hotel Central Plaza','47,37703','8,5436','4*','Central','1','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','32','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100026','Hotel','Hotel EMA House Suites','47,37616','8,54449','4*','Nordstrasse','1','8006','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','32','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100027','Hotel','Hotel Storchen','47,3718','8,54169','5*','Weinplatz','2','8001','Zurich','Switzerland','DoubleStandard','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','32','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100028','Hotel','Hotel Glockenhof Zürich','47,37319','8,53685','4*','Sihlstrasse','31','8001','Zurich','Switzerland','DoubleSuperior','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','34','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100029','Hotel','Hotel Wellenberg','47,37306','8,54393','4*','Niederdorfstrasse','10','8001','Zurich','Switzerland','DoubleSuperior','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','34','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100030','Hotel','Hotel Helmhaus','47,36914','8,54406','4*','Schifflände','30','8001','Zürich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','36','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100031','Hotel','Hotel St. Gothard','47,37641','8,53939','4*','Bahnhofstrasse','87','8001','Zurich','Switzerland','DoubleBusiness','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','36','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100032','Hotel','Hotel Widder','47,37253','8,53986','5*','Rennweg','7','8001','Zurich','Switzerland','DoubleSuperior','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','36','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100033','Hotel','Hotel Marktgasse','47,37201','8,54368','4*','Marktgasse','17','8001','Zurich','Switzerland','JuniorSuite','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100034','Hotel','Hotel Marriott Zürich','47,38254','8,54066','5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-05-06 13:00:00.000000','2021-06-06 13:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');