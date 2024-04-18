<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Paint</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="jobs-list-container">
    <h2>Festés</h2>

    <input class="job-search" type="text" placeholder="Keressen itt..." />

    <div class="jobs"></div>

    <br>

<?php

    include("../php/config.php");

    $userId = $_SESSION['id'];

    $sql = "SELECT Szakma, Lakhely, Leiras, Telefonszam, Feladat
    FROM munka
    WHERE munka.Szakma = 1
    AND munka.UserId = $userId";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "Title: " . $row["Feladat"] . "<br>";
            echo "Helyszín: " . $row["Lakhely"] . "<br>";
            echo "Leírás: " . $row["Leiras"] . "<br>";
            echo "Elérhetőség: " . $row["Telefonszam"] . "<br>";
            echo "<br>";
        }
    } else {
        echo "No jobs found";
    }

    mysqli_close($con);

?>
</div>

<a href="javascript:history.go(-1)" class="back-to-previous">Vissza</a>

<script src="paint.js"></script>
</body>
</html>