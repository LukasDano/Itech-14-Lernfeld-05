<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>

    <title>Kraut und Rüben</title>
</head>

<main>
  <a href="../index.html">
  <button color="red">Home</button>
  </a>
</main>

<?php

//---------------------------------------------------------------------------------------------------------------------------------

// SELECT BESTELLNR, AVG(KALORIEN) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN) AS "Durchschnittliche Proteine" 
// FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
// WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = 2007) GROUP BY bestellnr;

// SELECT BESTELLNR, AVG(KALORIEN * bestellungzutat.MENGE) AS "Durchschnittliche Kalorien", AVG(KOHLENHYDRATE * bestellungzutat.MENGE) AS "Durchschnittliche Kohlenhydrate", AVG(PROTEIN * bestellungzutat.MENGE) AS "Durchschnittliche Proteine" 
// FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
// WHERE bestellungzutat.BESTELLNR IN (SELECT bestellung.BESTELLNR FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR WHERE kunde.KUNDENNR = 2007) GROUP BY bestellnr;

$requestID = $_POST["selection"];

$sql = '

SELECT BESTELLNR, AVG(KALORIEN), AVG(KOHLENHYDRATE), AVG(PROTEIN)
FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
WHERE bestellungzutat.BESTELLNR IN
(SELECT bestellung.BESTELLNR 
FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR 
WHERE kunde.KUNDENNR = "' . $requestID . '") GROUP BY bestellnr

';

$sqlMenge = '

SELECT BESTELLNR, AVG(KALORIEN * bestellungzutat.MENGE), AVG(KOHLENHYDRATE * bestellungzutat.MENGE), AVG(PROTEIN * bestellungzutat.MENGE)
FROM bestellungzutat INNER JOIN zutat ON bestellungzutat.ZUTATENNR = zutat.ZUTATENNR
WHERE bestellungzutat.BESTELLNR IN
(SELECT bestellung.BESTELLNR 
FROM kunde right JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR 
WHERE kunde.KUNDENNR = "' . $requestID . '") GROUP BY bestellnr;

';

//---------------------------------------------------------------------------------------------------------------------------------

$style = "

<style>

@font-face { font-family: Roboto; src: url('../img/roboto.ttf'); }

body{

  margin: 0;
  padding: 50px;

  font-size: 15;
  font-family: 'Roboto', sans-serif;
  color: rgba(0,0,0,0.75);

}

table{

  border-collapse: collapse;
  border: solid 1px rgba(0,0,0,0.35);
  width: 100%;
  background-color: #FFFFFF;

}

 th, td{

   padding: 10px;


 }

 th{background-color: #DCEDC8;}

 #name{

   font-size: 20px;
   margin-bottom: 25px;

 }

</style>

";

//---------------------------------------------------------------------------------------------------------------------------------

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "krautundrueben";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error);}


$result = $conn->query($sql);
$resultMennge = $conn->query($sqlMenge);


if ($result->num_rows > 0){

  echo $style;

  echo "<p> <div>";
  echo "<div id='name'> KundenID: " . $requestID . " - Durchschnittliche Nährwerte aller Bestellungen:</div>";
  echo "<div> (Die zweite Tabelle berücksichtigt die Menge der bestellten Zutaten) </div>";
  echo "<table border='1'>";
  echo "<th>Bestll ID</th> <th>Durchschnittliche Kalorien</th> <th>Durchschnittliche Kohlenhydrate</th> <th>Durchschnittliche Proteine</th>";
  echo "</p> </div>";

  while($row = $result->fetch_assoc()){

    echo "<tr>";
    foreach ($row as $field => $value) { echo "<td>" . $value . "</td>"; }
    echo "</tr>";

  }

  echo "<p>";

  echo "<p> <div>";
  echo "<table border='1'>";
  echo "<th>Bestll ID</th> <th>Durchschnittliche Kalorien</th> <th>Durchschnittliche Kohlenhydrate</th> <th>Durchschnittliche Proteine</th>";
  echo "</p> </div>";

  while($row = $resultMennge->fetch_assoc()){

    echo "<tr>";
    foreach ($row as $field => $value) { echo "<td>" . $value . "</td>"; }
    echo "</tr>";

  }

}else { echo "<div id='name'>Nicht gefunden! ERROR!</div>"; echo $style;}

echo "</p>";


$conn->close();

?>