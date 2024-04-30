<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gázszerelők</title>
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

    <?php

        include("../php/config.php");

        $userId = $_SESSION['id'];

        $sql_count = "SELECT COUNT(*) AS numJobs FROM munka WHERE Szakma = 3";
        $result_count = mysqli_query($con, $sql_count);
        $row_count = mysqli_fetch_assoc($result_count);
        $numJobs = $row_count['numJobs'];

        $sql = "SELECT Szakma, Lakhely, Leiras, Telefonszam, Feladat, MunkaId, UserId
        FROM munka
        WHERE munka.Szakma = 3";
        $result = mysqli_query($con, $sql);

        echo "<h1>{$numJobs} gázszerelő munka elérhető</h1>";

        $numJobs = mysqli_num_rows($result);

        if ($numJobs > 0) {
            echo "<a href='javascript:history.go(-1)' class='back-to-previous' styles='margin-bottom: 10px'>Vissza</a>";
            echo "<input id='searchInput' class='job-search' type='text' placeholder='Keressen itt...' />";
            echo "<div class='jobs-container'>";
    
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<div class='job elem'>";
                echo "<img class='hird-img' src='img/icons8-gas-100.png' alt='Gaz'>";
                echo "<form method='post' action='delete_job.php'>";
                echo "<h3>" . $row["Feladat"] . "</h3>";
                echo "<input type='hidden' name='munka_id' value='" . $row["MunkaId"] . "'>";
                echo "<div class='lakhely'> " . $row["Lakhely"] . "</div><br>";
                echo "<div class='details'> " . $row["Leiras"] . "</div><br>";
                echo "Ha érdekel a munka és tudsz segíteni, kérlek, írj privát üzenetet vagy hívj ezen a számon! Köszönöm! <br>";
                echo "Telefonszám: " . $row["Telefonszam"] . "<br>";
                
                if ($row["UserId"] == $userId || $userId == 1) {
                echo "<button type='submit' class='submitButton' style='margin-top: 10px' name='delete_job'>Törlés</button>";
                echo "</form>";
                }
    
                echo "</div>";
                echo "<br>";         
            }
        } else {
            echo "Nincs elérhető munka";
            echo "<a href='javascript:history.go(-1)' class='back-to-previous' styles='margin-bottom: 10px'>Vissza</a>";
        }

mysqli_close($con);

?>

<script>
    const searchInput = document.getElementById('searchInput');
    const jobs = document.querySelectorAll('.job');

    searchInput.addEventListener('input', function(event) {
        const searchTerm = event.target.value.toLowerCase();

        jobs.forEach(job => {
            const jobTitle = job.querySelector('h3').textContent.toLowerCase();
            const jobLocation = job.querySelector('.lakhely').textContent.toLowerCase();

            if (jobTitle.includes(searchTerm) || jobLocation.includes(searchTerm)) {
                job.style.display = 'block';
            } else {
                job.style.display = 'none';
            }
        });
    });
</script>

</div>


<script src="gas.js"></script>
</body>
</html>