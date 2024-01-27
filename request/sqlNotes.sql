-- Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten

SELECT rezeptenr, menge, bezeichnung, kalorien From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR WHERE REZEPTENR = 01;
SELECT SUM(Kalorien) From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR WHERE REZEPTENR = 01;
SELECT REZEPTENR From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR GROUP BY REZEPTENR HAVING SUM(KALORIEN) < 200;

SELECT * FROM rezepte WHERE REZEPTENR IN (SELECT REZEPTENR From REZEPTEZUTAT INNER JOIN ZUTAT on REZEPTEZUTAT.ZUTATENNR = zutat.ZUTATENNR GROUP BY REZEPTENR HAVING SUM(KALORIEN) < 200);



-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
SELECT * FROM rezepte WHERE rezeptenr IN (1,3,5,6);
SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5;

-- fertige Abfrage
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5);

-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5) AND REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);