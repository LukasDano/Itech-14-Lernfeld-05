<?php
// Verbindungsdaten zur Datenbank
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "krautundrueben";

// Verbindung zur Datenbank herstellen
$conn = new mysqli($servername, $username, $password, $dbname);

// Überprüfen der Verbindung
if ($conn->connect_error) {
    die("Verbindung ist fehlgeschlagen: " . $conn->connect_error);
}

// Verbindung schließen
$conn->close();
?>
