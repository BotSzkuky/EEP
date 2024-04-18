<?php 
   session_start();

   include("php/config.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Home</title>
    <script type = "text/javascript">
          function displayNextImage() {
            x = (x === images.length - 1) ? 0 : x + 1;
            fadeOutImage();
        }

        function displayPreviousImage() {
            x = (x <= 0) ? images.length - 1 : x - 1;
            fadeOutImage();
        }

        function fadeOutImage() {
            var imgElement = document.getElementById("img");
            imgElement.style.opacity = 0;
            setTimeout(function() {
                imgElement.src = images[x];
                fadeInImage();
            }, 500); // Wait for the fade out transition to complete
        }

        function fadeInImage() {
            var imgElement = document.getElementById("img");
            imgElement.style.opacity = 1;
        }

        function startTimer() {
            setInterval(displayNextImage, 5000);
        }

          var images = [], x = -1;
          images[0] = "kepek/kezdo_kep_small.jpg";
          images[1] = "kepek/kezdo_kez_small.png";
          images[2] = "kepek/kezdo_logo.jpg";
      </script>
</head>
<body onload = "startTimer()">
    <div class="nav">
        <div class="logo">
            <p class="logoNev"><img src="kepek/logo_hd_small.png" alt="logo" width="40px" style="margin-top: 5px; margin-right:5px"> Elite Employment Pursuit </p>
        </div>

        <div class="right-links">

        <?php 
            if(isset($_SESSION['valid'])) {
                $id = $_SESSION['id'];
                $query = mysqli_query($con,"SELECT * FROM user WHERE Id=$id");

                while($result = mysqli_fetch_assoc($query)){
                    $res_Uname = $result['Nev'];
                    $res_Email = $result['Email'];
                    $res_id = $result['Id'];
                }
                
                echo "<a href='hirdetes/index.php?Id=$res_id'><button class='btn'>Hirdetések</button></a>";
                echo "<a href='edit.php?Id=$res_id'><button class='btn'>Adatok Frissítése</button></a>";
                echo "<a href='php/logout.php'><button class='btn'>Kijelentkezés</button></a>";
            } else {
                echo "<a href='login.php'><button class='btn'>Bejelentkezés</button></a>";
            }
            ?>

        </div>
    </div>
    <main>

    <div class="main-box top">
          <div class="top">
            <div class="box">
                <?php 
                // Check if the user is logged in and display appropriate greeting
                if(isset($_SESSION['valid'])) {
                    echo "<p>Hello <b>$res_Uname</b>, Üdvözöljük</p>";
                } else {
                    echo "<p>Üdvözöljük a weboldalon!</p>";
                }
                ?>
            </div>
            <div class="box">
                <?php 
                // Check if the user is logged in and display appropriate email
                if(isset($_SESSION['valid'])) {
                    echo "<p>Az ön email címe: <b>$res_Email</b>.</p>";
                    
                }else {
                        echo "<p>Kérem jelentkezzen be az összes funckió eléréséhez.</p>";
                }
                ?>
            </div>
          </div>
          <img id="img" class="animate-opacity" src="kepek/kezdo_logo.jpg">
          <div class="bottom">
            <h1>Elite Employment Pursuit bemutató</h1>
            <p class="main-text">Az Elite Employment Pursuit (röviden EEP) egy új munka kereső weboldalon, ami minden korosztály számára
                elérhető és könnyen kezelhető. Az oldalunkon egyenlőre Festők, Villanyszerelők, Vízszerelők és Gázszerelők találhatnak munkára.
                A regisztráció után máris böngészhet a munkalehetőségek között és ön is adhat fel munkát, ha segítségre szorul.
            </p>
            <hr style="height: 3px; background-color: rgba(76,68,182)">
            <h1>Készítők</h1>
            <strong><b style="font-size: 20px">Szita Benedek</b></strong>
            <p class="main-text">Szita Benedek vagyok 19 éves, jelenleg a BGSZC Pestszentlőrinci Technikum diákja vagyok. 
            Érdekel az informatika az IT és ezen érdeklődési köreim miatt kezdtem el az itteni tecknikusi tanulmányaimat.</p>
            <strong><b style="font-size: 20px">Szkurkay Márk</b></strong>
            <p class="main-text">Szkurkay Márk vagyok 19 éves, jelenleg a BGSZC Pestszentlőrinci Technikumban tanulok.
            Érdekel az informatika amivel napi akár több órát is foglalkozom otthon, emelett szeretek sportolni, igazolt focista vagyok.
            Az informatika iránti szeretetem miatt választottam azt, hogy tovább folytatom a tanulmányaimat ezen a téren.</p>
            <hr style="height: 3px; background-color: rgba(76,68,182)">
            <p class="foot" style="margin-top: 20px">Elérhetőségeink:</p>
            <p class="foot">sziben668@hengersor.hu</p>
            <p class="foot" style="margin-bottom: 20px">szkmar581@hengersor.hu</p>
          </div>
       </div>

    </main>
</body>
</html>