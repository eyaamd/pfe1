<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Notes</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/tailwind.output.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="../assets/js/init-alpine.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>

</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        <!-- Desktop sidebar -->
        <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
            <div class="py-4 text-gray-500 dark:text-gray-400">
                <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
                    Enseignant
                </a>
                <ul class="mt-6">
                    <li class="relative px-6 py-3">
                        <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                            href="./indexE.php">
                            <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path
                                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                                </path>
                            </svg>
                            <span class="ml-4">Dashboard</span>
                        </a>
                    </li>
                </ul>
                <ul>
                    <li class="relative px-6 py-3">
                        <span class="absolute inset-y-0 left-0 w-1"
                            style="background-color: #fa8231; border-radius: 0 0.5rem 0.5rem 0;"></span>

                        <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="./Notes.php">
                            <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path
                                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                                </path>
                            </svg>
                            <span class="ml-4">Notes</span>
                        </a>
                    </li>
                    

                  

                    <li class="relative px-6 py-3">
                        <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                            href="./Liste_Etudiants.php">
                            <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path
                                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                                </path>
                            </svg>
                            <span class="ml-4">Etudiants</span>
                        </a>
                    </li>

                </ul>

        </aside>
        <div class="flex flex-col flex-1 w-full">
            <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
                <div
                    class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
                </div>
            </header>
          
            <main class="h-full overflow-y-auto">
   
                <div class="container px-6 mx-auto grid">
              
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Issat Mahdia
                    </h2>
                   
                    <h2 class="mb-4">Saisie Des Notes</h2>
                    
                   
                    <form method="POST">
                        <?php
                        $servername = "localhost";
                        $username = "root";
                        $password = "";
                        $dbname = "myissat";


                        $conn = new mysqli($servername, $username, $password, $dbname);

                        // Vérifie la connexion
                        if ($conn->connect_error) {
                            die("La connexion a échoué : " . $conn->connect_error);
                        }

                        // Requête pour récupérer les niveaux
                        $query_niveaux = "SELECT `id`, `nom` FROM `niveau`";
                        $result_niveaux = $conn->query($query_niveaux);
                        ?>
                        <select id="niveau" name="niveau" class='border rounded-md px-3 py-2 ml-4'>
                            <option value="">Sélectionnez un niveau</option>

                            <?php
                            // Affichage des options des niveaux
                            while ($row_niveau = $result_niveaux->fetch_assoc()) {
                                echo "<option value='" . $row_niveau['id'] . "'>" . $row_niveau['nom'] . "</option>";
                            }
                            ?>

                        </select>
                        <select id="groupe" name="groupe" disabled class='border rounded-md px-3 py-2 ml-4'>
                            <option value="">Sélectionnez d'abord un niveau</option>
                        </select>
                        <!--       <label for="semestre">Semestre:</label> -->
                        <select id="semestre" name="semestre" disabled class='border rounded-md px-3 py-2 ml-4'>
                            <option value="">Sélectionnez d'abord un groupe</option>
                        </select>
                        <select id="matiere_id" name="matiere_id" disabled class='border rounded-md px-3 py-2 ml-4'>
                            <option value="">Sélectionnez d'abord un semestre</option>
                        </select>
                        <?php
                        $conn->close();
                        ?>

                    </form>
                    <!-- Bouton pour afficher la liste des étudiants -->
                    <div class="mt-5 ml-6 mb-5">

                        <button id="btnAfficherEtudiants"
                            class="inline-block rounded-full border-2 border-orange-500 text-orange-500 hover:border-orange-600 hover:bg-orange-400 hover:bg-opacity-10 hover:text-orange-600 focus:border-orange-700 focus:text-orange-700 active:border-orange-800 active:text-orange-800 dark:border-orange-300 dark:text-orange-300 dark:hover:hover:bg-orange-300 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal transition duration-150 ease-in-out focus:outline-none focus:ring-0">
                            Afficher la liste des étudiants
                        </button>
                    </div>
                    <!-- Zone pour afficher la liste des étudiants -->
                    <div id="listeEtudiants">

                    </div>


                    <script>

                        document.getElementById('niveau').addEventListener('change', function () {
                            var niveauId = this.value;
                            var groupeSelect = document.getElementById('groupe');

                            // Réinitialiser la liste des groupes
                            groupeSelect.innerHTML = '<option value="">Chargement...</option>';
                            groupeSelect.disabled = true;

                            // Exécuter une requête AJAX pour récupérer les groupes en fonction du niveau sélectionné
                            var xhr = new XMLHttpRequest();
                            xhr.open('GET', 'get_groupes.php?niveau=' + niveauId, true);
                            xhr.onload = function () {
                                if (xhr.status === 200) {
                                    groupeSelect.innerHTML = xhr.responseText;
                                    groupeSelect.disabled = false;
                                } else {
                                    alert('Une erreur s\'est produite. Veuillez réessayer.');
                                }
                            };
                            xhr.send();
                        });
                        /***********************************************************************************************************/
                        document.getElementById('groupe').addEventListener('change', function () {
                            var niveauId = this.value;
                            var semestreSelect = document.getElementById('semestre');

                            // Réinitialiser la liste des semestres
                            semestreSelect.innerHTML = '<option value="">Chargement...</option>';
                            semestreSelect.disabled = true;

                            // Exécuter une requête AJAX pour récupérer les semestres en fonction du niveau sélectionné
                            var xhr = new XMLHttpRequest();
                            xhr.open('GET', 'get_semestres.php?niveau=' + niveauId, true);
                            xhr.onload = function () {
                                if (xhr.status === 200) {
                                    semestreSelect.innerHTML = xhr.responseText;
                                    semestreSelect.disabled = false;
                                } else {
                                    alert('Une erreur s\'est produite. Veuillez réessayer.');
                                }
                            };
                            xhr.send();
                        });

                        /*********************************************************************************************************** */
                        document.getElementById('semestre').addEventListener('change', function () {
                            var niveauId = document.getElementById('niveau').value;
                            var semestreId = this.value;
                            var matiereSelect = document.getElementById('matiere_id');

                            // Réinitialiser la liste des matières
                            matiereSelect.innerHTML = '<option value="">Chargement...</option>';
                            matiereSelect.disabled = true;

                            // Exécuter une requête AJAX pour récupérer les matières en fonction du niveau et du semestre sélectionnés
                            var xhr = new XMLHttpRequest();
                            xhr.open('GET', 'get_matieres.php?niveau=' + niveauId + '&semestre=' + semestreId, true);
                            xhr.onload = function () {
                                if (xhr.status === 200) {
                                    matiereSelect.innerHTML = xhr.responseText;
                                    matiereSelect.disabled = false;
                                } else {
                                    alert('Une erreur s\'est produite. Veuillez réessayer.');
                                }
                            };
                            xhr.send();
                        });

                        /***********************************************************************************************************/
                        document.getElementById('btnAfficherEtudiants').addEventListener("click", function () {
                            var niveauId = document.getElementById("niveau").value;
                            var groupeNom = document.getElementById("groupe").value;

                            // Requête AJAX pour récupérer la liste des étudiants associés au niveau et au groupe sélectionnés
                            var xhr = new XMLHttpRequest();
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === XMLHttpRequest.DONE) {
                                    if (xhr.status === 200) {
                                        // Affichage de la liste des étudiants dans la zone prévue à cet effet
                                        document.getElementById("listeEtudiants").innerHTML = xhr.responseText;
                                        // Ajout de l'événement pour enregistrer les notes
                                        document.getElementById('btnEnregistrerNotes').addEventListener('click', function () {
                                            var form = document.getElementById('formNotes');
                                            var formData = new FormData(form);
                                            var matiereId = document.getElementById('matiere_id').value;
                                            // Ajouter l'ID de la matière à l'objet FormData
                                            formData.append('matiere_id', matiereId);
                                            // Requête AJAX pour enregistrer les notes
                                            var xhrSaveNotes = new XMLHttpRequest();
                                            xhrSaveNotes.onreadystatechange = function () {
                                                if (xhrSaveNotes.readyState === XMLHttpRequest.DONE) {
                                                    if (xhrSaveNotes.status === 200) {
                                                        // Afficher un message de succès ou effectuer toute autre action nécessaire
                                                        alert('Notes enregistrées avec succès !');
                                                    } else {
                                                        // Gérer les erreurs éventuelles
                                                        alert('Une erreur s\'est produite lors de l\'enregistrement des notes. Veuillez réessayer.');
                                                    }
                                                }
                                            };
                                            xhrSaveNotes.open("POST", "save_notes.php", true);
                                            xhrSaveNotes.send(formData);
                                        });
                                    }
                                }
                            };
                            xhr.open("GET", "get_etudiant.php?niveau=" + niveauId + "&groupe=" + groupeNom, true);
                            xhr.send();
                        });
                    </script>

                </div>

            </main>

        </div>
    </div>




</body>

</html>