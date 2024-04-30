<?php 
   session_start();

   include("php/config.php");
   if(!isset($_SESSION['valid'])){
    header("Location: login.php");
   }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Profil Adatok</title>
    <link rel="icon" type="image/x-icon" href="kepek/logo_hd_small.ico">
</head>
<body>
    <div class="container">
        <div class="box form-box">
            <?php 
               if(isset($_POST['submit'])){
                $username = $_POST['username'];
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

                $id = $_SESSION['id'];

                $edit_query = mysqli_query($con,"UPDATE user SET Nev='$username', Jelszo='$password' WHERE Id=$id ") or die("error occurred");

                if($edit_query){
                    echo "<div class='message'>
                    <p>Profil frissítve!</p>
                </div> <br>";
              echo "<a href='index.php'><button class='btn'>Go Home</button>";
       
                }
               }else{

                $id = $_SESSION['id'];
                $query = mysqli_query($con,"SELECT*FROM user WHERE Id=$id ");

                while($result = mysqli_fetch_assoc($query)){
                    $res_Uname = $result['Nev'];
                }

            ?>
            <header>Adatok Frissítése <a href="index.php"><button style="float: right" class="btn" type="button">Vissza</button></a></header>
            <form action="" method="post">
                <div class="field input">
                    <label for="username">Felhasználó név</label>
                    <input type="text" name="username" id="username" value="<?php echo $res_Uname; ?>" autocomplete="off" required>
                </div>
                
                <div class="field input">
                    <label for="password">Új jelszó</label>
                    <input type="password" placeholder="Új jelszó" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field">
                    
                    <input type="submit" class="btn-submit" name="submit" value="Adatok frissítése" required>
                </div>
                
            </form>
        </div>
        <?php } ?>
      </div>
</body>
</html>