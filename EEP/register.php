<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Regisztráció</title>
    <link rel="icon" type="image/x-icon" href="kepek/logo_hd_small.ico">
</head>
<body>
      <div class="container">
        <div class="box form-box">

        <?php 
         
         include("php/config.php");
         if(isset($_POST['submit'])){
            $username = $_POST['username'];
            $email = $_POST['email'];
            $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            


         $verify_query = mysqli_query($con,"SELECT Email FROM user WHERE Email='$email'");

         if(mysqli_num_rows($verify_query) !=0 ){
            echo "<div class='message'>
                      <p>This email is used, Try another One Please!</p>
                  </div> <br>";
            echo "<a href='javascript:self.history.back()'><button class='btn'>Go Back</button>";
         }
         else{

            mysqli_query($con,"INSERT INTO user(Nev,Email,Jelszo) VALUES('$username','$email','$password')") or die("Error Occured");

            echo "<div class='message'>
                      <p>Sikeres regisztráció!</p>
                  </div> <br>";
            echo "<a href='login.php'><button class='btn'>Bejelentkezés</button>";
         

         }

         }else{
         
        ?>

            <header>Regisztráció</header>
            <form action="" method="post">
                <div class="field input">
                    <label for="username">Felhasználó név</label>
                    <input type="text" name="username" id="username" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="password">Jelszó</label>
                    <input type="password" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field">
                    
                    <input type="submit" class="btn-submit" name="submit" value="Regisztráció" required>
                </div>
                <div class="links">
                    Van már fiókja? <a href="login.php">Bejelentkezés</a>
                </div>
            </form>
        </div>
        <?php } ?>
      </div>
</body>
</html>