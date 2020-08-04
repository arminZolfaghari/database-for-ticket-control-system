CREATE DATABASE TCS; #Ticket control system
USE TCS ;



CREATE TABLE TECH_PERSONNEL
(
    pplSoft varchar(15) not null ,
    fname varchar(30) not null,
    lname varchar(30) not null,
    pittID varchar(15) not null,
    expertise varchar(30) not null,
    office_phone varchar(15) not null,
    PRIMARY KEY (pplSoft)
);

CREATE TABLE USERS
(
    pplSoft varchar(15) unique not null ,
    fname varchar(30) not null,
    lname varchar(30) not null,
    pittID varchar(15) not null,
    office_phone varchar(15) not null,
    PRIMARY KEY (pplSoft)
);

CREATE TABLE USER_OFFICE
(
    officeNO int not null,
    building varchar(30) not null,
    PRIMARY KEY (officeNO)
);

CREATE TABLE CATEGORIES
(
    categoryID int auto_increment not null ,
    category varchar(100) not null,
    description varchar(200) not null,
    PRIMARY KEY (categoryID)
);

CREATE TABLE LOCATIONS
(
    locationID int auto_increment not null,
    location varchar(100) not null,
    building varchar(30) not null,
    notes varchar(100),
    PRIMARY KEY (locationID)
);

CREATE TABLE INVENTORY
(
    machine_name varchar(50) not null,
    IP varchar(15) not null,
    network_port varchar(15) not null,
    MACADDR varchar(20),
    locationID int not null,
    PRIMARY KEY (machine_name),
    FOREIGN KEY (locationID) references LOCATIONS(locationID)
);

CREATE TABLE TICKETS
(
    ticket_number int not null,
    owner_pplSoft varchar(15) not null,
    date_submitted date not null,
    date_closed date not null,
    days_worked_on int not null,
    categoryID int not null,
    machine_name varchar(50) not null,
    description varchar(100),
    PRIMARY KEY (ticket_number),
    FOREIGN KEY (owner_pplSoft) references USERS(pplSoft),
    FOREIGN KEY (categoryID) references CATEGORIES(categoryID),
    FOREIGN KEY (machine_name) references INVENTORY(machine_name)
);

CREATE TABLE ASSIGNMENT
(
    ticket_number int not null,
    tech_pplSoft varchar(15) not null,
    date_assigned date not null,
    status varchar(30) CHECK (status in('assigned','in progress','delegated','closed successful','closed unsuccessful')),
    outcome varchar(30),
    FOREIGN KEY (ticket_number) references TICKETS(ticket_number),
    FOREIGN KEY (tech_pplSoft) references TECH_PERSONNEL(pplSoft),
    primary key (ticket_number, tech_pplSoft, date_assigned)
);
