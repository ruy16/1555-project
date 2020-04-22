--project triggers
-----------------views and procedures and helper functions------------------
-----------------TRIGGERS---------------
--drop trigger ASSIGN_MEDAL;
create or replace trigger ASSIGN_MEDAL
    before insert or update on SCOREBOARD
    referencing NEW AS newRow
    for each row
    --when ( newRow.POSITION != old.POSITION or new)
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
    /
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
/

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
            delete TEAM_MEMBER where PARTICIPANT_ID = :oldRow.participant_id;
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
    /
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
        select COUNT(event_id) into amount from EVENT where VENUE_ID = :newRow.venue_id and EVENT_TIME = :newRow.event_time;
        select capacity into venue_capacity from VENUE where VENUE_ID = :newRow.venue_id;
        if(amount >= venue_capacity) then raise capacity_exceeded;
        end if;
    --EXCEPTION
        --when capacity_exceeded
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

------------ ORGANIZER FUNCTIONS----------------------------
-----------------------------------------
--Given a username, passkey, role id, add a new user to the system. The “last login” should be set with the creation date and time.
-- Only organizers with can add any kind of users to the system. User IDs should be auto-generated (look at the note below).
create or replace function createUser(username varchar2,passkey varchar2,role_id integer)
return integer
IS
user_id int;
login_time date;
begin
    select sysdate into login_time from dual;
    user_id := User_account_id.nextval;
    insert into USER_ACCOUNT values(user_id,username,passkey,role_id,login_time);
    commit ;
    return user_id;
end;
    /

--------------------------------
--This function should remove the user from the system.
create or replace function dropUser(u_id integer)
return varchar2
IS
uName varchar2(20);
begin
    select USERNAME into uName from USER_ACCOUNT where USER_ID=u_id;
    delete from USER_ACCOUNT where user_id = u_id;
    return uName;
end;
    /

--------------------------------
drop sequence eventId;
create sequence eventId
start with 24
increment by 1
minvalue 23
nomaxvalue
nocycle ;

create or replace function createEvent(sport_id integer,venue_id integer,gender char,occupancy varchar2)
return integer
is
eID integer;
begin
    eID := eventId.nextval;
    insert into EVENT values(eID,sport_id,venue_id,gender,To_Date(occupancy,'yyyy/mm/dd hh24:mi:ss'));
    return eID;
end;
    /

--------------------------------
create or replace function addEventOutcome(olym_id integer,e_id integer,part_id integer,pos integer)
return integer
IS
t_id integer;
begin
    select EVENT_PARTICIPATION.TEAM_ID into t_id from ((select * from TEAM_MEMBER where PARTICIPANT_ID = part_id) c join EVENT_PARTICIPATION on c.TEAM_ID=EVENT_PARTICIPATION.TEAM_ID) where EVENT_ID = e_id;
    insert into SCOREBOARD values(olym_id,e_id,t_id,part_id,pos,pos);
    return 0;
    EXCEPTION
        when no_data_found then
        DBMS_OUTPUT.PUT_LINE('Wrong information, this participant may not be part of the given event');
        return -1;
end;
    /

--select * from TEAM_MEMBER;
-------------COACH FUNCTIONS----------------------
--------------------------------------------------
--COACH CREATES A TEAM,and only coaches can create teams and their name is added as the team coach (team member).
drop sequence Gt_id;
create sequence Gt_id
start with 101
increment by 1
minvalue 100
nomaxvalue
nocycle ;
create or replace function createTeam (
olympic_city varchar2,year varchar2,sportID integer,countryID integer,name varchar2,coachID integer
)return integer
IS
new_team_id integer;
O_id integer;

begin
    for id in (select EXTRACT(year from OPENING_DATE) as y,OLYMPIC_ID from OLYMPICS where HOST_CITY = olympic_city )
    loop
        if(id.y = year)
            then
            O_id := id.OLYMPIC_ID;
            end if;
        end loop;
    new_team_id := Gt_id.nextval;
    insert into TEAM values (new_team_id,O_id,name,countryID,sportID,coachID);
    return new_team_id;
