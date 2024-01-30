<?php

//---------------------------------------------------------------------------------------------------------------------------------

$requestname = $_POST["selection"];

$sql = '

SELECT ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN
FROM ZUTAT
WHERE ZUTATENNR in 
(SELECT ZUTATENNR from REZEPTEZUTAT WHERE REZEPTENR IN 
(SELECT REZEPTENR FROM REZEPTE

WHERE REZEPTENAME = "' . $requestname . '"))

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

if ($result->num_rows > 0){

  echo $style;

  echo "<div id='name'> Rezept: " . $requestname . " - Zutaten</div>";
  echo "<table border='1'>";
  echo "<th>Zutaten ID</th> <th>Name</th> <th>Einheit</th> <th>Nettopreis</th> <th>Lieferant</th> <th>Kalorien</th> <th>Kohlenhydrate</th> <th>Protein</th>";

  while($row = $result->fetch_assoc()){

    echo "<tr>";
    foreach ($row as $field => $value) { echo "<td>" . $value . "</td>"; }
    echo "</tr>";

  }

}else { echo "<div id='name'>Nicht gefunden! ERROR!</div>"; echo $style;}

$conn->close();

?>