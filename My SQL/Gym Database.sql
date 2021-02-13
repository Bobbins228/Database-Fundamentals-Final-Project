drop database if exists gym;
create database if not exists gym;
use gym;

create table Membership (
membershipId int auto_increment not null,
membershipType varchar(20) not null,
startDate date not null,
endDate date not null,
Primary key (membershipId)
);

create table Customer (
customerId int auto_increment not null,
fName varchar(15) not null,
lName varchar(20) not null,
dob date not null,
town varchar(25),
street varchar(15),
county varchar(15),
membershipId int,
primary key(customerId),
foreign key (membershipId) references Membership(membershipId) on update cascade on delete set null
);

create table Facility (
facilityId int auto_increment not null,
facilityName varchar(20) not null,
town varchar(25),
street varchar(20),
county varchar(15),
phoneNumber varchar(13),
primary key (facilityId)
);

create table Trainer (
trainerId int auto_increment not null,
fName varchar(15) not null,
lName varchar(20) not null,
phoneNumber varchar(13),
primary key (trainerId)
);

create table WorkoutClass (
workoutId int auto_increment not null,
workoutName varchar(25) not null,
duration double not null,
customerId int,
facilityId int,
primary key (workoutId),
foreign key (customerId) references Customer(customerId),
foreign key (facilityId) references Facility(facilityId)
);

create table Trains (
workoutId int,
trainerId int,
primary key(workoutId, trainerId),
foreign key (workoutId) references WorkoutClass(workoutId),
foreign key (trainerId) references Trainer(trainerId)
);

create table WorkoutSession (
sessionId int auto_increment,
workoutDate date ,
workoutTime time ,
customerId int,
workoutId int,
primary key (sessionId),
foreign key (customerId) references Customer(customerId),
foreign key (workoutId) references WorkoutClass(workoutId)
);

create table CustomerPhone (
phoneNumber varchar(13),
customerId int,
primary key(phoneNumber),
foreign key (customerId) references Customer(customerId)
);


insert into Membership (membershipType, startDate, endDate) values
("3 Month", "2020-12-10","2021-03-10"),
("3 Month", "2020-12-18","2021-03-18"),
("3 Month", "2020-12-25","2021-03-25"),
("3 Month", "2020-12-13","2021-03-13"),
("3 Month", "2020-12-17","2021-03-17"),
("3 Month", "2020-12-12","2021-03-12"),
("3 Month", "2021-01-02","2021-04-02"),
("3 Month", "2020-12-10","2021-03-10"),
("6 Month", "2020-12-10","2021-06-10"),
("6 Month", "2021-01-04","2021-07-04"),
("6 Month", "2021-03-30","2021-09-30"),
("12 Month", "2020-11-14","2021-11-14"),
("12 Month", "2021-02-26","2022-02-26");

insert into Customer (membershipId,fName, lName, dob, town, street, county) values
(1,"Jack", "Jones", "1997-02-20","Wexford Town","Main Street", "Wexford"),
(2,"Alex", "Denby", "2001-03-18","BridgeTown","Curacloe", "Wexford"),
(3,"Jody", "Sexton", "2000-07-24","Westport","Quay Road", "Mayo"),
(4,"Harold", "Ryan", "1982-08-10","Westport","Reek View", "Mayo"),
(5,"Bob", "Orton", "1976-09-10","Laghy","Main Street", "Donegal"),
(6,"Rhys", "Matthews", "2000-10-06","Kernanstown","Tullow Road", "Carlow"),
(7,"Ruaidhri", "Maxwell", "2000-11-03", "Laghy","Main Street", "Donegal"),
(8, "John", "Ross", "2002-12-19","Rosslare","Quay Road", "Wexford"),
(9, "Rico", "Rodriguez", "1998-07-31", "Kernanstown","Tullow Road", "Carlow"),
(10, "Ben", "Cho", "2001-03-30", "Laghy","Main Street", "Donegal"),
(11, "Sinead", "O' Loughlan", "1988-11-01", "Mount Charles", "Forge Road", "Donegal"),
(12, "Beth", "Power", "1997-03-05", "BridgeTown","Curacloe", "Wexford"),
(13, "Sarah", "Bourke", "1999-01-06", "Kernanstown","Tullow Road", "Carlow");

insert into Facility (facilityName, town, street, county, phoneNumber) values
("Max Gym Carlow", "Kernanstown","Tullow Road", "Carlow", "0873645364"),
("Max Gym Wexford", "Wexford Town","Main Street", "Wexford", "0831937584"),
("Max Gym Donegal", "Laghy","Main Street", "Donegal", "0842734636"),
("Max Gym Mayo", "Westport","Quay Road", "Mayo", "0893736273");

insert into Trainer (fName, lName, phoneNumber) values
("Bob", "Ross", "0836475847"),
("Jack","Carley", "0874623726"),
("Janet", "Cooney", "084848574"),
("Una", "Ferns", "0832939321"),
("Jared", "Stanford", "0834439493"),
("Harry", "Walsh", "08374636273"),
("Jennifer","Bale", "0834757485"),
("Niamh","Hayes","08737263562");

insert into WorkoutClass (customerId, facilityId, WorkoutName, duration) values
#Wexford Facility members
(1,2,"Cardio",0.5),
(2,2,"Ab Training",1),
(8,2,"Cardio",1.5),
(12,2,"Swimming",2),
#Mayo Facility members
(3,4,"Boxing",0.75),
(4,4,"Cardio",1),
#Carlow Facility members
(6,1,"Weight Training", 0.75),
(9,1,"Swimming",1.5),
(13,1,"Boxing",1),
#Donegal Facility members
(5,3,"Cardio",1.5),
(7,3,"Weight Training",0.5),
(10,3,"Swimming",1),
(11,3,"Boxing",1.5);

insert into Trains (WorkoutId,trainerId) values
#Wexford 
(1,7),(2,6),(3,7),(4,6),
#Mayo
(5,5),(6,8),
#Carlow
(7,4),(8,3),(9,4),
#Donegal
(10,2),(11,1),(12,2),(13,1);

insert into WorkoutSession (workoutDate, workoutTime, customerId, workoutId) values
#Wexford
("2020-12-13","12:05:00",1,1),
("2020-12-28","18:30:00",2,2),
("2021-01-02","13:15:00",8,3),
("2020-11-15","14:30:00",12,4),
#Mayo
("2021-01-01","15:00:00",3,5),
("2020-12-13","17:00:00",4,6),
#Carlow
("2020-12-13","19:00:00",6,7),
("2020-12-11","15:30:00",9,8),
("2021-02-28","12:35:00",13,9),
#Donegal
("2020-12-18","14:05:00",5,10),
("2021-01-03","13:20:00",7,11),
("2021-01-06","18:00:00",10,12),
("2021-04-01","16:30:00",11,13);

insert into CustomerPhone (phoneNumber, customerId) values 
("0873647586",1),("0873457586",1),("08648484844",2),("0539383412",3),
("0906629918",4),("(01)4589096",5),("09335333",6),
("(059)8631498",7),("(059)5655555",7),("(042)9328500",8),("(087)2151132",9),
("0894837283",10),("061355102",11),("0832928837",12),
("09347803",13),("087353635",13);








