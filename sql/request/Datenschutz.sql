-- RECHT AUF AUSKUNFT:

    -- Abfrage aller Daten zum Kunden und seinen getätigten Bestellungen
    SELECT * 
    From kunde inner join bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR 
    where kunde.KUNDENNR = 2007;

    -- Abfrage aller Daten zu den Bestellungen und deren Inhalt eines bestimmten Kunden
    SELECT *
    FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
    WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde inner JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = 2007);


-- RECHT AUF BERRICHTUGUNG:

    -- Aenderungen bestimmter Daten der Kundentabelle
    UPDATE kunde SET nachname = 'Mustermann' WHERE kundennr = 2002;
    UPDATE kunde SET vorname = 'Max' WHERE kundennr = 2002;
    UPDATE kunde SET GEBURTSDATUM ='2004-05-31' WHERE kundennr = 2002;
    UPDATE kunde SET STRASSE = 'Hauptstraße' WHERE kundennr = 2002;
    UPDATE kunde SET HAUSNR = '1' WHERE kundennr = 2002;
    UPDATE kunde SET plz = '21101' WHERE kundennr = 2002;
    UPDATE kunde SET ort = 'Hamburg' WHERE kundennr = 2002;
    UPDATE kunde SET TELEFON = '049123456789' WHERE kundennr = 2002;
    UPDATE kunde SET EMAIL = 'Max@Mustermann.de' WHERE kundennr = 2002;

    -- Aenderung aller Daten der Kudentabelle
    UPDATE kunde SET nachname = 'Mustermann', vorname = 'Max', GEBURTSDATUM ='2004-05-31', 
    STRASSE = 'Hauptstraße', HAUSNR = '1', plz = '21101', ort = 'Hamburg', 
    TELEFON = '049123456789', EMAIL = 'Max@Mustermann.de'  
    WHERE kundennr = 2002;


-- RECHT AUF LOESCHENUNG:

	UPDATE kunde SET nachname = '', vorname = '', GEBURTSDATUM ='', 
    STRASSE = '', HAUSNR = '', plz = '', ort = '', 
    TELEFON = '', EMAIL = ''  
    WHERE kundennr = 2007;
    
        -- undo
        UPDATE kunde SET nachname = 'Gessert', vorname = 'Armin', GEBURTSDATUM ='1978-01-29', 
        STRASSE = 'Küstersweg', HAUSNR = '3', plz = '21079', ort = 'Hamburg', 
        TELEFON = '040/67890', EMAIL = 'armin@gessert.de'  
        WHERE kundennr = 2007;