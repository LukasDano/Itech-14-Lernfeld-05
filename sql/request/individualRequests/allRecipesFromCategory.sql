-- Auswahl aller Rezepte einer bestimmten Ernährungskategorie
SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);

-- Andere Kategorien:
-- SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 02);
-- SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 03);