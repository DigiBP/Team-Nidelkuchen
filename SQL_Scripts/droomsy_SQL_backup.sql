-- Create Table bookingstatus --
CREATE TABLE bookingstatus (
	businessKey VARCHAR ( 50 ) PRIMARY KEY,
	status VARCHAR (50) NOT NULL,
	userName VARCHAR ( 50 ) NOT NULL,
	assetID VARCHAR ( 50 ),
	startDateTime timestamp,
	endDateTime timestamp,
	pricetotal VARCHAR ( 50 ),
	updated_at timestamp NOT NULL
);


-- Create Table usersearch --
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


-- Create Table assetList --
CREATE TABLE assetList (
	assetID VARCHAR ( 50 ) PRIMARY KEY,
	HostType VARCHAR ( 50 ) NOT NULL,
	HostName VARCHAR ( 100 ) NOT NULL,
	Longitude DECIMAL NOT NULL,
	Latitude DECIMAL NOT NULL,
	HostCategroy VARCHAR ( 100 ),
	adr_street VARCHAR ( 100 ),
	adr_streetNR VARCHAR ( 100 ),
	adr_ZIP VARCHAR ( 100 ),
	adr_City VARCHAR ( 100 ),
	adr_County VARCHAR ( 100 ),
	RoomCategory VARCHAR ( 100 ),
	AvailableFrom  timestamp,
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


--Drop Tables --
Drop table assetList;
Drop table usersearch;
Drop table bookingstatus;


-- INSERT / UPDATE usersearch --
SET TIMEZONE='Europe/Berlin';
DO $$
BEGIN
IF EXISTS (select * from usersearch where businesskey='BK_00XX') THEN
   update usersearch set geolng=3.211, geolat=80.222,updated_at=NOW() where businesskey='BK_00XX';
ELSE
   insert into usersearch values('BK_00XX','USERNAME',6.111,160.222,'2021-05-06 11:00:00','2021-05-06 11:00:00',NOW(),NOW());
END IF;
END $$;


-- INSERT / UPDATE bookingstatus
SET TIMEZONE='Europe/Berlin';
DO $$
BEGIN
IF EXISTS (select * from bookingstatus where businesskey='BK_001') THEN
   update bookingstatus set businessKey='BK_001',status='onHold', userName='username', assetID='assetID', startDateTime='2021-05-07 11:00:00.000000', endDateTime='2021-05-07 11:00:00.000000', pricetotal='10000',updated_at=NOW() where businesskey='BK_001';
ELSE
   insert into bookingstatus values('BK_001','onHold','username2','assetID','2021-05-07 11:00:00.000000','2021-05-07 11:00:00.000000','100000',NOW());
END IF;
END $$;

update bookingstatus set status='booked' where businesskey = 'BK_0040';
select * from bookingstatus;


-- CALCULATE Asset Distance (GeoLoc) --
SELECT assetID,hostname,adr_street,adr_streetnr, adr_zip,adr_city,Longitude,
Latitude, SQRT(
    POW(111.2 * (latitude - 47.3778579), 2) +
    POW(111.2 * (8.5381339 - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM assetlist where ('2021-06-10 14:00:00.000000' BETWEEN AvailableFrom  AND AvailableTo) AND '2021-06-10 16:00:00.000000' BETWEEN  AvailableFrom AND AvailableTo  ORDER BY distance LIMIT 7;


-- CALCULATE Asset Total Price --
SELECT assetid,
roomprice,
cast(bedprice as DECIMAL)*1 as bedprice,
cast(bathprice as DECIMAL)*1 as bathprice,
cast(spaprice as DECIMAL)*1 as spaprice,
cast(gymprice as DECIMAL)*1 as gymprice,
cast(parkingprice as DECIMAL)*1 as parkprice,
cast(roomprice as DECIMAL) + cast(bedprice as DECIMAL)*1 + cast(bathprice as DECIMAL)*1 + cast(spaprice as DECIMAL)*1 + cast(parkingprice as DECIMAL)*1 + cast(gymprice as DECIMAL)*1 AS Total
    FROM assetlist where assetid = '100022';


-- INERST TEST ASSET DATA
INSERT INTO assetList VALUES ('100001','Hotel','Hotel Altstadt',8.54411,47.36936,'3*','Kirchgasse','4','8001','Zürich','Switzerland','SingleStandard','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100002','Hotel','Hotel Altstadt',8.54411,47.36936,'3*','Kirchgasse','4','8001','Zürich','Switzerland','"SingelBusiness"','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100003','Hotel','Hotel Altstadt',8.54411,47.36936,'3*','Kirchgasse','4','8001','Zürich','Switzerland','JuniorSuite','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','30','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100004','Hotel','Hotel Old Town',8.54368,47.37362,'3*','Niederdorfstrasse','17','8001','Zürich','Switzerland','SingleStandard','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','20','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100005','Hotel','Hotel Old Town',8.54368,47.37362,'3*','Niederdorfstrasse','17','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100006','Hotel','Hotel Old Town',8.54368,47.37362,'3*','Niederdorfstrasse','17','8001','Zürich','Switzerland','"DoubleSuperior"','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','28','true','10','true','10','true','5','true','10','false','10');
INSERT INTO assetList VALUES ('100007','Hotel','Hotel Old Town',8.54368,47.37362,'3*','Niederdorfstrasse','17','8001','Zürich','Switzerland','"SingelBusiness"','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','24','true','10','true','10','true','5','true','10','false','10');
INSERT INTO assetList VALUES ('100008','Hotel','Hotel Plattenhof',8.55302,47.3743,'3*','Plattenstrasse','26','8032','Zürich','Switzerland','JuniorSuite','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','29','true','10','true','10','false','5','true','10','false','10');
INSERT INTO assetList VALUES ('100009','Hotel','Hotel Plattenhof',8.55302,47.3743,'3*','Plattenstrasse','26','8032','Zürich','Switzerland','"SingelBusiness"','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','20','true','10','true','10','false','5','true','10','true','10');
INSERT INTO assetList VALUES ('100010','Hotel','Hotel Sorell Rüti',8.54449,47.37616,'3*','Zähringerstrasse','43','8001','Zürich','Switzerland','SingleStandard','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','20','true','10','true','10','true','5','false','10','true','10');
INSERT INTO assetList VALUES ('100011','Hotel','Hotel Sorell Rüti',8.54449,47.37616,'3*','Zähringerstrasse','43','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','30','true','10','true','10','true','5','false','10','true','10');
INSERT INTO assetList VALUES ('100012','Hotel','Hotel Alexander',8.5439,47.37456,'3*','Niederdorfstrasse','40','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:00:00.000000','2021-06-11 12:00:00.000000','23','true','10','true','10','true','5','false','10','true','10');
INSERT INTO assetList VALUES ('100013','Hotel','Hotel Florhof',8.54795,47.37248,'3*','Florhofgasse','4','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','23','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100014','Hotel','Hotel Kindli',8.54069,47.37244,'3*','Pfalzgasse','1','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','23','true','10','true','10','false','5','false','10','false','10');
INSERT INTO assetList VALUES ('100015','Hotel','Hotel Royal Zürich',8.54502,47.37898,'3*','Leonhardstrasse','6','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','23','true','10','true','10','false','5','false','10','true','10');
INSERT INTO assetList VALUES ('100016','Hotel','Hotel Adler',8.54366,47.37319,'3*','Rosengasse','10','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','false','5','false','10','true','10');
INSERT INTO assetList VALUES ('100017','Hotel','Hotel Felix Zürich',8.54454,47.37523,'3*','Zähringerstrasse','25','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','false','5','false','10','true','10');
INSERT INTO assetList VALUES ('100018','Hotel','Hotel Leoneck Swiss Hotel',8.54514,47.37918,'3*','Leonhardstrasse','1','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 13:30:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','false','5','false','10','true','10');
INSERT INTO assetList VALUES ('100019','Hotel','Hotel Platzhirsch',8.544,47.37352,'3*','Spitalgasse','3','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 14:00:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','false','5','false','10','false','10');
INSERT INTO assetList VALUES ('100020','Hotel','Hotel Rösli',8.54443,47.36924,'3*','Rösligasse','7','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 14:00:00.000000','2021-06-11 12:00:00.000000','25','true','10','true','10','false','5','false','10','false','10');
INSERT INTO assetList VALUES ('100021','Hotel','Hotel Scheuble',8.54488,47.37444,'3*','Mühlegasse','17','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 14:00:00.000000','2021-07-11 17:00:00.000000','25','true','10','true','10','false','5','false','10','false','10');
INSERT INTO assetList VALUES ('100022','Hotel','Hotel Townhouse',8.54007,47.37631,'3*','Schützengasse','7','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 14:00:00.000000','2021-07-11 17:00:00.000000','25','true','10','true','10','false','5','false','10','false','10');
INSERT INTO assetList VALUES ('100023','Hotel','Hotel Walhalla Zürich',8.53721,47.38028,'3*','Limmatstrasse','5','8005','Zürich','Switzerland','DoubleStandard','2021-06-10 14:00:00.000000','2021-07-11 17:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100024','Hotel','Hotel Zürcherhof Beste Western Plus',8.54433,47.37568,'3*','Zähringerstrasse','21','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 14:15:00.000000','2021-07-11 17:00:00.000000','25','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100025','Hotel','Hotel California',8.5446,47.36872,'3*','Schifflände','18','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 14:15:00.000000','2021-07-11 17:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100026','Hotel','Hotel Garni Bristol ',8.54349,47.37967,'3*','Stampfenbachstrasse','34','8006','Zürich','Switzerland','DoubleBusiness','2021-06-10 14:15:00.000000','2021-07-11 17:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100027','Hotel','Hotel Hirschen',8.54367,47.3734,'3*','Niederdorfstrasse','13','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100028','Hotel','Hotel St. Josef',8.5458,47.37534,'3*','Hirschengraben','64','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','27','true','10','true','10','true','5','false','10','false','10');
INSERT INTO assetList VALUES ('100029','Hotel','Hotel Savoy Baur en Ville',8.53961,47.36997,'5*','Poststrasse','12','8001','Zürich','Switzerland','SingleStandard','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','30','true','12','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100030','Hotel','Hotel Savoy Baur en Ville',8.53961,47.36997,'5*','Poststrasse','12','8001','Zürich','Switzerland','SingleStandard','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','31','true','12','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100031','Hotel','Hotel Savoy Baur en Ville',8.53961,47.36997,'5*','Poststrasse','12','8001','Zürich','Switzerland','"DoubleStandard"','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','33','true','15','true','17','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100032','Hotel','Hotel Savoy Baur en Ville',8.53961,47.36997,'5*','Poststrasse','12','8001','Zürich','Switzerland','"DoubleBusiness"','2021-06-10 14:45:00.000000','2021-07-11 17:00:00.000000','35','true','17','true','17','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100033','Hotel','Hotel Schweizerhof',8.53945,47.37697,'4*','Bahnhofplatz','7','8001','Zürich','Switzerland','SingleStandard','2021-06-10 14:45:00.000000','2021-08-19 15:00:00.000000','30','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100034','Hotel','Hotel Sorell St. Peter',8.54066,47.3708,'4*','In Gassen','10','8001','Zürich','Switzerland','SingleStandard','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','30','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100035','Hotel','Hotel Central Plaza',8.5436,47.37703,'4*','Central','1','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','32','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100036','Hotel','Hotel EMA House Suites',8.54449,47.37616,'4*','Nordstrasse','1','8006','Zürich','Switzerland','SingleStandard','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','32','true','12','true','12','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100037','Hotel','Hotel EMA House Suites',8.54449,47.37616,'4*','Nordstrasse','1','8006','Zürich','Switzerland','DoubleStandard','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','34','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100038','Hotel','Hotel Storchen',8.54169,47.3718,'5*','Weinplatz','2','8001','Zürich','Switzerland','DoubleStandard','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','32','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100039','Hotel','Hotel Glockenhof Zürich',8.53685,47.37319,'4*','Sihlstrasse','31','8001','Zürich','Switzerland','DoubleSuperior','2021-06-10 15:00:00.000000','2021-08-19 15:00:00.000000','34','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100040','Hotel','Hotel Wellenberg',8.54393,47.37306,'4*','Niederdorfstrasse','10','8001','Zürich','Switzerland','DoubleSuperior','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','34','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100041','Hotel','Hotel Helmhaus',8.54406,47.36914,'4*','Schifflände','30','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','36','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100042','Hotel','Hotel St. Gothard',8.53939,47.37641,'4*','Bahnhofstrasse','87','8001','Zürich','Switzerland','DoubleBusiness','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','36','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100043','Hotel','Hotel Widder',8.53986,47.37253,'5*','Rennweg','7','8001','Zürich','Switzerland','DoubleSuperior','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','36','true','15','true','15','false','8','true','10','true','10');
INSERT INTO assetList VALUES ('100044','Hotel','Hotel Marktgasse',8.54368,47.37201,'4*','Marktgasse','17','8001','Zürich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100045','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zürich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100046','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100047','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100048','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100049','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100050','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100051','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100052','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
INSERT INTO assetList VALUES ('100053','Hotel','Hotel Marriott Zürich',8.54066,47.38254,'5*','Neumühlequai','42','8006','Zurich','Switzerland','JuniorSuite','2021-06-10 16:00:00.000000','2021-08-19 15:00:00.000000','40','true','15','true','15','true','8','true','10','true','10');
