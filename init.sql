--user role
insert into USER_ROLE values (0,'Organizer');
insert into USER_ROLE values (1,'Coach');
insert into USER_ROLE values (2,'Guest');
--Country
Insert into COUNTRY values(0,'China',86);
Insert into COUNTRY values(1,'U.S.A',1);
Insert into COUNTRY values(2,'Spain',34);
Insert into COUNTRY values(3,'Australia',61);
Insert into COUNTRY values(4,'Singapore',65);
Insert into COUNTRY values(5,'Siberia',381);
Insert into COUNTRY values(6,'Japan',81);
Insert into COUNTRY values(7,'South Korea',82);
Insert into COUNTRY values(8,'Sweden',46);
Insert into COUNTRY values(9,'Germany',49);
Insert into COUNTRY values(10,'Austria',43);
Insert into COUNTRY values(11,'North Korea',850);
Insert into COUNTRY values(12,'Hong Kong China',852);
Insert into COUNTRY values(13,'Serbia',383);
Insert into COUNTRY values(14,'Chile',56);
Insert into COUNTRY values(15,'Russia',7);
Insert into COUNTRY values(16,'Ukraine',380);
Insert into COUNTRY values(17,'Belarus',375);
Insert into COUNTRY values(18,'Chinese TaiPei',886);
Insert into COUNTRY values(19,'Denmark',45);
Insert into COUNTRY values(20,'Switzerland',41);
Insert into COUNTRY values(21,'Argentina',54);
Insert into COUNTRY values(22,'Czech Republic',420);
Insert into COUNTRY values(23,'United Kingdom',44);
Insert into COUNTRY values(24,'France',33);
--MEDAL
INSERT INTO MEDAL values (1,'Gold',3);
INSERT INTO MEDAL values (2,'Sliver',2);
INSERT INTO MEDAL values (3,'Bronze',1);
--OLYMPICS GAMES
insert into OLYMPICS values(0,'XXXI','Rio de Janeiro',TO_DATE('05-08-2016','dd/mm/yyyy hh24:mi:ss'),TO_DATE('21-08-2016','dd/mm/yyyy  hh24:mi:ss'),'https://www.olympic.org/rio-2016');
insert into OLYMPICS values(1,'XXX','London' ,TO_DATE('21-07-2012','dd/mm/yyyy  hh24:mi:ss'),TO_DATE('2012/12/8','yyyy/dd/mm hh24:mi:ss'),'https://www.olympic.org/london-2012');
insert into OLYMPICS values(2,'XXIX','Beijing',TO_DATE(' 2008/8/8','yyyy/mm/dd hh24:mi:ss'),TO_DATE('24-08-2008','dd/mm/yyyy hh24:mi:ss'),'https://www.olympic.org/beijing-2008');
insert into OLYMPICS values(3,'XXVIII','Athens',TO_DATE('13-08-2004','dd/mm/yyyy  hh24:mi:ss'),TO_DATE('29-08-2004','dd/mm/yyyy hh24:mi:ss'),'https://www.olympic.org/athens-2004');
commit ;

drop sequence sport_id_s;
create sequence sport_id_s
start with 0
increment by 1
nomaxvalue
minvalue 0
nocycle ;
--sport
insert into SPORT values (sport_id_s.nextval,'Basketball','Basketball at the Summer Olympics has been a sport for men since 1936',To_DATE('1936','yyyy') ,5);
insert into SPORT values (sport_id_s.nextval,'Swimming','Swimming has been a sport at every modern Summer Olympics.',To_DATE('1896','yyyy') ,1);
insert into SPORT values (sport_id_s.nextval,'Table Tennis','Table tennis is among the sports contested at the Summer Olympic Games. ',To_DATE('1988','yyyy') ,1);
insert into SPORT values (sport_id_s.nextval,'Tennis','The sport can be played by anyone who can hold a racket',To_DATE('1896','yyyy') ,1);
drop sequence venue_id_s;
create sequence venue_id_s
start with 0
increment by 1
nomaxvalue
minvalue 0
nocycle ;
--venue
insert into VENUE values(venue_id_s.nextval,0,'Carioca Arena 1',38);
insert into VENUE values(venue_id_s.nextval,0,'Riocentro - Pavilion 3',172);
insert into VENUE values(venue_id_s.nextval,1,'ExCeL London',166);
insert into VENUE values(venue_id_s.nextval,2,'Peking University Gymnasium',47);
insert into venue values(venue_id_s.nextval,3,'Galatsi Olympic Hall',50);
insert into venue values(venue_id_s.nextval,2,'Olympic Green Tennis Center',4);
insert into venue values(venue_id_s.nextval,1,'England Tennis & Croquet Club',5);
insert into venue values(venue_id_s.nextval,0,'Olympic Tennis Centre',5);
insert into venue values(venue_id_s.nextval,3,'Athens Olympic Tennis Centre',4);
commit ;

DROP SEQUENCE User_account_id;
create sequence User_account_id
start with 0
increment by 1
minvalue 0
nomaxvalue
nocycle ;

INSERT INTO USER_ACCOUNT values(User_account_id.nextval,'Carlos Arthur Nuzman','Rio',0,null);
INSERT INTO USER_ACCOUNT values(User_account_id.nextval,'Gianna Angelopoulos','Athen',0,null);
INSERT INTO USER_ACCOUNT values(User_account_id.nextval,'Hu Jintao','Beijing',0,null);
INSERT INTO USER_ACCOUNT values(User_account_id.nextval,'Sebastian Coe','London',0,null);
insert into PARTICIPANT values(0,'Ricky','Rubio','Spanish ','El Masnou, Catalonia, Spain',TO_DATE(' 1990/10/21','yyyy/mm/dd hh24:mi:ss'));
insert into USER_ACCOUNT values(User_account_id.nextval,'Ricky','GUEST',2,null);

