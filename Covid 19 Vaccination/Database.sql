CREATE TABLE locations (
isocode             TEXT PRIMARY KEY,
location            TEXT,
lastobservationdate DATE,
sourcename          TEXT,
sourceurl           TEXT
);

CREATE TABLE vaccinationsbyagegroup (
date                            DATE  NOT NULL,
agegroup                        TEXT  NOT NULL,
isocode                         TEXT  NOT NULL,
peoplevaccinatedperhundred      FLOAT,
peoplefullyvaccinatedperhundred FLOAT,
peoplewithboosterperhundred     FLOAT,
PRIMARY KEY (date,agegroup,isocode),
FOREIGN KEY (isocode) REFERENCES locations (isocode) 
);

CREATE TABLE vaccinations (
isocode                         TEXT    NOT NULL,
date                            DATE    NOT NULL,
totalvaccinations               INTEGER,
peoplevaccinated                INTEGER,
peoplefullyvaccinated           INTEGER,
totalboosters                   INTEGER,
dailyvaccinationsraw            INTEGER,
dailyvaccinations               INTEGER,
totalvaccinationsperhundred     FLOAT,
peoplevaccinatedperhundred      FLOAT,
peoplefullyvaccinatedperhundred FLOAT,
totalboostersperhundred         FLOAT,
dailyvaccinationspermillion     FLOAT,
dailypeoplevacccinated          INTEGER,
dailypeoplevaccinatedperhundred FLOAT,
PRIMARY KEY (isocode,date),
FOREIGN KEY (isocode) REFERENCES locations (isocode) 
);

CREATE TABLE vaccines (
vaccineid   INTEGER NOT NULL,
vaccinename TEXT,
PRIMARY KEY (vaccineid)
);

CREATE TABLE locationandvaccine (
isocode   TEXT    NOT NULL,
vaccineid INTEGER NOT NULL,
PRIMARY KEY (isocode,vaccineid),
FOREIGN KEY (isocode) REFERENCES locations (isocode),
FOREIGN KEY (vaccineid) REFERENCES vaccines (vaccineid) 
);

CREATE TABLE vaccinationsbymanufacturer (
date              DATE    NOT NULL,
isocode           TEXT    NOT NULL,
vaccineid         INTEGER NOT NULL,
totalvaccinations INTEGER,
PRIMARY KEY (isocode,vaccineid,date),
FOREIGN KEY (isocode) REFERENCES locations (isocode),
FOREIGN KEY (vaccineid) REFERENCES vaccines (vaccineid) 
);

CREATE TABLE usstatevaccinations (
date                            DATE    NOT NULL,
location                        TEXT    NOT NULL,
isocode                         TEXT    NOT NULL,
totalvaccinations               INTEGER,
totaldistributed                INTEGER,
peoplevaccinated                INTEGER,
totalvaccinationsperhundred     FLOAT,
peoplefullyvaccinated           INTEGER,
peoplefullyvaccinatedperhundred FLOAT,
distributedperhundred           FLOAT,
dailyvaccinationsraw            INTEGER,
dailyvaccinations               INTEGER,
dailyvaccinationspermillion     FLOAT,
sharedosesused                  FLOAT,
totalboosters                   INTEGER,
totalboostersperhundred         FLOAT,
PRIMARY KEY (date,location,isocode),
FOREIGN KEY (isocode) REFERENCES locations (isocode) 
);







