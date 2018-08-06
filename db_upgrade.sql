-- SQL TRANSFER
SET foreign_key_checks = 0;

-- Create master roster of ambassadors
-- All personal info goes here

 DROP TABLE IF EXISTS master_roster;
CREATE TABLE master_roster
(
uid int AUTO_INCREMENT,
first_name varchar(255),
last_name varchar(255),
type int,
hometown varchar(255),
state varchar(255),
country varchar(255),
gender varchar(255),
highschool varchar(255),
major varchar(255), 
college varchar(255),
grad_year varchar(255),
email varchar(255),
phone varchar(255),
start_semester varchar(255),
ethnicity varchar(255),
trained_IV int,
trained_ath int,
PRIMARY KEY (uid)
)
ENGINE = InnoDB;

-- Abassador availability table
-- Create an entry for every ambassador and each of their time slots
 DROP TABLE IF EXISTS master_availability;
CREATE TABLE master_availability
(
uid int,
day int,
time int,
PRIMARY KEY (uid, day, time)
)
ENGINE = InnoDB;

-- Create a schedule 
-- Went from 50 tables to 1
 DROP TABLE IF EXISTS master_schedule;
CREATE TABLE master_schedule
(
uid int,
day int,
time int,
type int,
PRIMARY KEY (uid, day, time, type)
)
ENGINE = InnoDB;

-- Keep track of who went to their tours and when
 DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance
(
uid int,
day int,
time int,
type int,
week int,
status int,
special int,
timestamp timestamp,
PRIMARY KEY (uid, day, time, type, week)
)
ENGINE = InnoDB;

-- Training requirements and other meetings
 DROP TABLE IF EXISTS requirements;
CREATE TABLE requirements
(
uid int,
event varchar(255),
status int,
PRIMARY KEY (uid, event)
)
ENGINE = InnoDB;

-- Setting up table for covering other people's shifts
 DROP TABLE IF EXISTS coverage;
CREATE TABLE coverage
(
uid int,
day int,
time int,
type int,
week int,
date varchar(255),
covered int,
coverer int,
timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (uid, day, time, week)
)
ENGINE = InnoDB;

-- Add foriegn key constraints
 ALTER TABLE master_availability ADD FOREIGN KEY (uid) REFERENCES master_roster(uid) ON UPDATE CASCADE ON DELETE CASCADE;
 ALTER TABLE requirements ADD FOREIGN KEY (uid) REFERENCES master_roster(uid) ON UPDATE CASCADE ON DELETE CASCADE;
 ALTER TABLE coverage ADD FOREIGN KEY (uid) REFERENCES master_roster(uid) ON UPDATE CASCADE;
 ALTER TABLE master_schedule ADD FOREIGN KEY (uid) REFERENCES master_roster(uid) ON UPDATE CASCADE ON DELETE CASCADE;
 ALTER TABLE attendance ADD FOREIGN KEY (uid) REFERENCES master_roster(uid) ON UPDATE CASCADE ON DELETE CASCADE;
 CREATE EVENT populate_attendance
	ON SCHEDULE AT "2014-03-07 05:00:00"
	EVERY DAY
	
 -- Transfer masterroster2014 into master_roster
 -- Easy ones
INSERT INTO master_roster 
SELECT  UID, FirstName, LastName, 0, Hometown, state,
		Country, Gender, HighSchool, Major, College,
		GraduationYear, Email, PhoneNumber, SemesterStarted,
		Ethnicity, 0, 0
FROM masterroster2014;

 -- Get the guides that aren't in the masterroster2014
 -- Convert a first and last name column into 2 seperate columns
 -- Using guidelist
INSERT INTO master_roster (first_name, last_name, type)
SELECT 
LEFT(gl.Name, LOCATE(' ', gl.Name) - 1),
MID(gl.Name, LOCATE(' ', gl.Name) + 1),
0
FROM
(SELECT gl.Name 
FROM guidelist gl 
WHERE gl.Name NOT LIKE '%(M)%' 
AND gl.Name NOT IN (SELECT CONCAT(mr.first_name, ' ', mr.last_name) FROM master_roster mr)) gl;


