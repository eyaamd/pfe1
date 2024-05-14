-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 mai 2024 à 11:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myissat`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `email`, `mot_de_passe`) VALUES
(130, 'nassif', 'nassif@gmail.com', 'nassif'),
(333, 'hamaki', 'hamaki@gmail.com', 'hamaki');

-- --------------------------------------------------------

--
-- Structure de la table `branche`
--

CREATE TABLE `branche` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `branche`
--

INSERT INTO `branche` (`id`, `nom`) VALUES
(1, 'TIC'),
(2, 'EEA');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `sexe` enum('Homme','Femme','','') DEFAULT NULL,
  `grade` enum('Professeur','Maître de Conférence','Maître Assistant','Assistant','PTC','Autre') NOT NULL,
  `branche` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `nom`, `email`, `mot_de_passe`, `sexe`, `grade`, `branche`) VALUES
(289, 'souad zid', 'zid@gmail.com', 'souad', 'Femme', 'Assistant', 'TIC');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_matiere`
--

CREATE TABLE `enseignant_matiere` (
  `id_enseignant` int(11) NOT NULL,
  `matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `student_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `groupe_nom` varchar(255) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `qr_code` longblob DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `sexe` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`student_id`, `id`, `nom`, `groupe_nom`, `id_niveau`, `qr_code`, `email`, `sexe`) VALUES
