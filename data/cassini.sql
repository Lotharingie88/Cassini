-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 déc. 2021 à 18:36
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cassini`
--
CREATE DATABASE IF NOT EXISTS `cassini` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cassini`;

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `cactiv` int NOT NULL AUTO_INCREMENT,
  `metier` int NOT NULL,
  PRIMARY KEY (`cactiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `capitale`
--

DROP TABLE IF EXISTS `capitale`;
CREATE TABLE IF NOT EXISTS `capitale` (
  `idcapital` int NOT NULL AUTO_INCREMENT,
  `idpays` int NOT NULL,
  `ncapital` varchar(15) NOT NULL,
  `annee` int NOT NULL,
  PRIMARY KEY (`idcapital`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dirigeant`
--

DROP TABLE IF EXISTS `dirigeant`;
CREATE TABLE IF NOT EXISTS `dirigeant` (
  `iddir` int NOT NULL AUTO_INCREMENT,
  `idpays` int NOT NULL,
  `roi` varchar(15) NOT NULL,
  `president` varchar(15) NOT NULL,
  `pre_ministre` varchar(15) NOT NULL,
  `annee` int NOT NULL,
  PRIMARY KEY (`iddir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eco_gen`
--

DROP TABLE IF EXISTS `eco_gen`;
CREATE TABLE IF NOT EXISTS `eco_gen` (
  `ideco` int NOT NULL AUTO_INCREMENT,
  `idpays` int NOT NULL,
  `population` bigint NOT NULL,
  `PIB` float NOT NULL,
  `PNB` float NOT NULL,
  `chomage` float NOT NULL,
  `annee` int NOT NULL,
  PRIMARY KEY (`ideco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joursession`
--

DROP TABLE IF EXISTS `joursession`;
CREATE TABLE IF NOT EXISTS `joursession` (
  `idsession` varchar(40) NOT NULL,
  `iduser` int NOT NULL,
  `debsess` datetime NOT NULL,
  `finsess` datetime NOT NULL,
  `datdebjours` date NOT NULL,
  `datefinjours` date NOT NULL,
  UNIQUE KEY `idsession` (`idsession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `idnation` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codinter` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idmonnaie` int NOT NULL,
  UNIQUE KEY `idpays` (`idnation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE IF NOT EXISTS `production` (
  `idprod` int NOT NULL AUTO_INCREMENT,
  `idpays` int NOT NULL,
  `codprod` int NOT NULL,
  `quantprod` float NOT NULL,
  `classe_mond` int NOT NULL,
  `part_prod` float NOT NULL,
  `annee` int NOT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idprod` int NOT NULL AUTO_INCREMENT,
  `nomprod` varchar(15) NOT NULL,
  `codprod` int NOT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `cprof` int NOT NULL AUTO_INCREMENT,
  `profil` varchar(20) NOT NULL,
  PRIMARY KEY (`cprof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `idsession` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `limtime` int NOT NULL,
  `datdeb` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `telephone` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `cprofil` int NOT NULL,
  `activite` int NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
