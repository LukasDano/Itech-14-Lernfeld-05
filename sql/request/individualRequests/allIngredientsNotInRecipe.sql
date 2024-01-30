-- Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
SELECT * FROM ZUTAT WHERE ZUTATENNR NOT IN (SELECT ZUTATENNR FROM REZEPTEZUTAT);