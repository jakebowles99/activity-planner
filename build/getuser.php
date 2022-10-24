<!DOCTYPE html>
<html>
<head>
<style>
table {
  width: 100%;
  border-collapse: collapse;
}

table, td, th {
  border: 1px solid black;
  padding: 5px;
}

th {text-align: left;}
</style>
</head>
<body>

<?php
// $q = intval($_GET['q']);



$conn = mysqli_connect("activity-planner-dev.mysql.database.azure.com", "adminuser", "T>][n&YTd]S[FoOG", "devtest");
$res = mysqli_query($conn, 'SELECT * FROM persons');

echo "<table>
<tr>
<th>Firstname</th>
<th>Lastname</th>
</tr>";
while ($row = mysqli_fetch_array($res)) {
  echo "<tr>";
  echo "<td>" . $row['FirstName'] . "</td>";
  echo "<td>" . $row['LastName'] . "</td>";
  echo "</tr>";
}
mysqli_close($conn);


?>
</body>
</html>