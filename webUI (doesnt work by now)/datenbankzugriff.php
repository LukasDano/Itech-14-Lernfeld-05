<?php
// Verbindungsdaten zur Datenbank
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "deine_datenbank";

// Verbindung zur Datenbank herstellen
$conn = new mysqli($servername, $username, $password, $dbname);

// Überprüfen der Verbindung
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}

// SQL-Befehl ausführen
$sql = "SELECT * FROM deine_tabelle";
$result = $conn->query($sql);

// Daten verarbeiten
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"] . " - Name: " . $row["name"] . " - Email: " . $row["email"] . "<br>";
    }
} else {
    echo "Keine Ergebnisse gefunden";
}

// Verbindung schließen
$conn->close();
?>
