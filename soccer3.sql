DROP DATABASE soccer3;
CREATE DATABASE soccer4;

USE soccer4;

--Creating tables:

CREATE TABLE team(
    ID int NOT NULL,
    city varchar(100) NOT NULL,
    team_name varchar(100) NOT NULL,
    stadium varchar(100) NOT NULL,
);

ALTER TABLE team ADD PRIMARY KEY(ID);

CREATE TABLE player(
    num int NOT NULL,
    DoB varchar(100) NOT NULL,
    player_name varchar(100) NOT NULL,
    startYear int NOT NULL,
    shirtNum int NOT NULL,
    teamID int NOT NULL,
);

ALTER TABLE player ADD PRIMARY KEY(num);

CREATE TABLE referee(
    ID int NOT NULL,
    DoB varchar(100) NOT NULL,
    ref_name varchar(100) NOT NULL,
    expYear int NOT NULL,
);

ALTER TABLE referee ADD PRIMARY KEY(ID);


CREATE TABLE match(
    hostID int NOT NULL,
    guestID int NOT NULL,
    m_date varchar(100) NOT NULL,
    hostscore int NOT NULL,
    guestscore int NOT NULL, 
);

ALTER TABLE match ADD PRIMARY KEY(m_date);


CREATE TABLE referee_role(
    hostID int NOT NULL,
    guestID int NOT NULL,
    m_date varchar(100) NOT NULL,
    refID int NOT NULL,
    isMain int NOT NULL,
);



CREATE TABLE match_player(
    ID int NOT NULL,
    player_num int NOT NULL,
    m_date varchar(100) NOT NULL,
    hostID int NOT NULL,
    guestID int NOT NULL,
    numgoals int NOT NULL,
    redflags int NOT NULL,
    yellowflags int NOT NULL,
);

ALTER TABLE match_player ADD PRIMARY KEY(ID);

--Constraint:

ALTER TABLE player
ADD CONSTRAINT year_check CHECK(startYear<=2020);

ALTER TABLE referee
ADD CONSTRAINT exp_check CHECK(expYear<=60);

ALTER TABLE team
ADD CONSTRAINT ID UNIQUE(ID);

ALTER TABLE player
ADD CONSTRAINT num UNIQUE(num);

ALTER TABLE match
ADD CONSTRAINT FK_match
FOREIGN KEY (hostID) REFERENCES team(ID);

ALTER TABLE match
ADD CONSTRAINT FK_match1
FOREIGN KEY (guestID) REFERENCES  team(ID);

ALTER TABLE referee_role
ADD CONSTRAINT FK_referee_role
FOREIGN KEY (hostID) REFERENCES  team(ID);

ALTER TABLE referee_role
ADD CONSTRAINT FK_referee_role1
FOREIGN KEY (guestID) REFERENCES  team(ID);

ALTER TABLE referee_role
ADD CONSTRAINT FK_referee_role2
FOREIGN KEY (m_date) REFERENCES  match(m_date);

ALTER TABLE match_player
ADD CONSTRAINT FK_match_player1
FOREIGN KEY (player_num) REFERENCES  player(num);

ALTER TABLE match_player
ADD CONSTRAINT FK_match_player2
FOREIGN KEY (m_date) REFERENCES  match(m_date);

ALTER TABLE match_player
ADD CONSTRAINT FK_match_player3
FOREIGN KEY (hostID) REFERENCES  team(ID);

ALTER TABLE match_player
ADD CONSTRAINT FK_match_player4
FOREIGN KEY (guestID) REFERENCES  team(ID);

ALTER TABLE referee_role
ADD CONSTRAINT FK_referee_role5
FOREIGN KEY (refID) REFERENCES  referee(ID);

--Populating the tables:

INSERT INTO team(ID, city, team_name, stadium) VALUES
(1, 'banglore', 'banglore_bulls', 'chinnaswami'),
(2, 'chennie', 'super_kings', 'APU'),
(3, 'mumbai', 'knights', 'sea_soul'),
(4, 'delhi', 'dare_devils', 'the_hall'),
(5, 'kokaltha', 'tigers', 'rasagulla'),
(6, 'bihar', 'bears', 'sangama'),
(7, 'hydrabad', 'heads', 'reddys');

SELECT * FROM team;

INSERT INTO player(num, DoB, player_name, startYear, shirtNum, teamID) VALUES
(01, '06-10-1999', 'mukthi', 2010, 4, 1),
(02, '10-10-1994', 'poornash', 2008, 6, 1),
(03, '12-01-1992', 'devash', 2004, 2, 1),
(04, '01-11-2000', 'harshita', 2010, 5, 2),
(05, '20-04-1998', 'anup', 2000, 3, 2),
(06, '31-03-1999', 'deepa', 2010, 7, 2),
(07, '09-09-1994', 'kshitij', 2006, 10, 3),
(08, '12-02-2001', 'john', 2013, 11, 3),
(09, '19-06-1995', 'bowny', 2000, 15, 4),
(10, '21-03-2000', 'tom', 2010, 13, 5),
(11, '31-05-2001', 'smith', 2011, 14, 6),
(12, '22-07-1999', 'swetha', 2009, 15, 7);

