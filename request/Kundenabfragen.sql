SELECT * FROM zutat WHERE ZUTATENNR in (SELECT ZUTATENNR from rezeptezutat WHERE REZEPTENR = 01);