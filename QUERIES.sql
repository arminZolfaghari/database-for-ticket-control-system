USE TCS;

#alter table
alter table tickets add check (days_worked_on >= 0);


#1
select count(ticket_number), users.fname, users.lname
from users, tickets
where users.pplSoft = tickets.owner_pplSoft
group by users.pplSoft
having count(distinct tickets.ticket_number) > 3
order by count(distinct tickets.ticket_number) desc;

#2
select tech_personnel.fname, tech_personnel.lname, count(assignment.ticket_number) as number_of_ticket
from assignment, tech_personnel
where tech_personnel.pplSoft = assignment.tech_pplSoft
and assignment.status in ('closed successful', 'closed unsuccessful')
group by tech_personnel.pplSoft
having count(assignment.ticket_number) =
(select count(assignment.ticket_number)
from assignment, tech_personnel
where tech_personnel.pplSoft = assignment.tech_pplSoft
and assignment.status in ('closed successful', 'closed unsuccessful')
group by tech_personnel.pplSoft
order by count(assignment.ticket_number) desc limit 1);

'''
select count(ticket_number)
from assignment, tech_personnel
where tech_personnel.pplSoft = assignment.tech_pplSoft
and (assignment.status = 'closed successful' or assignment.status = 'closed unsuccessful')
group by tech_personnel.pplSoft
order by count(assignment.ticket_number) desc limit 1;
'''



#3_1
select inventory.machine_name, count(ticket_number)
from inventory, tickets
where tickets.machine_name = inventory.machine_name
and date_submitted between '1268-9-1' and '1268-9-30'
group by inventory.machine_name
having count(ticket_number) = (select count(ticket_number)
       from inventory,tickets
       where tickets.machine_name = inventory.machine_name
       and date_submitted between '1268-9-1' and '1268-9-30'
       group by inventory.machine_name
       order by count(ticket_number) DESC limit 1);

#3-2
select inventory.machine_name, count(ticket_number)
from tickets, inventory, locations
where tickets.machine_name = inventory.machine_name
and inventory.locationID = locations.locationID
and locations.building = '268'
and date_submitted between '1268-9-1' and '1268-9-30'
group by inventory.machine_name
having count(ticket_number) =
       (select count(ticket_number)
       from tickets, inventory, locations
       where tickets.machine_name = inventory.machine_name
       and inventory.locationID = locations.locationID
       and locations.building = '268'
       and date_submitted between '1268-9-1' and '1268-9-30'
       group by inventory.machine_name
       order by count(ticket_number)desc limit 1);

'''
select inventory.machine_name,count(ticket_number))
from locations, inventory, tickets
where tickets.machine_name = inventory.machine_name
and locations.locationID = inventory.locationID
and locations.building = '268'
and date_submitted between '1268-9-1' and '1268-9-30'
group by inventory.machine_name;
'''


#4-1
select AVG(tickets.days_worked_on)
from tickets
where tickets.date_submitted between '1268-9-1' and '1268-9-30';


#4-2
select tech_personnel.pplSoft, tech_personnel.fname, tech_personnel.lname, sum(tickets.days_worked_on) as days_worked_on
from assignment, tickets, tech_personnel
where tickets.ticket_number = assignment.ticket_number
and assignment.tech_pplSoft = tech_personnel.pplSoft
and tickets.date_submitted between '1268-9-1' and '1268-9-30'
group by assignment.tech_pplSoft
order by sum(tickets.days_worked_on) desc;


#trigger
CREATE TRIGGER TRIGGER1
    ON ASSIGNMENT
    after UPDATE AS
    BEGIN
    IF UPDATE(status)
        begin
        UPDATE TICKETS, ASSIGNMENT
        SET TICKETS.days_worked_on = TICKETS.days_worked_on + TICKETS.date_closed - ASSIGNMENT.date_assigned
        FROM ASSIGNMENT AS a NATURAL JOIN INSERTED
        WHERE a.status in ('closed successful','closed unsuccessful') and a.status = 'in progress';

#view

create view view1 as
select tp.pplSoft as final_pplsoft,tp.fname,tp.lname,a.status, t.ticket_number,t.date_submitted,t.date_closed,t.days_worked_on,t.categoryID,t.machine_name,t.description
from tickets as t,
     assignment as a,
     tech_personnel as tp
where t.ticket_number = a.ticket_number
  and a.tech_pplSoft = tp.pplSoft
and a.date_assigned =
       (select max(date_assigned)
        from assignment as a2
        where a2.ticket_number = t.ticket_number
       )
group by t.ticket_number, tp.pplSoft, a.date_assigned;
