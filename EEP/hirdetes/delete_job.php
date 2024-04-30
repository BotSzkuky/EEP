<?php
session_start();
include("../php/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete_job'])) {
    $userId = $_SESSION['id'];
    $munkaId = $_POST['munka_id'];

    $check_query = "SELECT * FROM munka WHERE MunkaId = $munkaId";
    $check_result = mysqli_query($con, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        $delete_query = "DELETE FROM munka WHERE MunkaId = $munkaId";
        if (mysqli_query($con, $delete_query)) {
            echo "<script type='text/javascript'>alert('Sikeres hirdetés törlés!'); window.location='javascript:history.go(-1)';</script>";
            exit();
        } else {
            echo "Error deleting record: " . mysqli_error($con);
        }
    } else {
        echo "<script type='text/javascript'>alert('Nincs jogosultsága-e hirdetés törléséhez!'); window.location='javascript:history.go(-1)';</script>";
    }
} else {
    echo "Invalid request.";
}

mysqli_close($con);
?>