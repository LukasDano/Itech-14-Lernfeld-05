DROP TABLE IF EXISTS REZEPTE;

CREATE TABLE REZEPTE (
    REZEPTENR       INTEGER NOT NULL,
    REZEPTENAME      VARCHAR(99),
    Menge    		INTEGER,
    PRIMARY KEY (REZEPTENR)
);

DROP TABLE IF EXISTS REZEPTEZUTAT;

CREATE TABLE REZEPTEZUTAT (
    REZEPTENR       INTEGER NOT NULL,
    ZUTATENNR      INTEGER,
    MENGE     	   INTEGER,
    PRIMARY KEY (REZEPTENR, ZUTATENNR)
);

DROP TABLE IF EXISTS ERNAEHRUNGSKATEGORIE;

CREATE TABLE ERNAEHRUNGSKATEGORIE (
    KATEGORIENR       INTEGER NOT NULL,
    KATEGORIENAME     VARCHAR(99),
    REZEPTENR         INTEGER NOT NULL,
    PRIMARY KEY (KATEGORIENR, REZEPTENR)
);

DROP TABLE IF EXISTS BESCHRAENKUNGEN;

CREATE TABLE BESCHRAENKUNGEN(
   BESCHRAENKUNGENNR       INTEGER NOT NULL,
   BESCHRAENKUNGENNAME     VARCHAR(99),
   ZUTATENNR               INTEGER NOT NULL,
   PRIMARY KEY (BESCHRAENKUNGENNR, ZUTATENNR)
); 