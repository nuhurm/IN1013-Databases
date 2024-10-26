
CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45),
    species CHAR(1) CHECK (species IN ('M', 'F')),
    gender VARCHAR(45),
    birth DATE,
    death DATE
);

CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname),
    PRIMARY KEY (petname, eventdate)
);