insert into PARTICIPANT values(1,'Nikola','Mirotic','Spanish','Titograd, SR Montenegro,Yugoslavia',TO_DATE('1991/11/02','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Nikola','GUEST',2,null);

insert into PARTICIPANT values(2,'Pau','Gasol','Spanish ','Barcelona, Spain
',TO_DATE(' 1980/7/6','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Pau','GUEST',2,null);

insert into PARTICIPANT values(3,'Rudy','Ferandez','Spanish','Palma de Mallorca, Spain
',TO_DATE(' 1985/4/4','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Rudy','GUEST',2,null);

insert into PARTICIPANT values(4,'Jose','Calderon','Spanish','Villanueva de la Serena, Spain
',TO_DATE(' 1981/9/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jose','GUEST',2,null);

insert into PARTICIPANT values(5,'Willy','Hernangomez','Spanish','Madrid, Spain
',TO_DATE(' 1994/5/27','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Willy','GUEST',2,null);

insert into PARTICIPANT values(6,'Sergio','Scariolo','Italian ','Brescia, Italy',TO_DATE(' 1961/4/1','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sergio','SS',1,null);

insert into PARTICIPANT values(7,'Patty','Miles','Australian ','Canberra, Australia
',TO_DATE(' 1988/8/11','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Patty','GUEST',2,null);

insert into PARTICIPANT values(8,'Andrew','Bogut','Australian ','Melbourne, Victoria',TO_DATE(' 1984/11/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Andrew','GUEST',2,null);

insert into PARTICIPANT values(9,'Joe','Ingles','Australian ','Adelaide, South Australia',TO_DATE(' 1987/10/2','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Joe','GUEST',2,null);

insert into PARTICIPANT values(10,'Matthew ','Dellavedova','Australian ','Maryborough, Victoria',TO_DATE(' 1990/9/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Matthew ','GUEST',2,null);

insert into PARTICIPANT values(11,'Ryan','Broekhoff','Australian ','Melbourne, Victoria
',TO_DATE(' 1990/8/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ryan','GUEST',2,null);

insert into PARTICIPANT values(12,'Chris','Goulding','Australian ','Launceston, Tasmania',TO_DATE(' 1988/10/24','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Chris','GUEST',2,null);

insert into PARTICIPANT values(13,'Aron','Baynes','Australian ','Gisborne, New Zealand',TO_DATE(' 1986/12/9','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Aron','GUEST',2,null);

insert into PARTICIPANT values(14,'Andrej','Lemanis','Australian ','Melbourne, Victoria',TO_DATE(' 1969/3/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Andrej','AL',1,null);

insert into PARTICIPANT values(15,'Jimmy ','Butler','American','Houston, Texas,U.S.',TO_DATE(' 1989/9/14','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jimmy ','GUEST',2,null);

insert into PARTICIPANT values(16,'Kevin','Durant','American','Suitland, Maryland, U.S.',TO_DATE(' 1988/9/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kevin','GUEST',2,null);

insert into PARTICIPANT values(17,'DeAndre','Jordan','American','Houston, Texas,U.S.',TO_DATE(' 1988/7/21','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'DeAndre','GUEST',2,null);

insert into PARTICIPANT values(18,'Kyle','Lowry','American','Philadelphia, Pennsylvania, U.S.',TO_DATE(' 1986/3/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kyle','GUEST',2,null);

insert into PARTICIPANT values(19,'Harrison','Barnes','American','Ames, Iowa, U.S.',TO_DATE(' 1992/5/30','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Harrison','GUEST',2,null);

insert into PARTICIPANT values(20,'Kyrie','Irving','American','Melbourne, Australia',TO_DATE(' 1992/3/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kyrie','GUEST',2,null);

insert into PARTICIPANT values(21,'Mike','Krzyzewski','American','Chicago, Illinois',TO_DATE(' 1947/2/13','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Mike','MK',1,null);

insert into PARTICIPANT values(22,'Milos','Teodosic','Siberian ','Valjevo, Yugoslavia',TO_DATE(' 1987/3/19','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Milos','GUEST',2,null);

insert into PARTICIPANT values(23,'Simonovi?','Marko','Siberian ','Pri?tina, SR Serbia, SFR Yugoslavia',TO_DATE(' 1986/5/30','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Simonovi?','GUEST',2,null);

insert into PARTICIPANT values(24,'Bogdanovi?','Bogdan','Siberian ','Belgrade, Serbia, FR Yugoslavia
',TO_DATE(' 1992/8/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Bogdanovi?','GUEST',2,null);

insert into PARTICIPANT values(25,'Markovi?','Stefan','Siberian ','Belgrade, SR Serbia,
SFR Yugoslavia
',TO_DATE(' 1988/4/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Markovi?','GUEST',2,null);

insert into PARTICIPANT values(26,'Joki?','Nikola','Siberian ','Sombor, Serbia, FR Yugoslavia
',TO_DATE(' 1995, February 19','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Joki?','GUEST',2,null);

insert into PARTICIPANT values(27,'Aleksandar','?or?evi?','Siberian ','Belgrade, SR Serbia,
SFR Yugoslavia',TO_DATE(' 1967/8/26','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Aleksandar','A?',1,null);

insert into PARTICIPANT values(28,'Long','Ma','Chinese','Anshan, Liaoning, China
',TO_DATE(' 1988/10/20 ','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Long','GUEST',2,null);

insert into PARTICIPANT values(29,'Xiaoxia','Li','Chinese','Anshan, Liaoning, China
',TO_DATE('1988/01/16 ','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Xiaoxia','GUEST',2,null);

insert into PARTICIPANT values(30,'Ai','Fukuhara','Japanses','Sendai, Japan
',TO_DATE(' 1988/11/1','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ai','GUEST',2,null);

insert into PARTICIPANT values(31,'Ning','Ding','Chinese','Daqing, Heilongjiang, China
',TO_DATE(' 1990/6/20','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ning','GUEST',2,null);

insert into PARTICIPANT values(32,' June ','Mizutani','Japanese','Iwata, Shizuoka, Japan
',TO_DATE(' 1989/6/9','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,' June ','GUEST',2,null);

insert into PARTICIPANT values(33,'Guoliang','Liu','chinese','Xinxinag,Henan,China',TO_DATE(' 1976,January 10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Guoliang','GL',1,null);

insert into PARTICIPANT values(34,'Murakami','Yasukazu','Japanese','Hiroshima Prefecture Onomichi',TO_DATE(' 1957/12/9','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Murakami','MY',1,null);

insert into PARTICIPANT values(35,'Linghui','Kong','Chinese','Harbin,?Heilongjiang,?China',TO_DATE(' 1975/10/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Linghui','LK',1,null);

insert into PARTICIPANT values(36,'Sayka','Hirano','Japanese','Kanuma, Tochigi, Japan',TO_DATE('1985,March 24','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sayka','GUEST',2,null);

insert into PARTICIPANT values(37,'Kim','Taek-soo','South Korea','South Korea',TO_DATE(' 1970/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kim','KT',1,null);

insert into PARTICIPANT values(38,'Yeseo','Dang','South Korea','Changchun, Jilin, China',TO_DATE(' 1981, April 27','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Yeseo','GUEST',2,null);

insert into PARTICIPANT values(39,'Kyung','Ah Kim','South Korea','Daejeon, South Korea',TO_DATE(' 1977,May 25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kyung','GUEST',2,null);

insert into PARTICIPANT values(40,'Junhong','Jing','Chinese','Shanghai, China',TO_DATE(' 1968/10/13','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Junhong','JJ',1,null);

insert into PARTICIPANT values(41,'Jiawei','Li','Singapore','Beijing, China',TO_DATE('1981, August 9, ','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jiawei','GUEST',2,null);

insert into PARTICIPANT values(42,'Yuegu','Wang','Singapore','Anshan, China',TO_DATE(' 1980, June 10,','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Yuegu','GUEST',2,null);

insert into PARTICIPANT values(43,'Jike','Zhang','chinese','Qingdao, China',TO_DATE(' 1988, February 16','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jike','GUEST',2,null);

insert into PARTICIPANT values(44,'Sangeun','OH','South Korea','Daegu, South Korea',TO_DATE(' 1977,May 25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sangeun','GUEST',2,null);

insert into PARTICIPANT values(45,'Sae ','Hyuk Joo','South Korea','Seoul, South Korea
',TO_DATE(' 1980/01/20','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sae ','GUEST',2,null);

insert into PARTICIPANT values(46,'Hao','Wang','chinese','Changchun, China',TO_DATE(' 1983/12/15','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Hao','GUEST',2,null);

insert into PARTICIPANT values(47,'Tianwei ','Feng','singapore','Harbin, China',TO_DATE(' 1988, February 16','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Tianwei ','GUEST',2,null);

insert into PARTICIPANT values(48,'Kasumi','Ishikawa','Japanese','Yamaguchi, Yamaguchi, Japan',TO_DATE(' 1993/2/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kasumi','GUEST',2,null);

insert into PARTICIPANT values(49,'Ma','Lin','chinese','Shenyang, China',TO_DATE(' 1980/02/19','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ma','GUEST',2,null);

insert into PARTICIPANT values(50,'Jan-Ove','Waldner','Swedish','Stockholm, Sweden',TO_DATE(' 1965/10/3','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jan-Ove','GUEST',2,null);

insert into PARTICIPANT values(51,'J?rgen','Persson','Swedish','Halmstad, Sweden',TO_DATE(' 1965/10/3','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'J?rgen','GUEST',2,null);

insert into PARTICIPANT values(52,'Liqin','Wang','chinese','Shanghai, China',TO_DATE('  1978/6/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Liqin','GUEST',2,null);

insert into PARTICIPANT values(53,'Dimitrij','Ovcharov','Germany','Dieburg, Hessen, Germany',TO_DATE(' 1969/5/22','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Dimitrij','DO',1,null);

insert into PARTICIPANT values(54,'Dimitrij ','OVTCHAROV','Germany','Dieburg, Hessen, Germany',TO_DATE(' 1969/5/22','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Dimitrij ','GUEST',2,null);

insert into PARTICIPANT values(55,'Timo','BOLL','Germany','Erbach, Hessen, West Germany',TO_DATE(' 1981/3/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Timo','GUEST',2,null);

insert into PARTICIPANT values(56,'Werner','Schlager','Austrian','Wiener Neustadt, Austria',TO_DATE(' 1972/9/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Werner','GUEST',2,null);

insert into PARTICIPANT values(57,'Martha','Komu','Austrian','Austrian',TO_DATE(' 1972/9/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Martha','GUEST',2,null);

insert into PARTICIPANT values(58,'Robert','Gardos','Austrian','Budapest, Hungary',TO_DATE(' 1979/1/16','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Robert','GUEST',2,null);

insert into PARTICIPANT values(59,'Seungmin','RYU','South Korea',' Seoul, South Korea',TO_DATE(' 1982/8/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Seungmin','GUEST',2,null);

insert into PARTICIPANT values(60,'Yining','Zhang','chinese','Beijing, China',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Yining','GUEST',2,null);

insert into PARTICIPANT values(61,'Nan','Wang','chinese','Fushun, China',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Nan','GUEST',2,null);

insert into PARTICIPANT values(62,'Guo','Yue','chinese','Anshan, Liaoning, China
',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Guo','GUEST',2,null);

insert into PARTICIPANT values(63,'Wei','Wei','Singapore','null',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Wei','GUEST',2,null);

insert into PARTICIPANT values(64,'Kim','Hyang-mi','North Korea','Pyongyang, North Korea',TO_DATE(' 1979/9/19','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kim','GUEST',2,null);

insert into PARTICIPANT values(65,'Kim','Taek Soo','North Korea',' South Korea',TO_DATE(' 1968/6/4','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kim','KT',1,null);

insert into PARTICIPANT values(66,'Qi','Chen','chinese','Nantong, China',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Qi','GUEST',2,null);

insert into PARTICIPANT values(67,' Kong-wah','Chan','Hong Kong','Guangdong,China',TO_DATE(' 1961/08/31','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,' Kong-wah',' C',1,null);

insert into PARTICIPANT values(68,'Chak Ko','Lai','Hong Kong','?Foshan, Guangdong, China',TO_DATE(' 1976/5/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Chak Ko','GUEST',2,null);

insert into PARTICIPANT values(69,'Ching','Li','Hong Kong','Doumen,?Zhuhai, Guangdong, China',TO_DATE(' 1975/3/7','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ching','GUEST',2,null);

insert into PARTICIPANT values(70,'Eun Sil','Lee','South Korea','South Korea',TO_DATE(' 1976/12/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Eun Sil','GUEST',2,null);

insert into PARTICIPANT values(71,'Eun Mi','Seok','South Korea','South Korea',TO_DATE(' 1976/12/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Eun Mi','GUEST',2,null);

insert into PARTICIPANT values(72,'Jianfeng','Niu','chinese','Baoding,?Hebei,China',TO_DATE(' 1981/10/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Jianfeng','GUEST',2,null);

insert into PARTICIPANT values(73,'Bok Rae ','Kim','South Korea','South Korea',TO_DATE(' 1977/5/3','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Bok Rae ','GUEST',2,null);

insert into PARTICIPANT values(74,' Kyung Ah','Kim','south Korea','Daejeon,?South Korea',TO_DATE(' 1977/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,' Kyung Ah','GUEST',2,null);

insert into PARTICIPANT values(75,'Djokovic','Novak','Serbian','Belgrade, SR Serbia
',TO_DATE(' 1987/5/22','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Djokovic','GUEST',2,null);

insert into PARTICIPANT values(76,'Gonz芍lez','Fernando','Chilean','Santiago, Chile',TO_DATE(' 1980/7/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Gonz芍lez','GUEST',2,null);

insert into PARTICIPANT values(77,'Nadal','Rafael','Spainish','Manacor, Mallorca, Spain',TO_DATE(' 1986/6/3','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Nadal','GUEST',2,null);

insert into PARTICIPANT values(78,'Blake','James','American','Yonkers, New York, United States',TO_DATE(' 1979/12/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Blake','GUEST',2,null);

insert into PARTICIPANT values(79,'Williams','Serena','American','Michigan, United States',TO_DATE(' 1987/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Williams','GUEST',2,null);

insert into PARTICIPANT values(80,'Williams','Venus','American','Lynwood, California, U.S.',TO_DATE(' 1978/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Williams','GUEST',2,null);

insert into PARTICIPANT values(81,'Garrigues','Anabel','Spainish','Valencia, Spain',TO_DATE(' 1977/5/21','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Garrigues','GUEST',2,null);

insert into PARTICIPANT values(82,'Pascual','Virginia','Spainish','Madrid, Spain
',TO_DATE(' 1977/5/22','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Pascual','GUEST',2,null);

insert into PARTICIPANT values(83,'Yan','Zi','chinese','Chengdu, Sichuan',TO_DATE(' 1977/5/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Yan','GUEST',2,null);

insert into PARTICIPANT values(84,'Zheng','Jie','Hong Kong, China','Chengdu, Sichuan',TO_DATE(' 1977/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Zheng','GUEST',2,null);

insert into PARTICIPANT values(85,'Bondarenko','Alona','Ukrainian','Kryvyi Rih, Ukrainian SSR, Soviet Union',TO_DATE(' 1997/5/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Bondarenko','GUEST',2,null);

insert into PARTICIPANT values(86,'Kateryna','Bondarenko','Ukrainian','Kryvyi Rih, Ukrainian SSR, Soviet Union',TO_DATE(' 1989/5/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kateryna','GUEST',2,null);

insert into PARTICIPANT values(87,'Vladimir','Samsonov','Belarus','Minsk, Belarus',TO_DATE(' 1976/4/17','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Vladimir','VS',1,null);

insert into PARTICIPANT values(88,'Alexandre','PETKEVITCH','Belarus','Belarus',TO_DATE(' 1956/8/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Alexandre','GUEST',2,null);

insert into PARTICIPANT values(90,'Kim','SongI','North Korea','Phyongchon District, Pyongyang',TO_DATE(' 1994/8/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kim','GUEST',2,null);

insert into PARTICIPANT values(91,'Maharu','Yoshimura','Japanese','Ibaraki Prefecture, Japan',TO_DATE(' 1993/8/3','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Maharu','GUEST',2,null);

insert into PARTICIPANT values(92,'Chih-Yuan','Chuang','Taiwan','Kaohsiung, Taiwan',TO_DATE(' 1981/4/2','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Chih-Yuan','GUEST',2,null);

insert into PARTICIPANT values(93,'jiing','xu','taiwan','Liaoning,China',TO_DATE(' 1968/1/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'jiing','GUEST',2,null);

insert into PARTICIPANT values(94,'Michael','Maze','Denmark','Faxe, Denmark',TO_DATE(' 1981/9/1','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Michael','GUEST',2,null);

insert into PARTICIPANT values(95,'Finn','Tugwell','Denmark','Aarhus, Denmark',TO_DATE('  1976/3/18','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Finn','GUEST',2,null);

insert into PARTICIPANT values(96,'Yuxiang','Li','Chinese','China',TO_DATE(' 1964/8/13','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Yuxiang','GUEST',2,null);

insert into PARTICIPANT values(97,'Dmitry','Mazunov','Russian','Nizhny Novgorod,Soviet Union',TO_DATE(' 1971/5/12','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Dmitry','GUEST',2,null);

insert into PARTICIPANT values(98,'Alexey','Smirnov','Russian','Russia',TO_DATE(' 1977/10/9','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Alexey','GUEST',2,null);

insert into PARTICIPANT values(99,'Nikolay','Kharitonov','Russian','Rezino, Novosibirsk Oblast, Soviet Union',TO_DATE(' 1948/10/30','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Nikolay','NK',1,null);

insert into PARTICIPANT values(100,'Bo','Persson','Swedish','Sweden',TO_DATE(' 1955/10/30','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Bo','BP',1,null);

insert into PARTICIPANT values(101,'MURRAY ','Andy ','British','Glasgow, Scotland, UK',TO_DATE(' 1987/5/15','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'MURRAY ','GUEST',2,null);

insert into PARTICIPANT values(102,'Federer','Roger ','Swiss','Basel, Switzerland',TO_DATE(' 1981/8/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Federer','GUEST',2,null);

insert into PARTICIPANT values(103,'del Potro','Juan',' Argentina','Tandil, Argentina',TO_DATE(' 1988/9/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'del Potro','GUEST',2,null);

insert into PARTICIPANT values(104,'Hradeck芍','Lucie','Czech','Prague, Czechoslovakia',TO_DATE(' 1985/5/21','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Hradeck芍','GUEST',2,null);

insert into PARTICIPANT values(105,'Hlav芍?kov芍','Andrea','Czech','Plze防, Czechoslovakia',TO_DATE(' 1986/8/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Hlav芍?kov芍','GUEST',2,null);

insert into PARTICIPANT values(106,'Petrova','Nadia','Russian','Moscow, Soviet Union',TO_DATE(' 1982/6/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Petrova','GUEST',2,null);

insert into PARTICIPANT values(107,'Kirilenko','Maria ','Russian','Moscow, Russian SFSR, Soviet Unionn',TO_DATE(' 1987/1/25','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kirilenko','GUEST',2,null);

insert into PARTICIPANT values(108,'Huber','Liezel
','American','Durban, South Africa',TO_DATE(' 1976/8/21','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Huber','GUEST',2,null);

insert into PARTICIPANT values(109,'Raymond','Lisa','American','Norristown, Pennsylvania, United States',TO_DATE(' 1973/8/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Raymond','GUEST',2,null);

insert into PARTICIPANT values(110,'Nishikori','
Kei ','Japanese','Matsue, Shimane, Japan',TO_DATE(' 1989/12/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Nishikori','GUEST',2,null);

insert into PARTICIPANT values(111,'?af芍?ov芍','Lucie','Czech','Brno, Czechoslovakia',TO_DATE(' 1987/2/4','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'?af芍?ov芍','GUEST',2,null);

insert into PARTICIPANT values(112,'Str?cov芍','Barbora','Czech','Plze防, Czechoslovakia',TO_DATE(' 1986/3/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Str?cov芍','GUEST',2,null);

insert into PARTICIPANT values(113,'Vesnina','Elena','Russian','Lviv, Ukraine SSR, Soviet Union',TO_DATE(' 1986/8/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Vesnina','GUEST',2,null);

insert into PARTICIPANT values(114,'Makarova','Ekaterina','Russian','Moscow, Russian SFSR, Soviet Union',TO_DATE(' 1988/6/7','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Makarova','GUEST',2,null);

insert into PARTICIPANT values(115,'Hingis','Martina','Swiss','Ko?ice, Czechoslovakia',TO_DATE(' 1980/9/30','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Hingis','GUEST',2,null);

insert into PARTICIPANT values(116,'Bacsinszky','Timea','Swiss','Lausanne, Switzerland',TO_DATE(' 1989/6/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Bacsinszky','GUEST',2,null);

insert into PARTICIPANT values(117,'Mass迆','Nicol芍s','Chilean','Vi?a del Mar, Chile',TO_DATE(' 1979/10/10','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Mass迆','GUEST',2,null);

insert into PARTICIPANT values(118,'Fish','Mardy','American','Edina, Minnesota, U.S.A',TO_DATE(' 1981/12/9','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Fish','GUEST',2,null);

insert into PARTICIPANT values(119,'Gonz芍lez','Fernando','Chilean','Santiago, Chile',TO_DATE(' 1980/7/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Gonz芍lez','GUEST',2,null);

insert into PARTICIPANT values(120,'Dent','Taylor','American','Newport Beach, California, USA',TO_DATE(' 1981/4/24','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Dent','GUEST',2,null);

insert into PARTICIPANT values(121,'Li','Ting','Chinese','Wuhan, Hubei, China',TO_DATE(' 1980/1/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Li','GUEST',2,null);

insert into PARTICIPANT values(122,'Sun','Tiantian','Chinese','Zhengzhou, Henan, China',TO_DATE(' 1981/10/12','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sun','GUEST',2,null);

insert into PARTICIPANT values(123,'Mart赤nez','Conchita','Spanish','San Diego, California, U.S.',TO_DATE(' 1972/4/16','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Mart赤nez','GUEST',2,null);

insert into PARTICIPANT values(124,'Pascual','Virginia','Spanish','Madrid, Spain
',TO_DATE(' 1973/9/21','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Pascual','GUEST',2,null);

insert into PARTICIPANT values(125,'Su芍rez','Paola ','Argentina','Pergamino, Argentina',TO_DATE(' 1976/6/23','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Su芍rez','GUEST',2,null);

insert into PARTICIPANT values(126,'Tarabini','Patricia','Argentina','La Plata, Argentina',TO_DATE(' 1968/8/6','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Tarabini','GUEST',2,null);

insert into PARTICIPANT values(127,'Asagoe','Shinobu','Japanese','Hy身go, Japan',TO_DATE(' 1976/6/28','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Asagoe','AS',1,null);

insert into PARTICIPANT values(128,'Sugiyama','Ai','Japanese','Yokohama, Japan',TO_DATE('  1975/7/5','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Sugiyama','GUEST',2,null);

insert into PARTICIPANT values(129,'Daniel','Vallverd迆','Venezuela','Venezuela',TO_DATE(' 1986/3/17','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Daniel','DV',1,null);

insert into PARTICIPANT values(130,'Fernando','Fibla','Spain','Benicarl車, Spain',TO_DATE(' 1977/3/8','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Fernando','FF',1,null);

insert into PARTICIPANT values(131,'Kei','Nishikori','Japanese','Matsue, Shimane, Japan',TO_DATE(' 1989/12/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Kei','KN',1,null);

insert into PARTICIPANT values(132,'Chiang Peng','lung','Republic of China','Penghu, Taiwan',TO_DATE(' 1976/7/24','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Chiang Peng','Cl',1,null);

insert into PARTICIPANT values(133,'Mary','Fern芍ndez','US','Miami, Florida, U.S.',TO_DATE(' 1971/8/19','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Mary','MF',1,null);

insert into PARTICIPANT values(135,'Dmitry','Tursunov','Russia','Moscow, Soviet Union',TO_DATE(' 1982/12/12','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Dmitry','DT',1,null);

insert into PARTICIPANT values(136,'Alexandre','Tursunov','Belarus','Minsk, Belarus',TO_DATE(' 1972/12/12','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Alexandre','AT',1,null);

insert into PARTICIPANT values(137,'Ryue','Yang','chinese','shanghai,China',TO_DATE(' 1972/12/12','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Ryue','RY',1,null);

insert into PARTICIPANT values(138,'Han','Ying','Germany','Liaoning, China',TO_DATE(' 1983/4/29','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Han','GUEST',2,null);

insert into PARTICIPANT values(139,'Petrissa','Solja','Germany','Kandel, Rhineland-Palatinate, Germany[1]',TO_DATE(' 1994/3/11','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Petrissa','GUEST',2,null);

insert into PARTICIPANT values(140,'Chih-yuan','Chuang','Republic of China','Kaohsiung, Taiwan',TO_DATE(' 1981/4/2','yyyy/mm/dd hh24:mi:ss'));

insert into USER_ACCOUNT values(User_account_id.nextval,'Chih-yuan','GUEST',2,null);

commit;
--Events

Insert into EVENT values(0,0,0,'M',TO_DATE(' 2016/8/21 16:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(1,2,1,'W',TO_DATE(' 2016/8/10 16:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(2,2,1,'M',TO_DATE(' 2016/8/11 20:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(3,2,1,'W',TO_DATE(' 2016/8/12 20:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(4,2,1,'W',TO_DATE(' 2016/8/12 20:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(5,3,7,'M',TO_DATE(' 2016/8/6 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(6,2,2,'W',TO_DATE(' 2012/8/7 10:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(7,2,2,'M',TO_DATE(' 2012/8/8 10:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(8,2,2,'W',TO_DATE(' 2012/8/8 9:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(9,2,2,'M',TO_DATE(' 2012/8/10 9:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(10,3,6,'W',TO_DATE(' 2012/7/28 12:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(11,3,6,'M',TO_DATE(' 2012/7/28 12:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(12,2,3,'M',TO_DATE(' 2008/8/23 9:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(13,2,3,'M',TO_DATE(' 2008/8/18 9:30:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(14,2,3,'W',TO_DATE(' 2008/8/22 11:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(15,2,3,'W',TO_DATE(' 2008/8/18 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(16,3,5,'M',TO_DATE(' 2008/8/10 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(17,3,5,'W',TO_DATE(' 2008/8/10 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(18,2,4,'M',TO_DATE(' 2004/8/23 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(19,2,4,'W',TO_DATE(' 2004/8/22 11:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(20,2,4,'M',TO_DATE(' 2004/8/21 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(21,2,4,'W',TO_DATE('  2004/8/20 11:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(22,3,8,'M',TO_DATE(' 2004/8/15 10:00:00','yyyy/mm/dd hh24:mi:ss'));
Insert into EVENT values(23,3,8,'W',TO_DATE(' 2004/8/15 10:00:00','yyyy/mm/dd hh24:mi:ss'));
COMMIT ;
--TEAM
Insert into Team values(0,0,'Team USA',1,0,21);
Insert into Team values(1,0,'Team Siberia',5,0,27);
Insert into Team values(2,0,'Team Spain ',2,0,6);
Insert into Team values(3,0,'Team Australia',3,0,14);
Insert into Team values(4,0,'China Man''s table tennis(single)',0,2,33);
Insert into Team values(6,0,'China Man''s table tennis(single)',0,2,33);
Insert into Team values(5,0,'Japan''ss Man''ss table tennis(single)',6,2,34);
Insert into Team values(7,0,'Belarus''s Man''ss table tennis(single)',17,2,87);
Insert into Team values(8,0,'China Women''ss Table Tennis(single)',0,2,35);
Insert into Team values(9,0,'China Women''ss Table Tennis(single)',0,2,35);
Insert into Team values(10,0,'Japan''ss WoMan''ss table tennis(Single)',6,2,34);
Insert into Team values(11,0,'Team Nouth Korea WoMan''ss table tennis(S)',11,2,65);
Insert into Team values(13,0,'Germany Women''ss Table Tennis(Team)',9,2,53);
Insert into Team values(14,0,'Japan''ss WoMan''ss table tennis(Team)',6,2,34);
Insert into Team values(15,0,'singapore''s WoMan''ss table tennis(Team)',4,2,40);
Insert into Team values(16,0,'China Man''ss table tennis(team)',0,2,33);
Insert into Team values(17,0,'Germany men''ss Table Tennis(Team)',9,2,53);
Insert into Team values(18,0,'Team South Korea''s Man''ss table tennis(T)',7,2,37);
Insert into Team values(19,0,'Japan''ss Man''ss table tennis(team)',6,2,34);
Insert into Team values(20,0,'ARG Men''ss tennis(s)',21,3,127);
Insert into Team values(21,0,'GBR Men''ss tennis(s)',23,3,129);
Insert into Team values(22,0,'ESP Men''ss tennis(s)',2,3,130);
Insert into Team values(95,0,'JPN Men''ss tennis(s)',6,3,131);
Insert into Team values(23,1,'Team China Women''ss Table Tennis(T)',0,2,35);
Insert into Team values(24,1,'Team Japan''ss WoMan''ss table tennis(T)',6,2,34);
Insert into Team values(25,1,'Team South Korea''s woMan''ss table tennis((T)',7,2,37);
Insert into Team values(26,1,'Team Singapore''s WoMan''ss table tennis(T)',4,2,40);
Insert into Team values(27,1,'Team South Korea''s Man''ss table tennis(T)',7,2,37);
Insert into Team values(28,1,'Team China Man''ss table tennis(T)',0,2,33);
Insert into Team values(29,1,'Team Germany''s Man''ss table tennis(T)',9,2,53);
Insert into Team values(30,1,'Team Hong Kong''s Man''ss table tennis(T)',12,2,67);
Insert into Team values(31,1,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(32,1,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(33,1,'Team Germany''s Man''ss table tennis(S)',9,2,53);
Insert into Team values(96,1,'Team TaiPei''s Man''ss table tennis(s)',18,2,132);
Insert into Team values(34,1,'Team China Women''ss Table Tennis(S)',0,2,35);
Insert into Team values(35,1,'Team China Women''ss Table Tennis(S)',0,2,35);
Insert into Team values(36,1,'Team Singapore''s Man''ss table tennis(S)',4,2,40);
Insert into Team values(37,1,'Team Japan''ss Man''ss table tennis(S)',6,2,34);
Insert into Team values(38,1,'Team USA Women''ss tennis(t)',1,3,133);
Insert into Team values(39,1,'Team CZE''s Women''ss tennis(t)',22,3,135);
Insert into Team values(40,1,'Team USA''s Women''ss tennis(t)',17,3,136);
Insert into Team values(41,1,'Team RUS''s Women''ss tennis(t)',15,3,135);
Insert into Team values(42,1,'Team SUI''s men''ss tennis(s)',20,3,133);
Insert into Team values(43,1,'Team GBR''s men''ss tennis(s)',23,3,133);
Insert into Team values(44,1,'Team ARG''s men''ss tennis(s)',21,3,133);
Insert into Team values(45,1,'Team SRB''s men''ss tennis(s)',13,3,130);
Insert into Team values(47,2,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(48,2,'Team China Man''ss table tennis(s)',0,2,33);
Insert into Team values(49,2,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(50,2,'Team Sweden''ss Man''ss table tennis(S)',8,2,50);
Insert into Team values(51,2,'Team China Man''ss table tennis(T)',0,2,33);
Insert into Team values(52,2,'Team Germany Man''ss table tennis(T)',9,2,53);
Insert into Team values(53,2,'Team Austria Man''ss table tennis(T)',10,2,56);
Insert into Team values(54,2,'Team South Korea Man''ss table tennis(T)',7,2,37);
Insert into Team values(55,2,'Team China Women''ss Table Tennis(S)',0,2,35);
Insert into Team values(56,2,'Team China Women''ss Table Tennis(S)',0,2,35);
Insert into Team values(57,2,'Team China Women''ss Table Tennis(S)',0,2,35);
Insert into Team values(58,2,'Team Singapore Women''ss Table Tennis(S)',4,2,40);
Insert into Team values(59,2,'Team China Women''ss Table Tennis(T)',0,2,35);
Insert into Team values(60,2,'Team Singapore Women''ss Table Tennis(T)',4,2,40);
Insert into Team values(61,2,'Team South Korea WoMan''ss table tennis(T)',7,2,37);
Insert into Team values(62,2,'Team Singapore Women''ss Table Tennis(T)',4,2,40);
Insert into Team values(63,2,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(64,2,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(65,2,'Team Sweden''ss Man''ss table tennis(S)',8,2,50);
Insert into Team values(66,2,'Team China Man''ss table tennis(S)',0,2,33);
Insert into Team values(67,2,'Team CHI''s men''ss tennis(s)',14,3,130);
Insert into Team values(68,2,'Team ESP''s men''ss tennis(s)',2,3,130);
Insert into Team values(69,2,'Team USA''s men''ss tennis(s)',1,3,133);
Insert into Team values(70,2,'Team SRB''s men''ss tennis(s)',13,3,130);
Insert into Team values(71,2,'Team ESP''s Women''ss tennis(T)',2,3,130);
Insert into Team values(72,2,'Team USA''s Women''ss tennis(T)',1,3,133);
Insert into Team values(73,2,'Team CHn''ss Women''ss tennis(T)',0,3,137);
Insert into Team values(74,2,'Team UKR''s Women''ss tennis(T)',16,3,135);
Insert into Team values(75,3,'Team China WoMan''ss table tennis(S)',0,2,35);
Insert into Team values(76,3,'Team Nouth Korea WoMan''ss table tennis(S)',11,2,65);
Insert into Team values(77,3,'Team South Korea WoMan''ss table tennis(S)',7,2,37);
Insert into Team values(78,3,'Team Singapore Women''ss Table Tennis(S)',4,2,40);
Insert into Team values(79,3,'Team China Man''ss table tennis(T)',0,2,33);
Insert into Team values(80,3,'Team Hong Kong''s Man''ss table tennis(T)',12,2,67);
Insert into Team values(81,3,'Team Denmark''s Man''ss table tennis(T)',19,2,96);
Insert into Team values(82,3,'Team Russia''s Man''ss table tennis(T)',15,2,99);
Insert into Team values(83,3,'Team China Women''ss Table Tennis(T)',0,2,35);
Insert into Team values(84,3,'Team South Korea WoMan''ss table tennis(T)',7,2,37);
Insert into Team values(85,3,'Team China Women''ss Table Tennis(T)',0,2,35);
Insert into Team values(86,3,'Team South Korea WoMan''ss table tennis(T)',7,2,37);
Insert into Team values(87,3,'Team China Man''ss table tennis(s)',0,2,33);
Insert into Team values(88,3,'Team South Korea Man''ss table tennis(S)',7,2,37);
Insert into Team values(89,3,'Team China Man''ss table tennis(s)',0,2,33);
Insert into Team values(90,3,'Team Sweden''ss Man''ss table tennis(s)',8,2,100);
Insert into Team values(91,3,'Team CHI''s men''ss tennis(s)',14,3,130);
Insert into Team values(92,3,'Team USA''s men''ss tennis(s)',1,3,133);
Insert into Team values(93,3,'Team USA''s men''ss tennis(s)',1,3,133);
Insert into Team values(94,3,'Team CHI''s men''ss tennis(s)',14,3,130);
Insert into Team values(97,3,'Team China''s Women''ss tennis(T)',0,3,137);--95
Insert into Team values(98,3,'Team ESP''s Women''ss tennis(T)',2,3,130);--96
Insert into Team values(99,3,'Team ARG''s Women''ss tennis(T)',21,3,133);--97
Insert into Team values(100,3,'Team JPn''ss Women''ss tennis(T)',6,3,131);--98
commit ;

--Event participation
Insert into EVENT_PARTICIPATION values(0,0,'e');
Insert into EVENT_PARTICIPATION values(0,1,'e');
Insert into EVENT_PARTICIPATION values(0,2,'e');
Insert into EVENT_PARTICIPATION values(0,3,'e');
Insert into EVENT_PARTICIPATION values(1,8,'e');
Insert into EVENT_PARTICIPATION values(1,9,'e');
Insert into EVENT_PARTICIPATION values(1,10,'e');
Insert into EVENT_PARTICIPATION values(1,11,'e');
Insert into EVENT_PARTICIPATION values(2,4,'e');
Insert into EVENT_PARTICIPATION values(2,5,'e');
Insert into EVENT_PARTICIPATION values(2,6,'e');
Insert into EVENT_PARTICIPATION values(2,7,'e');
Insert into EVENT_PARTICIPATION values(3,12,'e');
Insert into EVENT_PARTICIPATION values(3,13,'e');
Insert into EVENT_PARTICIPATION values(3,14,'e');
Insert into EVENT_PARTICIPATION values(3,15,'e');
Insert into EVENT_PARTICIPATION values(4,16,'e');
Insert into EVENT_PARTICIPATION values(4,17,'e');
Insert into EVENT_PARTICIPATION values(4,18,'e');
Insert into EVENT_PARTICIPATION values(4,19,'e');
Insert into EVENT_PARTICIPATION values(5,20,'e');
Insert into EVENT_PARTICIPATION values(5,21,'e');
Insert into EVENT_PARTICIPATION values(5,22,'e');
Insert into EVENT_PARTICIPATION values(5,95,'e');
Insert into EVENT_PARTICIPATION values(6,23,'e');
Insert into EVENT_PARTICIPATION values(6,24,'e');
Insert into EVENT_PARTICIPATION values(6,25,'e');
Insert into EVENT_PARTICIPATION values(6,26,'e');
Insert into EVENT_PARTICIPATION values(7,27,'e');
Insert into EVENT_PARTICIPATION values(7,28,'e');
Insert into EVENT_PARTICIPATION values(7,29,'e');
Insert into EVENT_PARTICIPATION values(7,30,'e');
Insert into EVENT_PARTICIPATION values(8,34,'e');
Insert into EVENT_PARTICIPATION values(8,35,'e');
Insert into EVENT_PARTICIPATION values(8,36,'e');
Insert into EVENT_PARTICIPATION values(8,37,'e');
Insert into EVENT_PARTICIPATION values(9,31,'e');
Insert into EVENT_PARTICIPATION values(9,32,'e');
Insert into EVENT_PARTICIPATION values(9,33,'e');
Insert into EVENT_PARTICIPATION values(9,96,'e');
Insert into EVENT_PARTICIPATION values(10,38,'e');
Insert into EVENT_PARTICIPATION values(10,39,'e');
Insert into EVENT_PARTICIPATION values(10,40,'e');
Insert into EVENT_PARTICIPATION values(10,41,'e');
Insert into EVENT_PARTICIPATION values(11,42,'e');
Insert into EVENT_PARTICIPATION values(11,43,'e');
Insert into EVENT_PARTICIPATION values(11,44,'e');
Insert into EVENT_PARTICIPATION values(11,45,'e');
Insert into EVENT_PARTICIPATION values(12,47,'e');
Insert into EVENT_PARTICIPATION values(12,48,'e');
Insert into EVENT_PARTICIPATION values(12,49,'e');
Insert into EVENT_PARTICIPATION values(12,50,'e');
Insert into EVENT_PARTICIPATION values(13,51,'e');
Insert into EVENT_PARTICIPATION values(13,52,'e');
Insert into EVENT_PARTICIPATION values(13,53,'e');
Insert into EVENT_PARTICIPATION values(13,54,'e');
Insert into EVENT_PARTICIPATION values(14,55,'e');
Insert into EVENT_PARTICIPATION values(14,56,'e');
Insert into EVENT_PARTICIPATION values(14,57,'e');
Insert into EVENT_PARTICIPATION values(14,58,'e');
Insert into EVENT_PARTICIPATION values(15,59,'e');
Insert into EVENT_PARTICIPATION values(15,60,'e');
Insert into EVENT_PARTICIPATION values(15,61,'e');
Insert into EVENT_PARTICIPATION values(15,62,'e');
Insert into EVENT_PARTICIPATION values(16,67,'e');
Insert into EVENT_PARTICIPATION values(16,68,'e');
Insert into EVENT_PARTICIPATION values(16,69,'e');
Insert into EVENT_PARTICIPATION values(16,70,'e');
Insert into EVENT_PARTICIPATION values(17,71,'e');
Insert into EVENT_PARTICIPATION values(17,72,'e');
Insert into EVENT_PARTICIPATION values(17,73,'e');
Insert into EVENT_PARTICIPATION values(17,74,'e');
Insert into EVENT_PARTICIPATION values(18,87,'e');
Insert into EVENT_PARTICIPATION values(18,88,'e');
Insert into EVENT_PARTICIPATION values(18,89,'e');
Insert into EVENT_PARTICIPATION values(18,90,'e');
Insert into EVENT_PARTICIPATION values(19,83,'e');
Insert into EVENT_PARTICIPATION values(19,84,'e');
Insert into EVENT_PARTICIPATION values(19,85,'e');
Insert into EVENT_PARTICIPATION values(19,86,'e');
Insert into EVENT_PARTICIPATION values(20,79,'e');
Insert into EVENT_PARTICIPATION values(20,80,'e');
Insert into EVENT_PARTICIPATION values(20,81,'e');
Insert into EVENT_PARTICIPATION values(20,82,'e');
Insert into EVENT_PARTICIPATION values(21,75,'e');
Insert into EVENT_PARTICIPATION values(21,76,'e');
Insert into EVENT_PARTICIPATION values(21,77,'e');
Insert into EVENT_PARTICIPATION values(21,78,'e');
Insert into EVENT_PARTICIPATION values(22,91,'e');
Insert into EVENT_PARTICIPATION values(22,92,'e');
Insert into EVENT_PARTICIPATION values(22,93,'e');
Insert into EVENT_PARTICIPATION values(22,94,'e');
Insert into EVENT_PARTICIPATION values(23,97,'e');
Insert into EVENT_PARTICIPATION values(23,98,'e');
Insert into EVENT_PARTICIPATION values(23,99,'e');
Insert into EVENT_PARTICIPATION values(23,100,'e');
commit ;

--Team member
Insert into TEAM_MEMBER values(0,15);
Insert into TEAM_MEMBER values(0,16);
Insert into TEAM_MEMBER values(0,17);
Insert into TEAM_MEMBER values(0,18);
Insert into TEAM_MEMBER values(0,19);
Insert into TEAM_MEMBER values(0,20);
Insert into TEAM_MEMBER values(1,22);
Insert into TEAM_MEMBER values(1,23);
Insert into TEAM_MEMBER values(1,24);
Insert into TEAM_MEMBER values(1,25);
Insert into TEAM_MEMBER values(1,26);
Insert into TEAM_MEMBER values(2,0);
Insert into TEAM_MEMBER values(2,1);
Insert into TEAM_MEMBER values(2,2);
Insert into TEAM_MEMBER values(2,3);
Insert into TEAM_MEMBER values(2,4);
Insert into TEAM_MEMBER values(2,5);
Insert into TEAM_MEMBER values(3,7);
Insert into TEAM_MEMBER values(3,8);
Insert into TEAM_MEMBER values(3,9);
Insert into TEAM_MEMBER values(3,10);
Insert into TEAM_MEMBER values(3,11);
Insert into TEAM_MEMBER values(3,12);
Insert into TEAM_MEMBER values(3,13);
Insert into TEAM_MEMBER values(4,28);
Insert into TEAM_MEMBER values(5,60);
Insert into TEAM_MEMBER values(6,32);
Insert into TEAM_MEMBER values(7,87);
Insert into TEAM_MEMBER values(8,29);
Insert into TEAM_MEMBER values(9,31);
Insert into TEAM_MEMBER values(10,30);
Insert into TEAM_MEMBER values(11,64);
Insert into TEAM_MEMBER values(12,29);
Insert into TEAM_MEMBER values(12,31);
Insert into TEAM_MEMBER values(13,138);
Insert into TEAM_MEMBER values(13,139);
Insert into TEAM_MEMBER values(14,30);
Insert into TEAM_MEMBER values(14,48);
Insert into TEAM_MEMBER values(15,42);
Insert into TEAM_MEMBER values(15,47);
Insert into TEAM_MEMBER values(16,28);
Insert into TEAM_MEMBER values(16,43);
Insert into TEAM_MEMBER values(17,53);
Insert into TEAM_MEMBER values(17,55);
Insert into TEAM_MEMBER values(18,45);
Insert into TEAM_MEMBER values(18,59);
Insert into TEAM_MEMBER values(19,34);
Insert into TEAM_MEMBER values(19,32);
Insert into TEAM_MEMBER values(20,103);
Insert into TEAM_MEMBER values(21,101);
Insert into TEAM_MEMBER values(22,81);
Insert into TEAM_MEMBER values(95,110);
Insert into TEAM_MEMBER values(23,60);
Insert into TEAM_MEMBER values(23,62);
Insert into TEAM_MEMBER values(24,48);
Insert into TEAM_MEMBER values(24,30);
Insert into TEAM_MEMBER values(25,38);
Insert into TEAM_MEMBER values(25,39);
Insert into TEAM_MEMBER values(26,41);
Insert into TEAM_MEMBER values(26,42);
Insert into TEAM_MEMBER values(27,44);
Insert into TEAM_MEMBER values(27,45);
Insert into TEAM_MEMBER values(28,43);
Insert into TEAM_MEMBER values(28,49);
Insert into TEAM_MEMBER values(29,55);
Insert into TEAM_MEMBER values(29,54);
Insert into TEAM_MEMBER values(30,68);
Insert into TEAM_MEMBER values(30,69);
Insert into TEAM_MEMBER values(31,28);
Insert into TEAM_MEMBER values(32,46);
Insert into TEAM_MEMBER values(33,55);
Insert into TEAM_MEMBER values(96,140);
Insert into TEAM_MEMBER values(34,29);
Insert into TEAM_MEMBER values(35,62);
Insert into TEAM_MEMBER values(36,42);
Insert into TEAM_MEMBER values(37,48);
Insert into TEAM_MEMBER values(38,79);
Insert into TEAM_MEMBER values(38,80);
Insert into TEAM_MEMBER values(39,104);
Insert into TEAM_MEMBER values(39,105);
Insert into TEAM_MEMBER values(40,78);
Insert into TEAM_MEMBER values(40,79);
Insert into TEAM_MEMBER values(41,97);
Insert into TEAM_MEMBER values(41,98);
Insert into TEAM_MEMBER values(42,116);
Insert into TEAM_MEMBER values(43,101);
Insert into TEAM_MEMBER values(44,103);
Insert into TEAM_MEMBER values(45,75);
Insert into TEAM_MEMBER values(47,43);
Insert into TEAM_MEMBER values(48,49);
Insert into TEAM_MEMBER values(49,28);
Insert into TEAM_MEMBER values(50,51);
Insert into TEAM_MEMBER values(51,49);
Insert into TEAM_MEMBER values(51,43);
Insert into TEAM_MEMBER values(52,54);
Insert into TEAM_MEMBER values(52,55);
Insert into TEAM_MEMBER values(53,57);
Insert into TEAM_MEMBER values(53,58);
Insert into TEAM_MEMBER values(54,44);
Insert into TEAM_MEMBER values(54,45);
Insert into TEAM_MEMBER values(55,60);
Insert into TEAM_MEMBER values(56,61);
Insert into TEAM_MEMBER values(57,62);
Insert into TEAM_MEMBER values(58,63);
Insert into TEAM_MEMBER values(59,60);
Insert into TEAM_MEMBER values(59,61);
Insert into TEAM_MEMBER values(60,62);
Insert into TEAM_MEMBER values(60,63);
Insert into TEAM_MEMBER values(61,38);
Insert into TEAM_MEMBER values(61,39);
Insert into TEAM_MEMBER values(62,63);
Insert into TEAM_MEMBER values(62,47);
Insert into TEAM_MEMBER values(63,66);
Insert into TEAM_MEMBER values(64,52);
Insert into TEAM_MEMBER values(65,28);
Insert into TEAM_MEMBER values(66,51);
Insert into TEAM_MEMBER values(67,76);
Insert into TEAM_MEMBER values(68,77);
Insert into TEAM_MEMBER values(69,78);
Insert into TEAM_MEMBER values(70,75);
Insert into TEAM_MEMBER values(71,123);
Insert into TEAM_MEMBER values(71,124);
Insert into TEAM_MEMBER values(72,108);
Insert into TEAM_MEMBER values(72,109);
Insert into TEAM_MEMBER values(73,83);
Insert into TEAM_MEMBER values(73,84);
Insert into TEAM_MEMBER values(74,87);
Insert into TEAM_MEMBER values(74,88);
Insert into TEAM_MEMBER values(75,72);
Insert into TEAM_MEMBER values(76,64);
Insert into TEAM_MEMBER values(77,73);
Insert into TEAM_MEMBER values(78,63);
Insert into TEAM_MEMBER values(79,46);
Insert into TEAM_MEMBER values(79,66);
Insert into TEAM_MEMBER values(80,68);
Insert into TEAM_MEMBER values(80,69);
Insert into TEAM_MEMBER values(81,94);
Insert into TEAM_MEMBER values(81,95);
Insert into TEAM_MEMBER values(82,97);
Insert into TEAM_MEMBER values(82,98);
Insert into TEAM_MEMBER values(83,60);
Insert into TEAM_MEMBER values(83,61);
Insert into TEAM_MEMBER values(84,70);
Insert into TEAM_MEMBER values(84,71);
Insert into TEAM_MEMBER values(85,62);
Insert into TEAM_MEMBER values(85,72);
Insert into TEAM_MEMBER values(86,73);
Insert into TEAM_MEMBER values(86,74);
Insert into TEAM_MEMBER values(87,49);
Insert into TEAM_MEMBER values(88,74);
Insert into TEAM_MEMBER values(89,52);
Insert into TEAM_MEMBER values(90,51);
Insert into TEAM_MEMBER values(91,117);
Insert into TEAM_MEMBER values(92,119);
Insert into TEAM_MEMBER values(93,120);
Insert into TEAM_MEMBER values(94,119);
Insert into TEAM_MEMBER values(97,121);
Insert into TEAM_MEMBER values(97,122);
Insert into TEAM_MEMBER values(98,123);
Insert into TEAM_MEMBER values(98,124);
Insert into TEAM_MEMBER values(99,125);
Insert into TEAM_MEMBER values(99,126);
Insert into TEAM_MEMBER values(100,127);
Insert into TEAM_MEMBER values(100,128);
commit ;

--SCOREBOARD
Insert into SCOREBOARD values(0,0,0,15,1,1);
Insert into SCOREBOARD values(0,0,0,16,1,1);
Insert into SCOREBOARD values(0,0,0,17,1,1);
Insert into SCOREBOARD values(0,0,0,18,1,1);
Insert into SCOREBOARD values(0,0,0,19,1,1);
Insert into SCOREBOARD values(0,0,0,20,1,1);
Insert into SCOREBOARD values(0,0,0,21,1,1);
Insert into SCOREBOARD values(0,0,1,22,2,2);
Insert into SCOREBOARD values(0,0,1,23,2,2);
Insert into SCOREBOARD values(0,0,1,24,2,2);
Insert into SCOREBOARD values(0,0,1,25,2,2);
Insert into SCOREBOARD values(0,0,1,26,2,2);
Insert into SCOREBOARD values(0,0,1,27,2,2);
Insert into SCOREBOARD values(0,0,2,0,3,3);
Insert into SCOREBOARD values(0,0,2,1,3,3);
Insert into SCOREBOARD values(0,0,2,2,3,3);
Insert into SCOREBOARD values(0,0,2,3,3,3);
Insert into SCOREBOARD values(0,0,2,4,3,3);
Insert into SCOREBOARD values(0,0,2,5,3,3);
Insert into SCOREBOARD values(0,0,2,6,3,3);
Insert into SCOREBOARD values(0,0,3,7,4,null);
Insert into SCOREBOARD values(0,0,3,8,4,null);
Insert into SCOREBOARD values(0,0,3,9,4,null);
Insert into SCOREBOARD values(0,0,3,10,4,null);
Insert into SCOREBOARD values(0,0,3,11,4,null);
Insert into SCOREBOARD values(0,0,3,12,4,null);
Insert into SCOREBOARD values(0,0,3,13,4,null);
Insert into SCOREBOARD values(0,0,3,14,4,null);
Insert into SCOREBOARD values(0,1,8,29,1,1);
Insert into SCOREBOARD values(0,1,9,30,2,2);
Insert into SCOREBOARD values(0,1,10,31,3,3);
Insert into SCOREBOARD values(0,1,11,29,4,null);
Insert into SCOREBOARD values(0,2,4,28,1,1);
Insert into SCOREBOARD values(0,2,6,32,2,2);
Insert into SCOREBOARD values(0,2,5,60,3,3);
Insert into SCOREBOARD values(0,2,7,87,4,NULL);
Insert into SCOREBOARD values(0,3,12,29,1,1);
Insert into SCOREBOARD values(0,3,12,31,1,1);
Insert into SCOREBOARD values(0,3,13,138,2,2);
Insert into SCOREBOARD values(0,3,13,139,2,2);
Insert into SCOREBOARD values(0,3,14,30,3,3);
Insert into SCOREBOARD values(0,3,14,48,3,3);
Insert into SCOREBOARD values(0,3,15,42,4,null);
Insert into SCOREBOARD values(0,3,15,47,4,null);
Insert into SCOREBOARD values(0,4,16,28,1,1);
Insert into SCOREBOARD values(0,4,16,43,1,1);
Insert into SCOREBOARD values(0,4,17,53,2,2);
Insert into SCOREBOARD values(0,4,17,55,2,2);
Insert into SCOREBOARD values(0,4,18,45,3,3);
Insert into SCOREBOARD values(0,4,18,59,3,3);
Insert into SCOREBOARD values(0,4,19,34,4,null);
Insert into SCOREBOARD values(0,4,19,32,4,null);
Insert into SCOREBOARD values(0,5,20,103,1,1);
Insert into SCOREBOARD values(0,5,21,101,2,2);
Insert into SCOREBOARD values(0,5,22,81,3,3);
Insert into SCOREBOARD values(0,5,95,0,4,null);
Insert into SCOREBOARD values(1,6,23,60,1,1);
Insert into SCOREBOARD values(1,6,23,62,1,1);
Insert into SCOREBOARD values(1,6,23,48,2,2);
Insert into SCOREBOARD values(1,6,24,30,2,2);
Insert into SCOREBOARD values(1,6,25,38,3,3);
Insert into SCOREBOARD values(1,6,25,39,4,null);
Insert into SCOREBOARD values(1,6,26,41,4,null);
Insert into SCOREBOARD values(1,7,27,44,1,1);
Insert into SCOREBOARD values(1,7,27,45,1,1);
Insert into SCOREBOARD values(1,7,28,43,2,2);
Insert into SCOREBOARD values(1,7,28,49,2,2);
Insert into SCOREBOARD values(1,7,29,55,3,3);
Insert into SCOREBOARD values(1,7,29,54,3,3);
Insert into SCOREBOARD values(1,7,30,68,4,null);
Insert into SCOREBOARD values(1,7,30,69,4,null);
Insert into SCOREBOARD values(1,8,34,29,1,1);
Insert into SCOREBOARD values(1,8,35,62,2,2);
Insert into SCOREBOARD values(1,8,36,42,3,3);
Insert into SCOREBOARD values(1,8,37,48,4,null);
Insert into SCOREBOARD values(1,9,31,28,1,1);
Insert into SCOREBOARD values(1,9,32,46,2,2);
Insert into SCOREBOARD values(1,9,33,55,3,3);
Insert into SCOREBOARD values(1,9,96,140,4,null);
Insert into SCOREBOARD values(1,10,38,79,2,2);
Insert into SCOREBOARD values(1,10,38,80,1,1);
Insert into SCOREBOARD values(1,10,39,104,1,1);
Insert into SCOREBOARD values(1,10,39,105,2,2);
Insert into SCOREBOARD values(1,10,40,78,3,3);
Insert into SCOREBOARD values(1,10,40,79,3,3);
Insert into SCOREBOARD values(1,10,41,98,4,null);
Insert into SCOREBOARD values(1,10,41,97,4,null);
Insert into SCOREBOARD values(1,11,42,116,1,1);
Insert into SCOREBOARD values(1,11,43,101,2,2);
Insert into SCOREBOARD values(1,11,44,103,3,3);
Insert into SCOREBOARD values(1,11,45,75,4,null);
Insert into SCOREBOARD values(2,12,47,43,1,1);
Insert into SCOREBOARD values(2,12,48,49,2,2);
Insert into SCOREBOARD values(2,12,49,28,3,3);
Insert into SCOREBOARD values(2,12,50,51,4,null);
Insert into SCOREBOARD values(2,13,51,49,1,1);
Insert into SCOREBOARD values(2,13,51,43,1,1);
Insert into SCOREBOARD values(2,13,52,54,2,2);
Insert into SCOREBOARD values(2,13,52,55,2,2);
Insert into SCOREBOARD values(2,13,53,57,3,3);
Insert into SCOREBOARD values(2,13,53,58,3,3);
Insert into SCOREBOARD values(2,13,54,44,4,null);
Insert into SCOREBOARD values(2,13,54,45,4,null);
Insert into SCOREBOARD values(2,14,55,60,1,1);
Insert into SCOREBOARD values(2,14,56,61,2,2);
Insert into SCOREBOARD values(2,14,57,62,1,1);
Insert into SCOREBOARD values(2,14,58,63,1,1);
Insert into SCOREBOARD values(2,15,59,60,1,1);
Insert into SCOREBOARD values(2,15,59,61,1,1);
Insert into SCOREBOARD values(2,15,60,62,2,2);
Insert into SCOREBOARD values(2,15,60,63,2,2);
Insert into SCOREBOARD values(2,15,61,38,3,3);
Insert into SCOREBOARD values(2,15,61,39,3,3);
Insert into SCOREBOARD values(2,15,62,63,4,null);
Insert into SCOREBOARD values(2,15,62,47,4,null);
Insert into SCOREBOARD values(2,16,67,76,1,1);
Insert into SCOREBOARD values(2,16,68,77,2,2);
Insert into SCOREBOARD values(2,16,69,78,3,3);
Insert into SCOREBOARD values(2,16,70,75,4,null);
Insert into SCOREBOARD values(2,17,71,123,1,1);
Insert into SCOREBOARD values(2,17,71,124,1,1);
Insert into SCOREBOARD values(2,17,72,108,2,2);
Insert into SCOREBOARD values(2,17,72,109,2,2);
Insert into SCOREBOARD values(2,17,73,83,3,3);
Insert into SCOREBOARD values(2,17,73,84,3,3);
Insert into SCOREBOARD values(2,17,74,87,4,null);
Insert into SCOREBOARD values(2,17,74,88,4,null);
Insert into SCOREBOARD values(3,18,87,49,1,1);
Insert into SCOREBOARD values(3,18,88,74,2,2);
Insert into SCOREBOARD values(3,18,89,52,3,3);
Insert into SCOREBOARD values(3,18,90,51,4,null);
Insert into SCOREBOARD values(3,19,83,60,1,1);
Insert into SCOREBOARD values(3,19,83,61,1,1);
Insert into SCOREBOARD values(3,19,84,70,2,2);
Insert into SCOREBOARD values(3,19,84,71,2,2);
Insert into SCOREBOARD values(3,19,85,62,3,3);
Insert into SCOREBOARD values(3,19,85,72,3,3);
Insert into SCOREBOARD values(3,19,86,73,4,null);
Insert into SCOREBOARD values(3,19,86,74,4,null);
Insert into SCOREBOARD values(3,20,79,46,1,1);
Insert into SCOREBOARD values(3,20,79,66,1,1);
Insert into SCOREBOARD values(3,20,80,68,2,2);
Insert into SCOREBOARD values(3,20,80,69,2,2);
Insert into SCOREBOARD values(3,20,81,94,3,3);
Insert into SCOREBOARD values(3,20,81,95,3,3);
Insert into SCOREBOARD values(3,20,82,97,4,null);
Insert into SCOREBOARD values(3,20,82,98,4,null);
Insert into SCOREBOARD values(3,21,75,72,1,1);
Insert into SCOREBOARD values(3,21,76,64,2,2);
Insert into SCOREBOARD values(3,21,77,73,3,3);
Insert into SCOREBOARD values(3,21,78,63,4,null);
Insert into SCOREBOARD values(3,22,87,49,1,1);
Insert into SCOREBOARD values(3,22,88,74,2,2);
Insert into SCOREBOARD values(3,22,89,52,3,3);
Insert into SCOREBOARD values(3,22,90,51,4,null);
Insert into SCOREBOARD values(3,23,97,121,1,1);
Insert into SCOREBOARD values(3,23,97,122,1,1);
Insert into SCOREBOARD values(3,23,98,123,2,2);
Insert into SCOREBOARD values(3,23,98,124,2,2);
Insert into SCOREBOARD values(3,23,99,125,3,3);
Insert into SCOREBOARD values(3,23,99,126,3,3);
Insert into SCOREBOARD values(3,23,100,127,4,null);
Insert into SCOREBOARD values(3,23,100,128,4,null);
commit ;
