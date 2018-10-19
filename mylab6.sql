CREATE DATABASE mylab6;

drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

CREATE TABLE Movie(
  mID SERIAL PRIMARY KEY,
  title text,
  year int CHECK(year > 1900),
  director text,
  UNIQUE(title, year)
);



CREATE TABLE Reviewer(
  rID SERIAL PRIMARY KEY,
  name text NOT NULL
);
CREATE TABLE Rating(
  rID INT,
  mID INT,
  stars INT NOT NULL CHECK(stars BETWEEN 1 AND 5),
  ratingDate DATE,
  UNIQUE(rID, mID, ratingDate)
);

insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

ALTER TABLE Movie ADD CONSTRAINT check_year CHECK((director <> 'Steven Spielberg' or year < 1990) AND (director <> 'James Cameron' or year > 1990));--10

UPDATE Movie SET mID = mID + 1;--11

INSERT INTO Movie VALUES(109, 'Titanic', 1997, 'JC');--12

INSERT INTO Reviewer VALUES(201, 'Ted Codd');--13

UPDATE Rating SET rID = 205, mID = 104;--14

INSERT INTO Reviewer VALUES(209, NULL);--15

UPDATE Rating SET stars = NULL WHERE rID = 208;--16

UPDATE Movie SET year = year - 40;--17

UPDATE Rating SET stars = stars + 1;--18

INSERT INTO Rating VALUES(201, 101, 1, '1999-01-01');--19

INSERT INTO Movie VALUES(109, 'Jurassic Park', 1993, 'Steven Spielberg');--20

UPDATE Movie SET year = year-10 WHERE title = 'Titanic';--21

INSERT INTO Movie VALUES(109, 'Titanic', 2001, NULL);--22

UPDATE Rating SET mID = 109;--23

UPDATE Movie SET year = 1901 WHERE director <> 'James Cameron';--24

UPDATE Rating SET stars = stars - 1;--25


INSERT INTO Rating VALUES(209, 109, 3, '2001-01-01');--27

UPDATE Rating SET rID = 209 WHERE rID = 208;--28

UPDATE Rating SET mID = mID + 1;--29

UPDATE Movie SET mID = 109 WHERE mID = 108;--30

UPDATE Movie SET mID = 109 WHERE mID = 102;--31

UPDATE Reviewer SET rID = rID + 10;--32

DELETE FROM Reviewer WHERE rID > 215;--33

DELETE FROM Movie WHERE mID < 105;--34


SELECT SUM(rID) FROM Rating WHERE rID IS NOT NULL;

SELECT COUNT(*) FROM Rating WHERE rID IS NULL;






