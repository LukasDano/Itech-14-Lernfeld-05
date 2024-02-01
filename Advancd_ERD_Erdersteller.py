import mysql.connector
from prettytable import PrettyTable

def verbinde_mit_datenbank(host, benutzer, passwort, datenbank):
    try:
        connection = mysql.connector.connect(
            host=host,
            user=benutzer,
            password=passwort,
            database=datenbank
        )
        cursor = connection.cursor()
        print("Verbindung zur Datenbank hergestellt")
        return connection, cursor
    except mysql.connector.Error as error:
        print("Fehler beim Verbinden mit der Datenbank:", error)
        return None, None

def erstelle_erd(db_cursor, ausgabedateipfad):
    try:
      
        # SQL-Abfrage, um Informationen über Tabellen und deren Spalten abzurufen
        sql_abfrage = """
            SHOW TABLES;
        """

        db_cursor.execute(sql_abfrage)
        tabellen = db_cursor.fetchall()

        with open(ausgabedateipfad, 'w') as erd_datei:
            erd_datei.write(f"ERD für die Datenbank: {datenbank} \n\n")
            for tabelle in tabellen:
                tabelle_name = tabelle[0]
                erd_datei.write(f"Tabelle: {tabelle_name}\n")

                # SQL-Abfrage, um Spalteninformationen abzurufen
                sql_abfrage_spalten = f"DESCRIBE {tabelle_name};"
                db_cursor.execute(sql_abfrage_spalten)
                spalten = db_cursor.fetchall()

                x = PrettyTable()
                x.field_names = ["Spaltenname", "Datentyp", "Null", "Key", "Default", "Extra"]
                
                for spalte in spalten:
                    x.add_row(spalte)

                erd_datei.write(str(x))
                erd_datei.write("\n\n")

        print(f"ERD wurde erfolgreich erstellt und in '{ausgabedateipfad}' gespeichert.")

    except mysql.connector.Error as error:
        print("Fehler beim Erstellen des ERD:", error)

    finally:
        if db_cursor:
            db_cursor.close()

        if connection:
            connection.close()
            print("Verbindung zur Datenbank geschlossen")

# Beispielaufruf
host = '127.0.0.1'
benutzer = 'root'
passwort = ''
datenbank = 'krautundrueben'

# Ändern Sie den Pfad hier entsprechend
ausgabedateipfad = r"C:\Users\klaus\Desktop\ITECH\Lernfeld 5 Software zur Verwaltung von Daten anpassen\php\test.txt"

connection, cursor = verbinde_mit_datenbank(host, benutzer, passwort, datenbank)

if connection and cursor:
    erstelle_erd(cursor, ausgabedateipfad)