(22271, 111, 'a', 'groupe 1 ', 2, 0x89504e470d0a1a0a0000000d494844520000007b0000007b01030000006e096d3c00000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b00000164494441544889ddd4318e85201006e0df50d0c10548b8061d57d20ba8ef0278253aaf61c2057c1d0571767cbeecbe6a9d6d9758982f51861f06e03f0d4b947499233f74c8c0402db5d9dc4ce077199c5f5f40490ec1f5d1f57f8185d41cd42107a8a461f3f651fa0d9c7984723e1f01fd0eaf99b73efafd27f81bb0d52fd5cf68036da30c109aad6ed4e588cec8c044b56b0ce4299724838edc90dd50d50e071920aae7daa64cdf75dc82d1e8b199882efb240478de551ecffafec72d4073e4658f3cbfeba5a0f6e089dcc42742065ddd7af046956776a30c005a083cf363bdcee93d7484a13a04de2b400a85a80d751bb8ed6480c8af9bcdea8818656073994133ef70bd2abd0768379e2b6368a30cec5a76f8a439957713dec27522f8901ab45e06dcd98f33759542333278dd856737245c950a802f36dd26c244cd88e15137cb61c40631244e3d285add2804ae94530ce7e22003ce836f29be0b0f5c6d7a0fff677c0156c347c956342d100000000049454e44ae426082, 'a', 'Homme'),
(22272, 88888, 'Eya', 'groupe 1 ', 3, 0x89504e470d0a1a0a0000000d494844520000007b0000007b01030000006e096d3c00000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b0000016a494441544889ddd4b1adc4200c00504714e9c80248ac41c74afc05ee920560253ad688c402494781f03797bb7ffacdc7bf3d1445d18b64d9c600f0496b41dc9292a63a8b8d07124428a201197df3c0e6ad809bf561d0b321a43aa168ff8175564b01e003086f7403f4efd40740fdf026f7e7dda0015ccb81f6bf7aff172c9811f18c2224e57830a15a1271bdcd5798314823b6a86e8021e2c1831ea6efad5efbc38229098c3444fba3441680d9c12adaae1395e402ae80cdecd2be628c6042f84ac243fdc2abb83148ab29d333c20daae30175fd5e68e8aa9baf7118c3927433f9300aac3878008662e4033aac3c984ade623ea35ae2ee78b0a49e235257a2683c90468792dbe3241d4cb0b4b7bbb36ac2e7953306c8abd52762405c79d06da62b84fefc8cf600e86487d2bb4843e4784035ad5496a974861a136cf674e08a08f88cc18180f4aef7f8ac96031e28cd7ac71d98d0ef42023cd3aba723e877e1accf44b3900f1e7ccefa06e18757595312f02e0000000049454e44ae426082, 'eya@gmail.com', 'Femme'),
(22273, 99999, 'nour', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d494844520000007b0000007b01030000006e096d3c00000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b0000015f494441544889ddd4b1adc4200c06602317e9c8024859838e95920522b20059898e35905820af4b81e2672eef5d4a7ceda1dce9ee2b22f3830df04d6b24f2b62acaaba34b061a30d889227acbbf65e08a87d70b2c0531ec276d690a9fc01631b83acb01704f79860a4fe91de03c822ded7902ea002f45fc358527f80e8c5428b50829995908d180ad9a37e730c80086c247b40271908714f893b5338a262f0315f1e7240f48316b198c29dfc12fa75965a04ece3b2f910ff6ae54001154023d4c173f42e0325d5d62d9535da5009aafdb90677ba7de0780d6077456158b1742cb1bc3c0cd7a5f6d0158dc4eda136ea96a19689e049cf7005ce92505f4fcaf9d157a210c5925bcac19e3df3b04d0860137c44e1964f0ba448d2f6e6e197067738d0794cbd659067c49377add20788fcf1e381e1e46457a972e01de1c0fb6257d0291774687c543083cd7dbce8c4a7767f7a1cd428025e21effc7560fbe67fd020aa548ef5945441d0000000049454e44ae426082, 'nour@gmail.com', 'Femme'),
(22274, 7777777, 'oo', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d494844520000007b0000007b01030000006e096d3c00000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b00000160494441544889ddd4b1adc3201006e0431474b000126bd0b1125ec0c10be095e8bc06120b241d05f2bd437292d2f7da2017f127853bfd9803f8a56510931f06470c78f24083cc5ebe4a054fbf79105a8296bccb1e331bf63e1e05d6ffc056acc11af900723f104bcbdfd66f80f2c8becde71bd00dd01248c55dfa067f03061b1eb81587878d3c800071d61c4b879507a2cbd3d708c3d059f1c09441d5b472a792890782da44f7a208e1daf416e8c359c1ea30a2b72b0f042275ba026e7d4426941a55a53d446f8907a6482c9895dc8e1a79203ad59478c0d2af4e6fc19486084b71595d877d0b62fe95b621c0c4030dd4e6781c9f4e1910e0d1c9ea3b750eb4bdb8571fe2904f2e5808322bf7f457a7f7a0640e6e9ba954cd8399621f9a8e170613e6cd9e11b6d38fc8039a1f69be59ca3231610e36ba0d6ec777ea0ca0b25ad14868890f9ef2a6fb6d23136816cec931a74ee201e5b1a35de69482c883df597f2a935264678df9d90000000049454e44ae426082, 'oo', 'Femme'),
(22275, 565, '5', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d494844520000007b0000007b01030000006e096d3c00000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b00000165494441544889ddd4b1adc3201006e0b35cd0e1059058838e95f0020e5e00af44c71a482c107714c8f78ef8bda4e45e1b1429e42b02fe7d7700dfb416446fda82cd59bc7820610e663e6306437b1ed8e2a178a383c1c086a3b64784ed3fb047b560767c80f94888b184cfd50740790453fae713d000684d48876bff097e000b164c7a8f1a93724ca0ef7e665b2b6c3c005b2e030eda42ef8a074bca12b214fa12b3e7019872563c2942f8fdd3214c493da292b639a3362e9413f306b8d7e698101b584abd4db5781e0020260c62de53765c004a1d13acf5bee918a4e885b3461dc4fd6ec700d4a3d40a40809e0753d517a8477adf740c5405537fb8fc97fa18a810ce88676d539a9f4cb08ab641e8a7b96fca002a37a06e288859f2e055aa4d0afad598f0ea6c8a907aa2391ed0fcd8eb7c1925e13d3e4760a90f28127de09d3a0b682b051551f16c084079f7931d13fa5c87de40f11e5463e87908b5f629058e07dfb37e0070104aed5e39d9010000000049454e44ae426082, '5', 'Femme');

--
-- Déclencheurs `etudiant`
--
DELIMITER $$
CREATE TRIGGER `add_student` AFTER INSERT ON `etudiant` FOR EACH ROW INSERT INTO note (etudiant_id, matiere, note)
    VALUES (NEW.id, 'Default Subject', 0)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `id_niveau`) VALUES