-- Get the minglers that aren't in the masterroster2014
-- Minglers have (M) in the name
INSERT INTO master_roster (first_name, last_name, type)
SELECT 
LEFT(gl.Name, LOCATE(' ', gl.Name) - 1),
MID(gl.Name, LOCATE(' ', gl.Name) + 1),
3
FROM
(SELECT gl.Name 
FROM guidelist gl 
WHERE gl.Name LIKE '%(M)%' 
AND gl.Name NOT IN (SELECT CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') FROM master_roster mr)) gl;
 
 -- Determine if each person is a tour guide or mingler
UPDATE master_roster mr
INNER JOIN guidelist gl
ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name
SET mr.type = 3;

 -- Determine if users are trained in athletics
UPDATE master_roster SET trained_ath = 1 
WHERE uid IN (SELECT UID FROM masterroster2014 where TrainedOnAthletics = 'yes');

-- Coalesce the schedule tables into a single table
-- Generated in python based on the beginning of the 2014 calandar year
INSERT INTO master_schedule SELECT mr.uid,  1 ,  10 , mr.type FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  1 ,  11 , mr.type FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  1 ,  12 , mr.type FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  1 ,  14 , mr.type FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  1 ,  15 , mr.type FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  1 ,  16 , mr.type FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  10 , mr.type FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  11 , mr.type FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  12 , mr.type FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  14 , mr.type FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  15 , mr.type FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  2 ,  16 , mr.type FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  10 , mr.type FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  11 , mr.type FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  12 , mr.type FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  14 , mr.type FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  15 , mr.type FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  3 ,  16 , mr.type FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  10 , mr.type FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  11 , mr.type FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  12 , mr.type FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  14 , mr.type FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  15 , mr.type FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  4 ,  16 , mr.type FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  10 , mr.type FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  11 , mr.type FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  12 , mr.type FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  14 , mr.type FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  15 , mr.type FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  5 ,  16 , mr.type FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  6 ,  10 , mr.type FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  6 ,  11 , mr.type FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
INSERT INTO master_schedule SELECT mr.uid,  6 ,  12 , mr.type FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%');
 
 -- Generate the master_availability table based on the availability table
INSERT INTO master_availability SELECT mr.uid, 1 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 16 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday4pm = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 16 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday4pm = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 16 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday4pm = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 16 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday4pm = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 16 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday4pm = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 10 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday10am = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 11 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday11am = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 12 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday12pm = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 14 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday2pm = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 15 FROM availability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday3pm = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday1045 = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 13 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday1245 = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 14 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday145 = 1;
INSERT INTO master_availability SELECT mr.uid, 1 , 15 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Monday245 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday1045 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 13 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday1245 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 14 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday145 = 1;
INSERT INTO master_availability SELECT mr.uid, 2 , 15 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Tuesday245 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday1045 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 13 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday1245 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 14 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday145 = 1;
INSERT INTO master_availability SELECT mr.uid, 3 , 15 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Wednesday245 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday1045 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 13 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday1245 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 14 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday145 = 1;
INSERT INTO master_availability SELECT mr.uid, 4 , 15 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Thursday245 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday1045 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 13 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday1245 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 14 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday145 = 1;
INSERT INTO master_availability SELECT mr.uid, 5 , 15 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Friday245 = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 9 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday845 = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 10 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday945 = 1;
INSERT INTO master_availability SELECT mr.uid, 6 , 11 FROM mingleravailability a INNER JOIN master_roster mr ON mr.last_name = a.LastName AND mr.first_name = a.FirstName WHERE a.Saturday1045 = 1;
 INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 0, daytable.Jan06, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan06 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 0, daytable.Jan07, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan07 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 0, daytable.Jan08, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan08 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 0, daytable.Jan09, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan09 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 0, daytable.Jan10, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan10 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 0, daytable.Jan11, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan11 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 0, daytable.Jan11, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan11 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 0, daytable.Jan11, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan11 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 1, daytable.Jan13, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan13 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 1, daytable.Jan14, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan14 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 1, daytable.Jan15, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan15 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 1, daytable.Jan16, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan16 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 1, daytable.Jan17, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan17 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 1, daytable.Jan18, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan18 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 1, daytable.Jan18, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan18 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 1, daytable.Jan18, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan18 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 2, daytable.Jan20, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan20 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 2, daytable.Jan21, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan21 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 2, daytable.Jan22, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan22 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 2, daytable.Jan23, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan23 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 2, daytable.Jan24, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan24 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 2, daytable.Jan25, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan25 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 2, daytable.Jan25, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan25 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 2, daytable.Jan25, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan25 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 3, daytable.Jan27, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan27 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 3, daytable.Jan28, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan28 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 3, daytable.Jan29, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan29 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 3, daytable.Jan30, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan30 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 3, daytable.Jan31, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Jan31 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 3, daytable.Feb01, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb01 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 3, daytable.Feb01, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb01 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 3, daytable.Feb01, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb01 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 4, daytable.Feb03, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb03 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 4, daytable.Feb04, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb04 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 4, daytable.Feb05, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb05 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 4, daytable.Feb06, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb06 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 4, daytable.Feb07, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb07 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 4, daytable.Feb08, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb08 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 4, daytable.Feb08, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb08 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 4, daytable.Feb08, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb08 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 5, daytable.Feb10, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb10 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 5, daytable.Feb11, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb11 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 5, daytable.Feb12, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb12 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 5, daytable.Feb13, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb13 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 5, daytable.Feb14, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb14 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 5, daytable.Feb15, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb15 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 5, daytable.Feb15, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb15 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 5, daytable.Feb15, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb15 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 6, daytable.Feb17, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb17 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 6, daytable.Feb18, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb18 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 6, daytable.Feb19, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb19 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 6, daytable.Feb20, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb20 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 6, daytable.Feb21, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb21 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 10, mr.type, 6, daytable.Feb22, 0, NULL FROM Saturday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb22 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 11, mr.type, 6, daytable.Feb22, 0, NULL FROM Saturday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb22 <> 0;
INSERT INTO attendance SELECT mr.uid, 6, 12, mr.type, 6, daytable.Feb22, 0, NULL FROM Saturday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb22 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 10, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 11, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 12, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 14, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 15, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 1, 16, mr.type, 7, daytable.Feb24, 0, NULL FROM Monday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb24 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 10, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 11, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 12, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 14, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 15, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 2, 16, mr.type, 7, daytable.Feb25, 0, NULL FROM Tuesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb25 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 10, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 11, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 12, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 14, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 15, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 3, 16, mr.type, 7, daytable.Feb26, 0, NULL FROM Wednesday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb26 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 10, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 11, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 12, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 14, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 15, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 4, 16, mr.type, 7, daytable.Feb27, 0, NULL FROM Thursday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb27 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 10, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday10am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 11, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday11am daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 12, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday12pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 14, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday2pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 15, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday3pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;
INSERT INTO attendance SELECT mr.uid, 5, 16, mr.type, 7, daytable.Feb28, 0, NULL FROM Friday4pm daytable INNER JOIN master_roster mr ON daytable.Name LIKE CONCAT(mr.first_name, ' ', mr.last_name, '%') WHERE daytable.Feb28 <> 0;


-- Transfer over the coverage table
INSERT INTO coverage 
SELECT mr1.uid, 
CASE oc.Day
	WHEN 'Monday' THEN 1
	WHEN 'Tuesday' THEN 2
	WHEN 'Wednesday' THEN 3
	WHEN 'Thursday' THEN 4
	WHEN 'Friday' THEN 5
	WHEN 'Saturday' THEN 6
END AS day,
CASE oc.Time
	WHEN '10am' THEN 10
	WHEN '11am' THEN 11
	WHEN '12pm' THEN 12
	WHEN '1pm' THEN 13
	WHEN '2pm' THEN 14
	WHEN '3pm' THEN 15
	WHEN '4pm' THEN 16
END as time,
CASE oc.TourType
	WHEN 'Reg' THEN 0
	WHEN 'Ath' THEN 1
	WHEN 'IV' THEN 2
	WHEN '' THEN 0
END as type,
CASE 
	WHEN oc.Date > '2014-01-05' AND oc.Date < '2014-01-12' THEN 0
	WHEN oc.Date > '2014-01-12' AND oc.Date < '2014-01-19' THEN 1
	WHEN oc.Date > '2014-01-19' AND oc.Date < '2014-01-26' THEN 2
	WHEN oc.Date > '2014-01-26' AND oc.Date < '2014-02-02' THEN 3
	WHEN oc.Date > '2014-02-02' AND oc.Date < '2014-02-09' THEN 4
	WHEN oc.Date > '2014-02-09' AND oc.Date < '2014-02-16' THEN 5
	WHEN oc.Date > '2014-02-16' AND oc.Date < '2014-02-23' THEN 6
	WHEN oc.Date > '2014-02-23' AND oc.Date < '2014-03-02' THEN 7
	WHEN oc.Date > '2014-03-02' AND oc.Date < '2014-03-09' THEN 8
	WHEN oc.Date > '2014-03-09' AND oc.Date < '2014-03-16' THEN 9
	WHEN oc.Date > '2014-03-16' AND oc.Date < '2014-03-23' THEN 10
	WHEN oc.Date > '2014-03-23' AND oc.Date < '2014-03-30' THEN 11
	WHEN oc.Date > '2014-03-30' AND oc.Date < '2014-04-06' THEN 12
END AS week, 
oc.Date, 
oc.Covered,
mr2.uid,
NULL
FROM coverages oc
INNER JOIN master_roster mr1 ON oc.Name LIKE CONCAT(mr1.first_name, ' ', mr1.last_name, '%')
LEFT JOIN master_roster mr2
ON CONCAT(mr2.first_name, ' ', mr2.last_name) = oc.Coverer;
 -- Fill the requirements list
INSERT INTO requirements SELECT DISTINCT mr.uid, 'Shadowed', gl.Shadowed FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE Shadowed <> 0;
INSERT INTO requirements SELECT DISTINCT mr.uid, 'Shadowed', gl.Shadowed FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE Shadowed <> 0;
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-02-08', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.WelcomeDay = 'February 8';
INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-02-08', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.WelcomeDay = 'February 8';
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-02-09', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.WelcomeDay = 'February 9';
INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-02-09', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.WelcomeDay = 'February 9';
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-04-05', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.WelcomeDay = 'April 5';
INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-04-05', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.WelcomeDay = 'April 5';
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-04-06', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.WelcomeDay = 'April 6';
INSERT INTO requirements SELECT DISTINCT mr.uid, 'WD-04-06', gl.WelcomeDayAttendance FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.WelcomeDay = 'April 6';
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'TRAIN-02-02', 1 FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.TrainingAttendance = 1;
INSERT INTO requirements SELECT DISTINCT mr.uid, 'TRAIN-02-02', 1 FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.TrainingAttendance = 1;
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'MONTHLY-02-25', 1 FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.Feb25Attendance = 1;
INSERT INTO requirements SELECT DISTINCT mr.uid, 'MONTHLY-02-25', 1 FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.Feb25Attendance = 1;
 INSERT INTO requirements SELECT DISTINCT mr.uid, 'email level', gl.EmailLevel FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name) = gl.Name WHERE gl.EmailLevel <> 0;
INSERT INTO requirements SELECT DISTINCT mr.uid, 'email level', gl.EmailLevel FROM guidelist gl INNER JOIN master_roster mr ON CONCAT(mr.first_name, ' ', mr.last_name, ' (M)') = gl.Name WHERE gl.EmailLevel <> 0;
SET foreign_key_checks = 1;
