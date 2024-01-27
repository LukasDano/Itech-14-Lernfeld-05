-- Auswahl aller Zutaten eines Rezeptes nach Rezeptname
SELECT * FROM ZUTAT WHERE ZUTATENNR in (SELECT ZUTATENNR from REZEPTEZUTAT WHERE REZEPTENR IN (SELECT REZEPTENR FROM REZEPTE WHERE REZEPTENAME = 'Gemuese Suppe'));

-- Auswahl aller Rezepte einer bestimmten Ernährungskategorie
SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);

SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 02);

SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 03);

-- Auswahl aller Rezepte, die eine gewisse Zutat enthalten
SELECT * FROM REZEPTE WHERE REZEPTENR IN (SELECT REZEPTENR FROM REZEPTEZUTAT WHERE ZUTATENNR = 9001);

-- Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden

-- Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
SELECT * FROM ZUTAT WHERE ZUTATENNR NOT IN (SELECT ZUTATENNR FROM REZEPTEZUTAT);

-- Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
SELECT * FROM rezepte WHERE REZEPTENR IN (SELECT REZEPTENR From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR GROUP BY REZEPTENR HAVING SUM(KALORIEN) < 200);

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5);

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5) AND REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);