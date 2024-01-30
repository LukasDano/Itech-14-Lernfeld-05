-- Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden
SELECT BESTELLNR, AVG(KALORIEN) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN) AS "Durchschnittliche Proteine" 
FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = 2007) GROUP BY bestellnr;

	-- mit der Menge in der Bestellung
	SELECT BESTELLNR, AVG(KALORIEN * bestellungzutat.MENGE) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE * bestellungzutat.MENGE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN * bestellungzutat.MENGE) AS "Durchschnittliche Proteine" 
	FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
	WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = 2007) GROUP BY bestellnr;