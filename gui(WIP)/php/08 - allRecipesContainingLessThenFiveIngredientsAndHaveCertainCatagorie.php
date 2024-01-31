<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style.css">
    <script src="script.js"></script>

    <title>Kraut und Rüben</title>
</head>

<body>
  <header>
        <a href="../index.html"><img src="../pictures/logo.png" alt="Logo"></a>
  </header>
  <p>
</body>

<?php

//---------------------------------------------------------------------------------------------------------------------------------

// SELECT * FROM rezepte WHERE rezeptenr IN (SELECT REZEPTENR FROM rezeptezutat GROUP BY REZEPTENR HAVING COUNT(*) < 5) AND REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);

// SELECT * FROM REZEPTE WHERE REZEPTENR in (SELECT REZEPTENR FROM ernaehrungskategorie WHERE KATEGORIENR = 01);

$requestID =  $_POST["selection"];

$sql = '

SELECT REZEPTENR, REZEPTENAME, MENGE
FROM rezepte 
WHERE rezeptenr IN 
(SELECT REZEPTENR FROM rezeptezutat 
GROUP BY REZEPTENR HAVING COUNT(*) < 5) AND 
REZEPTENR in 
(SELECT REZEPTENR FROM ernaehrungskategorie 
WHERE KATEGORIENR = "' . $requestID . '")

';

// SELECT KATEGORIENAME FROM ernaehrungskategorie WHERE KATEGORIENR = 01 LIMIT 1;

$sqlName = '

SELECT KATEGORIENAME
FROM ernaehrungskategorie 
WHERE KATEGORIENR = "' . $requestID . '" LIMIT 1

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



$resultName = $conn->query($sqlName);

if ($resultName->num_rows > 0) {

  $row = $resultName->fetch_assoc();
  $bezeichnung = $row['KATEGORIENAME'];

} else {

  echo "No results found.";

}


$result = $conn->query($sql);

if ($result->num_rows > 0){

  echo $style;

  echo "<script> getDateAndTime(); </script>";

  echo "<div id='name'> Alle Rezepte mit weniger als 5 Zutaten die " . $bezeichnung . " sind. </div>";
  echo "<table border='1'>";
  echo "<th>Rezept ID</th> <th>Name</th> <th>Menge</th>";

  while($row = $result->fetch_assoc()){

    echo "<tr>";
    foreach ($row as $field => $value) { echo "<td>" . $value . "</td>"; }
    echo "</tr>";

  }

}else { echo "<div id='name'>Nicht gefunden! ERROR!</div>"; echo $style;}

$conn->close();

?>