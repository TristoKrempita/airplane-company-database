create table crew_members
  (
     cm_id integer primary key,full_name TEXT,date_of_birth DATE
  );

create table aircrafts
  (
     aircraft_id integer primary key,aircraft_type TEXT
  );

create table cm_aircraft
  (
     cm_id integer references crew_members (cm_id) on update cascade on delete
     cascade,aircraft_id integer references aircrafts (aircraft_id) on update
             cascade,
     constraint cm_aircraft_pkey primary key (cm_id, aircraft_id)
  );

--INSERT DATA ABOUT AIRPLANES AND CREW MEMBERS
insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (1,'John Arbuckle','1979.12.06.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (2,'Mary Ramsen','1989.11.12.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (3,'Steve Ridley','1985.10.03.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (4,'Frank Shennon','1969.09.04.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (5,'Cornelia Lanman','1986.01.09.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (6,'Grace Lovejoy','1973.11.12.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (7,'Spencer Swedberg','1982.05.24.');

insert into crew_members
            (cm_id,full_name,date_of_birth)
values      (8,'Rhett Rather','1977.03.13.');

insert into aircrafts
values      (1,'Boeing 787');

insert into aircrafts
values      (2,'Lockheed SR-71 Blackbird');

insert into aircrafts
values      (3,'Cirrus SR22');

insert into aircrafts
values      (4,'Learjet 23');

insert into aircrafts
values      (5,'Boeing 737-500');

insert into aircrafts
values      (6,'Cessna 402');

insert into aircrafts
values      (7,'Tupolev Tu-214');

--INSERT DATA ABOUT EXPERIENCE
insert into cm_aircraft
values      (1,1);

insert into cm_aircraft
values      (1,2);

insert into cm_aircraft
values      (1,4);

insert into cm_aircraft
values      (2,5);

insert into cm_aircraft
values      (2,6);

insert into cm_aircraft
values      (3,3);

insert into cm_aircraft
values      (4,7);

insert into cm_aircraft
values      (4,6);

insert into cm_aircraft
values      (4,4);

insert into cm_aircraft
values      (4,5);

insert into cm_aircraft
values      (5,6);

insert into cm_aircraft
values      (6,7);

insert into cm_aircraft
values      (6,3);

insert into cm_aircraft
values      (7,2);

insert into cm_aircraft
values      (7,6);

insert into cm_aircraft
values      (7,7);

insert into cm_aircraft
values      (8,4);

insert into cm_aircraft
values      (8,3);

--OLDEST CREW MEMBER
select full_name,date_of_birth
from   crew_members
order  by date_of_birth asc
limit  1;

--FOURTH OLDEST CREW MEMBER
select full_name,date_of_birth
from   crew_members
order  by date_of_birth asc
limit  1 offset 3;

--MOST EXPERIENCED
select cm.full_name,Count(cma) as experience
from   crew_members cm
       inner join cm_aircraft cma
               on cm.cm_id = cma.cm_id
group  by cm.cm_id
order  by Count(cma) desc
limit  1;

--LEAST EXPERIENCED
select cm.full_name,Count(cma) as experience
from   crew_members cm
       inner join cm_aircraft cma
               on cm.cm_id = cma.cm_id
group  by cm.cm_id
order  by Count(cma) asc
limit  1;
