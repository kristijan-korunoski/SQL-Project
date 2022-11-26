CREATE TABLE Car (carMake TEXT,
     carModel TEXT,
     carYear INTEGER,
     dailyCost INTEGER,
     kmCost REAL,
     PRIMARY KEY (carMake, carModel, carYear));

CREATE TABLE Vehicle (carMake TEXT,
     carModel TEXT,
     carYear INTEGER,
     VIN TEXT PRIMARY KEY,
     odometer INTEGER
     CHECK (VIN GLOB ('[^a-bIOQ][^a-bIOQ][0-9X][^a-bIOQ][^a-bIOQ]'))); 

CREATE TABLE Customer (
  id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT);

CREATE TABLE rental (
    customerID INTEGER REFERENCES Customer (id) ON UPDATE CASCADE,
    VIN        TEXT    REFERENCES Vehicle (VIN),
    odo_out    INTEGER,
    odo_back   INTEGER,
    date_out   TEXT,
    date_back  TEXT);