end;
/
------Given a team id and an event id, the team is register to an existing event
create or replace function registerTeam(
e_id integer,t_id integer
)return integer
IS
begin
    insert into EVENT_PARTICIPATION values(e_id,t_id,'e');
    return 0;
end;
/


-----Given the first name, last name, nationality, birth place, do, create participant.
drop sequence Gpart_id;
create sequence Gpart_id
start with 141
increment by 1
minvalue 141
nomaxvalue
nocycle ;
create or replace function addParticipant(
f_name varchar2,l_name varchar2,nationel varchar2,b_place varchar2,birth VARCHAR2
)return integer
IS
p_id integer;
begin
    p_id := Gpart_id.nextval;
    insert into PARTICIPANT values(p_id,f_name,l_name,nationel,b_place,TO_DATE(birth,'yyyy/mm/dd hh24:mi:ss'));
    return p_id;
end;
/


-----Given a team ID and a participant, add the member to the team. Only the coach of the team.
create or replace function addTeamMember(
t_id integer,p_id integer
)return integer
IS
begin
    insert into TEAM_MEMBER values(t_id,p_id);
    return 0;
end;
/

------This function should remove the athlete from the system (i.e., deleting all of their information from the system).
create or replace function dropTeamMember(
p_id integer
)return integer
IS
begin
    delete from PARTICIPANT where PARTICIPANT_ID = p_id;
    return 0;
end;
    /

------------------------------------
-----------------ALL----------------

------Given username and password, login in the system when an appropriate match is found with the appropriate role.
create or replace function login(
uname varchar2,password varchar2
)return integer
IS
user_found integer;
login_time date;
key varchar2(20);
begin
    select count(USER_ID) into user_found from USER_ACCOUNT where USERNAME = uname;
    if(user_found = 0)
    then
        --RAISE_APPLICATION_ERROR(-20101,'username not found');
        return -1;
    else
        select PASSKEY into key from USER_ACCOUNT where USERNAME = uname;
        if(key = password)
            then
            return 0;
        end if;
    end if;
    return -2;
end;
    /

-----Given a sport name, it displays the Olympic year it was added,
-- events of that sport, gender, the medals winners and their countries.
-- (athletes who got medals should be displayed first according to medals i.e.,
-- gold, silver and bronze and sorted on the Olympic year).
create or replace function displaySport(
sport_name varchar
)return integer
IS
begin
    return -1;
end;
    /


-----Given an Olympic game (City, Year) and an event id, display the Olympic game,
-- event name, participant and the position along with the earned medal.
create or replace function displayEvent(
Olympic_city varchar2,olympic_year varchar2,event_id varchar2
)return integer
IS
begin
    return -1;
end;
    /
--retrive the sport name given an event id
create or replace function getSportName(e_id integer)
return varchar
IS
S_NAME VARCHAR2(20);
s_id integer;
begin
    select SPORT_ID into s_id from EVENT where EVENT_ID = e_id;
    select SPORT_NAME into S_NAME from SPORT where SPORT_ID = s_id;
    return S_NAME;
end;
    /
--retrieve the olympic num given the olympic year and city
create or replace function getOlympicNum(
year varchar2,city varchar2
)return varchar2
IS
Onum varchar2(20);
begin

    for id in (select EXTRACT(year from OPENING_DATE) as y,OLYMPIC_ID,OLYMPIC_NUM from OLYMPICS where HOST_CITY = city )
    loop
        if(id.y = year)
            then
            Onum := id.OLYMPIC_NUM;
        end if;
        end loop;
    return Onum;
    EXCEPTION
    WHEN no_data_found
    then return '-1';
end;
    /


----Given a country and an olympic id, display all the participating countries (country abbreviation), the first year the country participated in the Olympics along
-- with the number of gold, silver and bronze medals
-- and their ranking sorted in descending order.
-- The rank is computed based on the points associated with each metal.

