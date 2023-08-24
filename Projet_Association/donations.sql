-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 juil. 2023 à 12:57
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `donation_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `donations`
--

CREATE TABLE `donations` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `somme_promise` decimal(10,2) NOT NULL,
  `conditions` tinyint(1) NOT NULL,
  `date_promesse` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `donations`
--

INSERT INTO `donations` (`id`, `nom`, `prenom`, `adresse`, `email`, `somme_promise`, `conditions`, `date_promesse`) VALUES
(1, 'JEAN', 'BABAR', '7 RUE DES MOINNEAUX', 'JBABAR@gmail.com', 2.00, 1, '2023-07-26 12:57:19'),
(2, 'JEAN', 'BABAR', '7 RUE DES MOINNEAUX', 'JBABAR@gmail.com', 2.00, 1, '2023-07-26 12:57:57'),
(3, 'JEAN', 'BABAR', '7 RUE DES MOINNEAUX', 'JBABAR@gmail.com', 2.00, 1, '2023-07-26 12:59:46'),
(4, 'guevel', 'pierre', '6 rue plot', 'pierreguevel@gmail.com', 50.00, 1, '2023-07-26 13:18:49'),
(5, 'hugo', 'percy', 'huj rue top', 'hugop@gmail.com', 54.00, 1, '2023-07-27 12:27:54'),
(6, 'robert', 'robert', 'robert', 'robert@gmail.com', 500.00, 1, '2023-07-27 12:28:22');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
