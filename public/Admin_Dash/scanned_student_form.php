<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scanned Student Form</title>
</head>

<body>
    <h1>Scanned Student Form</h1>
    <form action="process_form.php" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" value="<?php echo htmlspecialchars($_GET['id']); ?>"><br>
        <input type="submit" value="Submit">
    </form>
</body>

</html>