-- the three function below counts the num of medal of each type a country has won in an olympics game
create or replace function countGold(
countryID integer,olmypicID integer
)return integer
IS
gold_count integer;
    begin
        select count(medal_id) as gold into gold_count from (select unique country_id,team.team_id,medal_id from SCOREBOARD join TEAM on SCOREBOARD.team_id = TEAM.team_id where SCOREBOARD.olympics_id = olmypicID and medal_id =1)
        where COUNTRY_ID = countryID group by country_id;
        return gold_count;
    EXCEPTION
        WHEN no_data_found
            then
            return 0;
    end;
    /

create or replace function countSliver(
countryID integer,olmypicID integer
)return integer
IS
s_count integer;
    begin
        select count(medal_id) as sliver into s_count from (select unique country_id,team.team_id,medal_id from SCOREBOARD join TEAM on SCOREBOARD.team_id = TEAM.team_id where SCOREBOARD.olympics_id = olmypicID and medal_id =2)
        where COUNTRY_ID = countryID group by country_id;
        return s_count;
    EXCEPTION
        WHEN no_data_found
            then
            return 0;
    end;
    /
create or replace function countBronze(
countryID integer,olmypicID integer
)return integer
IS
b_count integer;
    begin
        select count(medal_id) as bronze into b_count from (select unique country_id,team.team_id,medal_id from SCOREBOARD join TEAM on SCOREBOARD.team_id = TEAM.team_id where SCOREBOARD.olympics_id = olmypicID and medal_id =3)
        where COUNTRY_ID = countryID group by country_id;
        return b_count;
    EXCEPTION
        WHEN no_data_found
            then
            return 0;
    end;
    /
drop table countryRanking;
create global temporary table countryRanking(
    cID integer,
    gold_count integer,
    sliver_count integer,
    bronze_count integer,
    total_points integer
)ON COMMIT DELETE ROWS;
--this function calculates the total points of each country and add it to a tem table
create or replace function getRanks(olmypicID integer
)return integer
IS
total_points integer;
begin
    for i in (select unique TEAM.country_id from TEAM join COUNTRY on TEAM.country_id = COUNTRY.country_id where olympics_id = olmypicID)
    loop
    total_points := countGold(i.COUNTRY_ID,olmypicID)*3 + countSliver(i.COUNTRY_ID,olmypicID)*2 + countBronze(i.COUNTRY_ID,olmypicID)*1;
    INSERT INTO countryRanking VALUES (i.COUNTRY_ID,countGold(i.COUNTRY_ID,olmypicID),countSliver(i.COUNTRY_ID,olmypicID),countBronze(i.COUNTRY_ID,olmypicID),total_points);
   end loop ;
    return 0;
end;
    /


------Given an olympic id and a number k, display the top-k athletes
-- based on their rank along with the number of gold,
-- silver and bronze medals in a descending order of their rank.
-- The rank is computed based on the points associated with each metal.
drop table playerRank;
create global temporary table playerRank(
    player_name varchar2(30),
    player_id integer,
    gold_count integer,
    sliver_count integer,
    bronze_count integer,
    total_points integer
)on commit delete rows ;
create or replace function countPlayerGold(o_id integer,
p_id integer
)return integer
IS
G_count integer;
begin
    select count(medal_id) into G_count from (select participant_id,medal_id from SCOREBOARD where olympics_id = o_id and medal_id = 1 and PARTICIPANT_ID=p_id) c group by participant_id;
    return G_count;
    EXCEPTION
    WHEN no_data_found
        then
        return 0;
end;
    /

create or replace function countPlayerSliver(o_id integer,
p_id integer
)return integer
IS
S_count integer;
begin
    select count(medal_id) into S_count from (select participant_id,medal_id from SCOREBOARD where olympics_id = o_id and medal_id = 2 and PARTICIPANT_ID=p_id) c group by participant_id;
    return S_count;
    EXCEPTION
    WHEN no_data_found
        then
        return 0;
