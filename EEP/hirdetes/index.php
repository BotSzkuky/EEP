<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kategóriák</title>
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
    <h2>Kategóriák</h2>

    <a href="../index.php" class="back-to-previous">Vissza</a>
    <div class="button" onclick="window.location.href = 'add.php';">Hírdetés feladása</div>

    <input class="job-search" type="text" placeholder="Keressen itt...">

    <div class="jobs"></div>

</div>

<script src="categories.js"></script>
</body>
</html>