(1, 'groupe 1', 1),
(2, 'groupe 2', 1),
(3, 'groupe 3', 1),
(4, 'groupe 1', 2),
(5, 'groupe 2', 2),
(6, 'groupe 1', 3),
(7, 'groupe 2', 3);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Enseignant','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id`, `email`, `mot_de_passe`, `role`) VALUES
(111, 'nassif@gmail.com', 'nassif', 'Admin'),
(132, 'baati@gmail.com', 'baati', 'Enseignant');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `code_EE` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `Code_Ue` varchar(255) DEFAULT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`code_EE`, `libelle`, `Code_Ue`, `id_semestre`, `id_niveau`, `id_enseignant`) VALUES
(53255, 'Architecture des ordinateurs	', '53252', 1, 1, 0),
(53272, 'Système d\'exploitation', '53258', 2, 1, 0),
(53273, 'Bases de données	', '53258', 2, 1, 0),
(169920413, 'Big Data', '9999874780', 1, 3, 0),
(169920414, 'CAO', '9999874780', 1, 3, 0),
(573506413, 'Web', '573506420', 2, 2, 0),
(573506414, 'TCP/ IP et applicatifs', '573506420', 2, 2, 289),
(573506511, 'Traitement d\'image', '573506510', 1, 3, 0),
(573506512, 'analyse d\'image', '573506510', 1, 3, 0),
(573506513, 'Architecture et programmation des cartes programmables', '573506520', 1, 3, 132),
(573506514, 'Optoélectronique et réseaux fibres optiques	', '573506520', 1, 3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `nom`) VALUES
(1, '1ere année'),
(2, '2éme année'),
(3, '3éme année');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `etudiant_id` int(11) NOT NULL,
  `note` decimal(5,2) DEFAULT NULL,
  `matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE `programme` (
  `Code_Ue` varchar(255) NOT NULL,
  `Libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`Code_Ue`, `Libelle`) VALUES
('53251', 'Physique 1	'),
('53252', 'Informatique 1	'),
('53258', 'Informatique 2	'),
('573506310', 'Automatique 1'),
('573506420', 'Internet	'),
('573506510', 'Traitement et analyse d\'image'),
('573506520', 'FSPEC-TIC -5'),
('9999874780', 'Unité Optionnelle');

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `semestre`
--

INSERT INTO `semestre` (`id`, `nom`, `id_niveau`) VALUES
(1, 'Semestre 1', 0),
(2, 'Semestre 2', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `branche`
--
ALTER TABLE `branche`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `nom` (`nom`);

--
-- Index pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD KEY `fk_enseg` (`id_enseignant`),
  ADD KEY `matiere` (`matiere`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_niveau_id` (`id_niveau`),
  ADD KEY `fk_nom_groupe` (`groupe_nom`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_niv_groupe` (`id_niveau`),
  ADD KEY `nom` (`nom`) USING BTREE;

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`code_EE`),
  ADD KEY `fk_prog` (`Code_Ue`),
  ADD KEY `fk_niveau` (`id_niveau`),
  ADD KEY `fk_semestre` (`id_semestre`),
  ADD KEY `libelle` (`libelle`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD KEY `fk_mat` (`matiere`),
  ADD KEY `fk_etudi` (`etudiant_id`);

--
-- Index pour la table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`Code_Ue`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_niv` (`id_niveau`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `branche`
--
ALTER TABLE `branche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22279;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD CONSTRAINT `enseignant_matiere_ibfk_1` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`code_EE`),
  ADD CONSTRAINT `fk_enseg` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_niveau_id` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `fk_nom_groupe` FOREIGN KEY (`groupe_nom`) REFERENCES `groupe` (`nom`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `fk_niv_groupe` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `fk_niveau` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `fk_prog` FOREIGN KEY (`Code_Ue`) REFERENCES `programme` (`Code_Ue`),
  ADD CONSTRAINT `fk_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_etudi` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `fk_mat` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`code_EE`);

--
-- Contraintes pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `fk_niv` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