SELECT * FROM player;


INSERT INTO  referee(ID, DoB, ref_name, expYear) VALUES
(11, '12-06-1989', 'ram', 30),
(31, '31-05-1983', 'swathi', 25),
(45, '21-09-1990', 'joseph', 40),
(32, '25-10-1990', 'tommy', 30),
(50, '28-08-1985', 'sham', 43),
(71, '28-02-1988', 'shilpa', 50),
(30, '14-03-1992', 'tusky', 20),
(14, '21-07-1986', 'bharth', 45);

SELECT * FROM referee;

INSERT INTO  match(hostID, guestID, m_date, hostscore, guestscore) VALUES
(1, 2, '01-01-2020', 20, 10),
(1, 4, '29-06-2019', 25, 20),
(2, 3, '02-06-2019', 30, 25),
(6, 7, '12-07-2019', 30, 35),
(5, 4, '21-09-2019', 20, 30),
(6, 5, '02-02-2020', 30, 25);

SELECT * FROM match;

INSERT INTO  referee_role(hostID, guestID, m_date, refID, isMain) VALUES
(1, 2, '01-01-2020', 11, 1),
(1, 2, '01-01-2020', 31, 0),
(1, 2, '01-01-2020', 45, 0),
(1, 4, '29-06-2019', 32, 1),
(1, 4, '29-06-2019', 50, 0),
(1, 4, '29-06-2019', 71, 0);

SELECT * FROM referee_role;



INSERT INTO  match_player(ID, player_num, m_date, hostID, guestID, numgoals, redflags, yellowflags) VALUES
(01, 01, '01-01-2020', 1, 2, 5, 0, 1),
(02, 04, '02-06-2019', 2, 3, 4, 1, 0),
(03, 07, '02-06-2019', 2, 3, 3, 0, 0),
(04, 09, '29-06-2019', 1, 4, 5, 0, 1),
(05, 10, '02-02-2020', 6, 5, 1, 1, 0),
(06, 11, '12-07-2019', 6, 7, 2, 1, 1),
(07, 12, '12-07-2019', 6, 7, 6, 0, 0);

SELECT * FROM match_player;

--Nested queries
--given the shirtNumber display the ID and number of goals of that player:
SELECT id, numGoals from match_player where match_player.player_num = (SELECT num from player where shirtNum = 5);

--given the Name of the referee to see if the referee is main referee or not( if 1 yes, 0 then no):
SELECT isMain from referee_role where referee_role.refID = (SELECT ID from referee where ref_name='shilpa');




--Aggregate function:
--To display the Referee name and referee ID who has the highestt experience:
Select ID, ref_name, expYear from referee where expYear = (select max(expYear) from referee);


--To display max and minimum number of goals along with the ID and player number:
Select ID, player_num, numgoals from match_player where numGoals = (select max(numGoals) from match_player);
Select ID, player_num, numgoals from match_player where numGoals = (select min(numGoals) from match_player);




--JOIN
--Given the shirt no display the number of red flags and yellow flags got by that player:
SELECT redflags, yellowflags from match_player
LEFT JOIN player ON player.num = match_player.player_num WHERE player.shirtNum = 5; 

--To display the over all information of the teams that are hosting the soccer event:
SELECT * FROM team
LEFT JOIN player ON player.teamID = team.ID
LEFT JOIN match ON match.hostID = team.ID;



--Triggers:
DROP TRIGGER IF EXISTS team_check;
GO
CREATE TRIGGER team_check ON team INSTEAD OF INSERT 
AS BEGIN 
   DECLARE @tid INT;
   DECLARE @tcity VARCHAR(100);
   DECLARE @tname VARCHAR(100);
   DECLARE @tstadium VARCHAR(100);
   SELECT @tid = ID , @tcity = city , @tname = team_name, @tstadium = stadium FROM inserted;
   IF EXISTS(SELECT * FROM team WHERE @tname = team_name)
        THROW 52000, 'Team name already exists',1;
   ELSE
       INSERT INTO team(ID, city, team_name, stadium) VALUES (@tid, @tcity, @tname, @tstadium) 
END;

INSERT INTO team values(10, 'chennie', 'super_kings', 'APU');

DROP TRIGGER IF EXISTS referee_check;
GO
CREATE TRIGGER referee_check ON referee INSTEAD OF INSERT 
AS BEGIN 
   DECLARE @ttid INT;
   DECLARE @ttDoB VARCHAR(100);
   DECLARE @ttref_name VARCHAR(100);
   DECLARE @ttexpYear INT;
   SELECT @ttid = ID , @ttDoB = DoB , @ttref_name = ref_name , @ttexpYear = expYear FROM inserted;
   IF EXISTS(SELECT * FROM referee WHERE @ttexpYear < 5)
        THROW 52000, 'Experiance should be more than 5 years',1;
   ELSE
       INSERT INTO referee(ID, DoB, ref_name, expYear) VALUES (@ttid, @ttDoB, @ttref_name, @ttexpYear) 
END;

INSERT INTO referee values(99, '21-07-1986', 'bharth', 1);