end;
    /

create or replace function countPlayerBronze(o_id integer,
p_id integer
)return integer
IS
B_count integer;
begin
    select count(medal_id) into B_count from (select participant_id,medal_id from SCOREBOARD where olympics_id = o_id and medal_id = 3 and PARTICIPANT_ID=p_id) c group by participant_id;
    return B_count;
    EXCEPTION
    WHEN no_data_found
        then
        return 0;
end;
    /

create or replace function Athletes_Score(
olym_id varchar2
)return integer
IS
gold integer;
sliver integer;
bronze integer;
name varchar2(20);
begin
    for a in (select unique PARTICIPANT_ID from SCOREBOARD where OLYMPICS_ID = olym_id)
    loop
    select fname || ' '  || lname as fullname into name from PARTICIPANT where PARTICIPANT_ID = a.PARTICIPANT_ID;
    gold := countPlayerGold(olym_id,a.PARTICIPANT_ID);
    sliver := countPlayerSliver(olym_id,a.PARTICIPANT_ID);
    bronze := countPlayerBronze(olym_id,a.PARTICIPANT_ID);
    insert into PLAYERRANK values (name,a.PARTICIPANT_ID,gold,sliver,bronze,gold*3+sliver*2+bronze);
    end loop;
    return 0;
end;
    /

------Given an athlete, a olympic id and a number n,
-- find all the athletes who are connected to this athlete
-- based on the participation in the last n + 1 games.
-- That is, it displays pairs of athletes that are n hops apart.
-- For example if n is 1 and we have three athletes A, B, and C (A ̸= B ̸= C),
-- then A and C are connected (1 hop apart),
-- if A competes with B in the current Olympic games (olympic id)
-- and C competed with B in the immediate previous Olympic (olympic id).
drop table conectedAthlete;
create global temporary table conectedAthlete(
    athlete_name varchar2(20)
)on commit delete rows;
create or replace function connectedAthletes(olym_id integer,
part_id integer,n integer
)return integer
IS
connected_olympic_id integer;
connected_athlete_name varchar2(20);
begin
    connected_olympic_id := olym_id + n;
    for athle in (select unique s.PARTICIPANT_ID as competors from
        (select * from SCOREBOARD where OLYMPICS_ID=olym_id and PARTICIPANT_ID=part_id) c join SCOREBOARD s on c.EVENT_ID=s.EVENT_ID and c.OLYMPICS_ID=s.OLYMPICS_ID
        where c.PARTICIPANT_ID!=s.PARTICIPANT_ID)
    loop
        for i_athle in (select unique s.PARTICIPANT_ID as competors from
            (select * from SCOREBOARD where OLYMPICS_ID=connected_olympic_id and PARTICIPANT_ID=athle.competors) c join SCOREBOARD s on c.EVENT_ID=s.EVENT_ID and c.OLYMPICS_ID=s.OLYMPICS_ID
            where c.PARTICIPANT_ID!=s.PARTICIPANT_ID)
        loop
            if(part_id!=i_athle.competors)
                then
                select fname || ' ' || lname as fullname into connected_athlete_name from PARTICIPANT where PARTICIPANT_ID = i_athle.competors;
                insert into conectedAthlete values (connected_athlete_name);
            end if;
        end loop;
    end loop;
    return 0;
    EXCEPTION
        WHEN no_data_found
        then return -1;
end;
    /

------logout
-- The function should return the user to the top level of the UI
-- after marking the time of the user’s logout in the user’s “last login”
-- field of the USER ACCOUNT relation.
create or replace function logout(userID integer)
return integer
IS
last_log date;
begin
    select sysdate into last_log from dual;
    update USER_ACCOUNT set LAST_LOGIN = last_log where USER_ID = userID;
    return 0;
end;
    /

------exit
---This option should cleanly shut down and exit the program.
create or replace function exit
return integer
IS
begin
    return -1;
end;
    /
