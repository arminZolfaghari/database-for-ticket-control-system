use TCS ;

#insert into TECH_PERSONNEL
insert into tech_personnel
values('9731001','Ali','Bagheri','AB001','software','021-44246517');
insert into tech_personnel
values('9731002','Alireza','Bakeri','AB002','software','021-44246519');
insert into tech_personnel
values('9631001','Ali','karimi','AK001','software','021-44246508');
insert into tech_personnel
values ('9731030','amir','montazeri','AM030','software','021-22404359');


#insert into USERS
insert into users
values ('9525001','Ali','Dousti','AD001','021-22419875');
insert into users
values ('9525080','Sara','Dousti','SD080','021-22419875');
insert into users
values ('9528100','Amin','Qasempur','AQ100','021-22409872');


#insert into CATEGORIES
insert into categories
values (1,'Printing Problem','problems have to do with printers and printing');
insert into categories(category, description)
values ('Network Problem','problems have to do with the network and/or internet');
insert into categories(category, description)
values ('Windows OS problem','problems have to do with Windows OS maintenance');
insert into categories(category, description)
values ('Linux/Unix OS problem','problems have to do with Unix/Linux OS maintenance');


#insert into LOCATIONS
insert into locations
values (1,'Tehran Marzdaran 5th floor','268','DB research lab');
insert into locations(location, building, notes)
values ('Tehran Marzdaran 4th floor','269','Game net');
insert into locations(location, building, notes)
values ('Tehran Marzdaran 6th floor','268','Java lab');



#insert into INVENTORY
insert into inventory
values ('PC001','102.168.222.226','sq3-52','01:23:45:67:89:ab',1);
insert into inventory
values ('PC002','102.168.222.225','sq3-53','01:23:45:67:88:ab',2);
insert into inventory
values ('PC050','102.168.210.260','sq8-02',null,1);
insert into inventory
values ('Laptop001','102.168.210.262','sq8-01',null,2);


#insert into TICKETS
insert into tickets
values (1,'9525001','1268-9-1','1268-11-1',60,1,'PC001','Can not print any PDF file!');
insert into tickets
values (2,'9525080','1268-9-5','1268-9-8',3,1,'PC002','Can not print any PDF file!');
insert into tickets
values (3,'9525001','1268-9-25','1268-9-28',3,2,'PC050','can not connect to google server');
insert into tickets
values (4,'9528100','1268-9-3','1268-9-20',17,3,'PC001','windows crashed');
insert into tickets
values (5,'9525001','1268-9-17','1268-9-18',1,4,'laptop001','linux crashed');
insert into tickets
values (6,'9525001', '1268-9-30','1268-10-2',3,1,'laptop001','Can not print any PDF file!');


#insert into ASSIGNMENT
insert into assignment
values (1,'9731001','1268-9-1','delegated',null);
insert into assignment
values (1,'9731002','1268-9-2','closed successful','successful');
insert into assignment
values (2,'9731001','1268-9-5','closed unsuccessful','unsuccessful');
insert into assignment
values (3,'9631001','1268-9-27','closed successful','successful');
insert into assignment
values (4,'9731002','1268-9-10','delegated',null);
insert into assignment
values (4,'9631001','1268-9-12','closed unsuccessful','unsuccessful');
insert into assignment
values (5,'9731001','1268-9-17','closed successful','successful');
insert into assignment
values (6,'9731002','1268-9-30','delegated',null);
insert into assignment
values (6,'9731030','1268-10-1','closed successful','successful');

