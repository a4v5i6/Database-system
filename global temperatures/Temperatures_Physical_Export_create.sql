-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-15 20:58:29.596

-- tables
-- Table: City
CREATE TABLE City (
    id int NOT NULL,
    city longtext NOT NULL,
    country longtext NOT NULL,
    longitude Float NOT NULL,
    latitude Float NOT NULL,
    Temperature_id int NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (id)
);

-- Table: State
CREATE TABLE State (
    id int NOT NULL,
    state longtext NOT NULL,
    country longtext NOT NULL,
    Temperature_id int NOT NULL,
    CONSTRAINT State_pk PRIMARY KEY (id)
);

-- Table: Temperature
CREATE TABLE Temperature (
    id int NOT NULL,
    date date NOT NULL,
    AverageTemp float NOT NULL,
    AverageTempUncertainty float NOT NULL,
    city_id int NULL,
    state_id int NULL,
    CONSTRAINT Temperature_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: City_Temperature (table: City)
ALTER TABLE City ADD CONSTRAINT City_Temperature FOREIGN KEY City_Temperature (Temperature_id)
    REFERENCES Temperature (id);

-- Reference: State_Temperature (table: State)
ALTER TABLE State ADD CONSTRAINT State_Temperature FOREIGN KEY State_Temperature (Temperature_id)
    REFERENCES Temperature (id);

-- End of file.

