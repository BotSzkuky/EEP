<?php 
   session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Bejelentkezés</title>
</head>
<body>
      <div class="container">
        <div class="box form-box">
        <?php

        include("php/config.php");

        if(isset($_POST['submit'])){
            $email = mysqli_real_escape_string($con, $_POST['email']);
            $password = $_POST['password'];

            $result = mysqli_query($con, "SELECT * FROM user WHERE Email='$email'") or die("Select Error");
            $row = mysqli_fetch_assoc($result);

        if($row && password_verify($password, $row['Jelszo'])){
            $_SESSION['valid'] = $row['Email'];
            $_SESSION['username'] = $row['Username'];
            $_SESSION['id'] = $row['Id'];
            header("Location: index.php");
            exit();
        }else{
            echo "<div class='message'>
                <p>Wrong Username or Password</p>
                </div><br>";
        }
    }
?>
            <header>Bejeletkezés <a href="index.php"><button style="float: right" class="btn" type="button">Vissza</button></a></header>
            <form action="" method="post">
                <div class="field input">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" autocomplete="off" placeholder="példa@példavagyok.hu" required>
                </div>

                <div class="field input">
                    <label for="password">Jelszó</label>
                    <input type="password" name="password" id="password" autocomplete="off" placeholder="Jelszó" required>
                </div>

                <div class="field">
                    
                    <input type="submit" class="btn-submit" name="submit" value="Bejelentkezés" required>
                </div>
                <div class="links">
                    Nincs még fiókja? <a href="register.php">Regisztráljon most!</a>
                </div>
            </form>
        </div>
        
      </div>
</body>
</html>