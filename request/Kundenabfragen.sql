-- Auswahl aller Zutaten eines Rezeptes nach Rezeptname
SELECT * FROM zutat WHERE ZUTATENNR in (SELECT ZUTATENNR from rezeptezutat WHERE REZEPTENR IN (SELECT REZEPTENR FROM rezepte WHERE REZEPTNAME = 'Gemuese Suppe'));

-- Auswahl aller Rezepte einer bestimmten Ernährungskategorie
SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);

SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 02);

SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 03);

-- Auswahl aller Rezepte, die eine gewisse Zutat enthalten
SELECT * FROM REZEPTE WHERE REZEPTENR IN (SELECT REZEPTENR FROM REZEPTEZUTAT WHERE ZUTATENNR = 9001);

-- Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden

-- Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
SELECT * FROM zutat WHERE ZUTATENNR NOT IN (SELECT ZUTATENNR FROM rezeptezutat);

-- Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
SELECT * FROM zutat WHERE KALORIEN <= 50;

SELECT * FROM REZEPTE

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
SELECT * FROM rezepte WHERE rezeptenr IN ();



SELECT REZEPTENR, COUNT(*) FROM rezeptezutat GROUP BY REZEPTENR;

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen