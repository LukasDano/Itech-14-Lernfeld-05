DROP TABLE IF EXISTS REZEPTE;

CREATE TABLE REZEPTE (
    REZEPTENR       INTEGER NOT NULL,
    REZEPTNAME      VARCHAR(99),
    ZUTATEN         VARCHAR(99),
    ERNAERUNGSKATEGORIEN VARCHAR(99),
    PORTIONEN    	INTEGER,
    PRIMARY KEY (REZEPTENR)
);

DROP TABLE IF EXISTS REZEPTZUTAT;

CREATE TABLE REZEPTZUTAT (
    REZEPTNR       INTEGER NOT NULL,
    ZUTATENNR       INTEGER,
    MENGE     		INTEGER,
    PRIMARY KEY (REZEPTNR,ZUTATENNR)
);