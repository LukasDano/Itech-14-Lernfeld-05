-- Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5);