--PROJECT PHASE 1
DROP TABLE EVENT_PARTICIPATION cascade constraints ;
DROP TABLE TEAM cascade constraints;
DROP TABLE TEAM_MEMBER cascade constraints;
DROP TABLE USER_ACCOUNT cascade constraints;
DROP TABLE USER_ROLE cascade constraints;
DROP TABLE SCOREBOARD cascade constraints;
DROP TABLE EVENT cascade constraints;
DROP TABLE VENUE cascade constraints;
DROP TABLE OLYMPICS cascade constraints;
DROP TABLE sport cascade constraints;
DROP TABLE PARTICIPANT cascade constraints;
DROP TABLE COUNTRY cascade constraints;
DROP TABLE MEDAL cascade constraints;


create table USER_ROLE(
    role_id integer primary key ,
    role_name varchar2(20) UNIQUE NOT NULL
);


create table USER_ACCOUNT(
    USER_ID INTEGER primary key,
    username varchar2(20) not null ,
    passkey varchar2(20) default 'GUEST' not null ,
    role_id integer not null ,
    last_login date default null,
    CONSTRAINT ROLE_ID_FK FOREIGN KEY (role_id) REFERENCES USER_ROLE(role_id)
);
--Assume it could be an ongoing event so closing date is not certain
create table OLYMPICS(
    olympic_id integer PRIMARY KEY ,
    olympic_num varchar2(30) NOT NULL ,
    host_city varchar2(20) not null ,
    opening_date date ,
    closing_date date,
    official_website varchar2(50)
);
--A description may not be needed
--A sport must have a birth date
--assume the default size is one
create table sport(
    sport_id integer primary key ,
    sport_name varchar2(30) unique not null ,
    description varchar2(80),
    dob date not null ,
    team_size integer default 1 check (team_size>0)
);
--assume the first knowledge of birth_place and date of birth may not be aquired
create table PARTICIPANT(
    participant_id integer primary key ,
    fname varchar2(30) not null ,
    lname varchar2(30) not null ,
    nationality varchar2(20) not null ,
    birth_place varchar2(40),
    dob date
);
--assume every country has a unique name and country code
create table COUNTRY(
    country_id integer primary key ,
    country varchar2(20) unique not null ,
    country_code varchar2(3) unique
);

create table TEAM(
    team_id integer primary key ,
    olympics_id integer ,
    team_name varchar2(50) ,
    country_id integer ,
    sport_id integer,
    coach_id integer not null,
    constraint TEAM_olympics_id_fk foreign key(olympics_id) references OLYMPICS(olympic_id),
    constraint TEAM_country_id_fk foreign key (country_id) references COUNTRY(country_id),
    constraint TEAM_sport_id_fk foreign key (sport_id) references sport(sport_id),
    constraint TEAM_coach_id_fk foreign key (coach_id) references PARTICIPANT(participant_id)
);

create table TEAM_MEMBER(
    team_id integer ,
    participant_id integer ,
    constraint team_id_pk primary key (team_id,participant_id),
    constraint team_id_fk foreign key (team_id) references TEAM(team_id),
    constraint participant_id_fk foreign key (participant_id) references PARTICIPANT(participant_id)
);

create table MEDAL(
    medal_id integer primary key check ( medal_id>0 ),
    medal_title varchar2(6) unique not null ,
    points integer not null check ( points>0 )
);

create table VENUE(
    venue_id integer primary key ,
    olympics_id integer,
    venue_name varchar2(30) unique not null ,
    capacity integer not null check (capacity>0),
    constraint venue_olympics_id_fk foreign key (olympics_id) references OLYMPICS(olympic_id)

);


create table EVENT(
    event_id integer primary key ,
    sport_id integer,
    venue_id integer,
    gender char not null ,
    event_time date not null ,
    constraint event_sport_id_fk foreign key (sport_id) references sport(sport_id),
    constraint event_venue_id_fk foreign key (venue_id) references VENUE(venue_id)
);

create table SCOREBOARD(
    olympics_id integer ,
    event_id integer,
    team_id integer ,
    participant_id integer,
    position integer not null check ( position>0 ),
    medal_id integer null check ( medal_id>0 and medal_id<=3),
    constraint SCOREBOARD_pk primary key (event_id,participant_id,team_id),
    constraint SCOREBOARD_event_id_fk foreign key(event_id) references EVENT(event_id),
    constraint SCOREBOARD_team_id_fk foreign key (team_id) references TEAM(team_id),
    constraint SCOREBOARD_participant_id_fk foreign key (participant_id) references PARTICIPANT(participant_id)
);

create table EVENT_PARTICIPATION(
    event_id integer,
    team_id integer,
    status char default 'e' not null ,
    constraint EVENT_PARTICIPATION_PK primary key (event_id,team_id),
    constraint EVENT_PARTI_team_id_fk foreign key (team_id) references TEAM(team_id),
    constraint EVENT_PARTI_event_id_fk foreign key (event_id) references EVENT(event_id)
);


