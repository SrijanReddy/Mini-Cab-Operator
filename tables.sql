create table Company
	(
		address_com varchar(20),
		company_id number(10) primary key,
		name_com varchar(10),
		application varchar(4)
	);
    insert into company values('Germany',100,'Uber Tech','Uber');
    insert into company values('India',101,'Paytm Inc','Pytm');
create table Advertisingcompany
(	type varchar(10),
	name_ad number(10) 	);
     select *  from advertising_company;
    insert into Advertising_company values('Youtube',5);
    insert into Advertising_company values('AdMob',5);
    insert into Advertising_company values('Chrome',5); 
alter table Advertisingcompany  rename to Advertising_Company;
create table driver
	(
		did int,
		name_driver varchar(20),
		phonenumber_driver varchar(10),
		rate_driver int,
		gender varchar(6)
        );  
        alter table driver add driver_password varchar(10);
        insert into driver values(1,'mahar sunil','1111111111',4,'Male','password');
        insert into driver values(2,'Aditya Ganeshan','1111111111',3,'Male','password');
        insert into driver values(3,'Manoz rayal','1111111111',1,'Male','password');
        insert into driver values(4,'Sankala Sankeert','1111111111',2,'Female','password');
    select * from  driver; 
create table car
	(
		color varchar(10),
		nodelno number(10),
		carid number(5) primary key,
		name_car varchar(10),
		model varchar(10)
	);

    insert into car values('Red',800,'1','Maruti','800');
    insert into car values('White',801,'2','hyundai','i10');
    insert into car values('Blue',802,'3','hyundai','i20');
    insert into car values('Black',803,'4','Nissan','Sunny');
    insert into car values('Violet',804,'5','Ambassador','Hindusthan');
alter table car rename column nodelno to model_no;
alter table driver add primary key(did);
select*from car;
create table client
	(
		rate_client number(10),
		password varchar(15)  ,
		phonenumber_client number(10) primary key,
		clientid varchar(6) ,
		location_client varchar(20)
	);
insert into client values(4.5,'password',9876543210,1,'Rishikonda');
insert into client values(4,'password',9898989898,2,'MVP colony'); 
insert into client values(3,'password',9797979797,3,'Rama talkies');
insert into client values(4.9,'password',1215316211,11,'endada');
insert into client values(3.98,'password',1215316234,34,'Gitam');
select * from client; 
create table Request
	(
		location char(20),
		request_time varchar(10),
		nearest_car varchar(10)	
	);
create table trip
	(
		distance number(20),
		tripid varchar(10) primary key,
		pick_up varchar(5),
		drop_off varchar(10)
	);
create table parttime
( 		paddress varchar(20),
		psalary float,
		did number(6) primary key
);
alter table parttime
add foreign key (did) references driver(did);
commit;
create table contract
	(
		caddress varchar(20),
		csalary Float,
		did number(6));
        
alter table contract
add foreign key (did) references driver(did);
create table payfor
	(
		name_ad number(10),
		type varchar(10),
		company_id number(10),
		primary key(name_ad,company_id),
		foreign key(company_id) references Company(company_id)
	);
create table sendto
	(
		nearest_car varchar(10),
		company_id number(10),
		request_time varchar(10),
		location char(20),
		primary key(nearest_car,company_id),
		foreign key(company_id) references Company(company_id)
	);
create table recieves_a
	(
		did int,
		nearest_car varchar(10),
		location char(20),
		request_time varchar(10),
		primary key(did,nearest_car),
		foreign key(did) references driver
	);
create table drives_a
	(
		did int references driver(did),
		carid number(5) references car(carid),
		primary key(did,carid)
	);
  create table bill
	(	did int references driver(did),
		phonenumber_client number(10) references client(phonenumber_client) ,
		pmoney varchar(4) references paytmwallet,
		umoney varchar(4) references uberwallet,
		primary key(did,phonenumber_client,pmoney,umoney)
	);
  create table add_a
	(
		phonenumber_client number(10),
		nearest_car varchar(10),
		location char(20),
		request_time varchar(10),	
		primary key(nearest_car,phonenumber_client),
		foreign key(phonenumber_client) references client
	);
create table has
	(
		did int,
		name_driv varchar(20),
		phonenumber_driver number(10),
		rate_driver number(5),
		gender varchar(4),
		tripid varchar(10),
		primary key(did),
		foreign key(phonenumber_client) references client 
	);
create table drivenby
	(
		owner_carid number(5),
		employee_carid number(5),
		primary key(owner_carid,employee_carid),
		foreign key(owner_carid)references car(carid),
		foreign key(employee_carid)references car(carid)
	);
alter table payfor  rename to pay_for;
alter table sendto  rename to send_to;
alter table parttime  rename to part_time;
alter table drivesa  rename to drives_a;

create table paytmwallet
	(
		pmoney varchar(4) primary key
	);
create table uberwallet
	(
		umoney varchar(4) primary key
	);
create table paidas
	(
		pmoney varchar(4) references paytmwallet,
		umoney varchar(4) references uberwallet,
		primary key(pmoney,umoney)
	);
