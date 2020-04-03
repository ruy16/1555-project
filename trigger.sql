--project triggers
-----------------views and procedures and helper functions------------------
-----------------TRIGGERS---------------
--drop trigger ASSIGN_MEDAL;
create or replace trigger ASSIGN_MEDAL
    before insert or update on SCOREBOARD
    referencing NEW AS newRow
    for each row
    when ( newRow.POSITION != old.POSITION )
    BEGIN
        if(:newRow.position<4)
            then
       :newRow.medal_id := :newRow.position;
       else
            :newRow.medal_id := null;
       end if;
    end;
    /

-------------to help with trigger ATHLETE_DISMISAL--------------------
----May not be useful yet
create or replace function find_team_id(
 id integer
)return integer
is
t_id integer;
begin
    SELECT TEAM_ID into t_id
    FROM TEAM_MEMBER
    where PARTICIPANT_ID=id;
    return t_id;
end;
---------------------------------------
create or replace function count_teamate(
 id integer
)return integer
is
    num integer;
begin
    num:=0;
    for i in (SELECT * from TEAM_MEMBER where TEAM_ID = id)
    loop
        num:= num+1;
        end loop;
    return num;
end;
    /
declare i integer;
    begin
    i:=count_teamate(0);
    DBMS_OUTPUT.PUT_LINE(i);
end;

create or replace trigger ATHLETE_DISMISAL
    before delete on PARTICIPANT
    referencing old as oldRow
    for each row
    declare t_id integer;
    begin
        for i in (select TEAM_ID from TEAM_MEMBER where PARTICIPANT_ID=:oldRow.PARTICIPANT_ID)
        loop
            t_id := i.TEAM_ID;
            delete SCOREBOARD where PARTICIPANT_ID = :oldRow.PARTICIPANT_ID;
           -- delete TEAM_MEMBER where PARTICIPANT_ID = :oldRow.participant_id;
            if(count_teamate(t_id) > 1)
                then
                update EVENT_PARTICIPATION set(STATUS) = 'n' where TEAM_ID = t_id;
            else if(count_teamate(t_id) = 1)
                then
                delete TEAM where TEAM_ID = t_id;
                delete EVENT_PARTICIPATION where TEAM_ID = t_id;
            end if;
            end if;
        end loop;
    end;
    /
delete PARTICIPANT where PARTICIPANT_ID = 0;


---------------------------
---------to help with trigger enforce capacity
create or replace view event_view as
    select * from EVENT;

--returns the current number of events held in this venue
----May not be useful yet
create or replace function get_event_count(
v_id integer
)return integer
IS amount integer;
begin
    select sum(event_id) into amount from EVENT where VENUE_ID = v_id;
    return amount;
end;
-------------------------
create or replace TRIGGER ENFORCE_CAPACITY
    before UPDATE OR INSERT ON EVENT
    REFERENCING NEW AS newRow
    for each row
    declare
    amount integer;
    venue_capacity integer;
    capacity_exceeded exception ;
    begin
        select COUNT(event_id) into amount from EVENT where VENUE_ID = :newRow.venue_id;
        select capacity into venue_capacity from VENUE where VENUE_ID = :newRow.venue_id;
        if(amount >= venue_capacity) then raise capacity_exceeded;
        end if;
    --EXCEPTION
      --  when capacity_exceeded
        --then
        --DBMS_OUTPUT.PUT_LINE('Max venue capacity exceeded!');
    end;
    /

--this needs to make sure that a event took place after the opening date of the olympic game

--drop trigger ENFORCE_EVENT_TIME;
create or replace TRIGGER ENFORCE_EVENT_TIME
    before update or insert on EVENT
    referencing new AS newRow
    for each row
    declare
        opening_time date;
        event_time date;
        invaild_time exception ;
        o_id integer;
    begin
        select unique OLYMPICS_ID into o_id from VENUE natural join EVENT where VENUE_ID = :newRow.venue_id;
        select OPENING_DATE into opening_time from OLYMPICS where OLYMPIC_ID = o_id;
        if (:newRow.event_time < opening_time)
        then raise invaild_time;
        END IF;
        Exception
         when TOO_MANY_ROWS
         then DBMS_OUTPUT.PUT_LINE ('Too many openning date for this olympics');
        when NO_DATA_FOUND
         then DBMS_OUTPUT.PUT_LINE('There is no olympics game matches this event, you are fine');
        when others
        then raise_application_error(21 -20011,'Unknown Exception in ENFORCE_EVENT_TIME');
    end;
    /


