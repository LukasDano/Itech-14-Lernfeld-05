-- Varibalen
DECLARE gesuchtesRezept VARCHAR(99);
DECLARE gewuenschteKategorieID INT;
DECLARE enthalteneZutatID INT;
DECLARE kundeID INT;

-- Zuweisung von Werten
SET gesuchtesRezept = 'Gemuese Suppe';
SET gewuenschteKategorieID = 01;
SET enthalteneZutatID = 9001;
SET kundeID = 2007;



-- Auswahl aller Zutaten eines Rezeptes nach Rezeptname
SELECT * FROM ZUTAT WHERE ZUTATENNR in (SELECT ZUTATENNR from REZEPTEZUTAT WHERE REZEPTENR IN (SELECT REZEPTENR FROM REZEPTE WHERE REZEPTENAME = gesuchtesRezept));

-- Auswahl aller Rezepte einer bestimmten Ernährungskategorie
SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = gewuenschteKategorieID);

-- Auswahl aller Rezepte, die eine gewisse Zutat enthalten
SELECT * FROM REZEPTE WHERE REZEPTENR IN (SELECT REZEPTENR FROM REZEPTEZUTAT WHERE ZUTATENNR = enthalteneZutatID);

-- Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden
SELECT BESTELLNR, AVG(KALORIEN) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN) AS "Durchschnittliche Proteine" 
FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = kundeID) GROUP BY bestellnr;

	-- mit der Menge in der Bestellung
	SELECT BESTELLNR, AVG(KALORIEN * bestellungzutat.MENGE) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE * bestellungzutat.MENGE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN * bestellungzutat.MENGE) AS "Durchschnittliche Proteine" 
	FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
	WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = kundeID) GROUP BY bestellnr;

-- Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
SELECT * FROM ZUTAT WHERE ZUTATENNR NOT IN (SELECT ZUTATENNR FROM REZEPTEZUTAT);

-- Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
SELECT * FROM rezepte WHERE REZEPTENR IN (SELECT REZEPTENR From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR GROUP BY REZEPTENR HAVING SUM(KALORIEN) < 200);

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5);

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5) AND REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = gewuenschteKategorieID);