<?php
session_start();

// Connexion à la base de données
$conn = new mysqli("localhost", "root", "", "myissat");

// Vérifie la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialiser les variables avec les informations de session
$id = $_SESSION["id"];
$role = $_SESSION["role"];

// Récupérer les informations de profil en fonction du rôle
if ($role === "Enseignant") {
    // Requête SQL pour récupérer les informations de l'enseignant
    $sql = "SELECT * FROM enseignant WHERE id = '$id'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Récupérer les données de l'enseignant
        $row = $result->fetch_assoc();
        $nom = $row["nom"];
        $email = $row["email"];
        $sexe = $row["sexe"];
        $grade = $row["grade"];
        $branche = $row["branche"];
    } else {
        echo "Erreur : Enseignant non trouvé.";
    }
} elseif ($role === "Admin") {
    // Requête SQL pour récupérer les informations de l'administrateur
    $sql = "SELECT * FROM admin WHERE id = '$id'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Récupérer les données de l'administrateur
        $row = $result->fetch_assoc();
        $nom = $row["nom"];
        $email = $row["email"];
    } else {
        echo "Erreur : Administrateur non trouvé.";
    }
}

// Fermer la connexion à la base de données
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="container">
        <p><strong>Identifiant:</strong> <?php echo $id; ?></p>
        <p><strong>Nom:</strong> <?php echo $nom; ?></p>
        <p><strong>Email:</strong> <?php echo $email; ?></p>
        <?php if ($role === "Enseignant"): ?>
            <p><strong>Sexe:</strong> <?php echo $sexe; ?></p>
            <p><strong>Grade:</strong> <?php echo $grade; ?></p>
            <p><strong>Branche:</strong> <?php echo $branche; ?></p>
        <?php endif; ?>
        <p><a href="logout.php">Déconnexion</a></p>
    </div>
</body>

</html>