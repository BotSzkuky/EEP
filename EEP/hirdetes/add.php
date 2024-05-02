<?php 
   session_start();
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Munka adás</title>
    <link rel="icon" type="image/x-icon" href="../kepek/logo_hd_small.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<?php
include("../php/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $location = ($_POST["location"]);
    $email = ($_POST["email"]);
    $tel = ($_POST["tel"]);
    $details = ($_POST["details"]);
    $task = ($_POST["taskName"]);

    $profession = mysqli_real_escape_string($con, $_POST["profession"]);

    $id = $_SESSION['id'];

    $sql = "INSERT INTO munka (UserId, Szakma, Leiras, Lakhely, Telefonszam, Feladat) VALUES ('$id', '$profession', '$details', '$location', '$tel', '$task')";
    if (mysqli_query($con, $sql)) {
        echo "<script type='text/javascript'>alert('Sikeres munka feltöltés!'); window.location='index.php';</script>";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }

}
?>
<form action="" method="post">
    <div class="jobs-list-container">
        <h2>Kérjük részletezze a munkát amit feltölteni kíván!</h2>

        <a href="javascript:history.go(-1)" class="add-vissza">Vissza</a>

        <div class="job-add">
            <div class="job-add-title">
                <label>Válassza ki milyen szakmában kíván feltölteni!</label> <br>
                <input style="margin-top:10px" id="paint" type="radio" name="profession" value="1" required>
                <label for="paint">Festő</label><br>
                <input id="water" type="radio" name="profession" value="2">
                <label for="water">Vízszerelő</label><br>
                <input id="gas" type="radio" name="profession" value="3">
                <label for="gas">Gázszerelés</label><br>
                <input id="lightning" type="radio" name="profession" value="4">
                <label for="lightning">Villanyszerelés</label>
            </div>
        </div>
        <div class="job-add">
            <div class="job-add-title">
                <label>Kérem adja meg a munkának a nevét!</label> <br>
                <input style="margin-top:10px" type="text" name="taskName" id="taskName" placeholder="Szoba festés" required>
            </div>
        </div>
        <div class="job-add">
            <div class="job-add-title">
                <label>Kérem adja meg a munkahely helyszínét!</label> <br>
                <input style="margin-top:10px" type="text" name="location" id="location" placeholder="Budapest" required>
            </div>
        </div>
        <div class="job-add">
            <div class="job-add-title">
                <label>Kérem adja meg az elérhetőségeit!</label> <br>
                <p></p>
                <label for="email">Kérem adja meg az email címét ahol el lehet érni!</label><br>
                <input style="margin-top:10px" type="email" name="email" id="email" placeholder="pelda.bela@pelda.hu" required><br>
                <p></p>
                <label for="tel">Kérem adja meg a telefonszámát ahol lehet keresni!</label><br>
                <input style="margin-top:10px" type="tel" name="tel" id="tel" placeholder="(+36)123456789" required>
            </div>
        </div>
        <div class="job-add">
            <div class="job-add-title">
                <label>Kérem adja meg a leírását a munkának</label>
            </div>
                <textarea name="details" id="details" cols="45" rows="10" placeholder="Egy kis szoba átfestése." required></textarea>

        </div>
        <div class="job-add">
            <div class="job-add-title">
                <label>Kérem adja le a munka feladási szándékát!</label> <br>

                    <input style="margin-top:10px" type="submit" name="submit" id="submit" class="submitButton" value="Leadás">
            </div>
        </div>
    </div>
</form>


</body>
</html>