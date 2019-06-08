-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 08 juin 2019 à 21:13
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetjava`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaire`
--

DROP TABLE IF EXISTS `anneescolaire`;
CREATE TABLE IF NOT EXISTS `anneescolaire` (
  `id_AnneeScolaire` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_AnneeScolaire`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `anneescolaire`
--

INSERT INTO `anneescolaire` (`id_AnneeScolaire`) VALUES
(1),
(2000);

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `id_Bulletin` int(11) NOT NULL AUTO_INCREMENT,
  `id_Trimestre` int(11) NOT NULL,
  `id_Inscription` int(11) NOT NULL,
  `appreciation` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Bulletin`),
  KEY `id_Trimestre` (`id_Trimestre`),
  KEY `id_Inscription` (`id_Inscription`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bulletin`
--

INSERT INTO `bulletin` (`id_Bulletin`, `id_Trimestre`, `id_Inscription`, `appreciation`) VALUES
(1, 1, 1, 'trop top'),
(2, 2, 1, 'des progrès tout au long du semestre'),
(3, 3, 1, 'bonne fin d\'année félicitation'),
(4, 1, 2, 'Bien'),
(5, 2, 2, 'Peut mieux faire'),
(6, 3, 2, 'De meilleurs résultats\r\n'),
(7, 1, 3, 'Semestre un peu timide, peut mieux faire'),
(8, 2, 3, 'Une legere remontee'),
(9, 3, 3, 'Une excellente fin d\'annee'),
(10, 1, 4, 'Bien!'),
(11, 2, 4, 'Bon trimestre'),
(12, 3, 4, 'Excellent');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id_Classe` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_Niveau` int(11) NOT NULL,
  `id-AnneeScolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_Classe`),
  KEY `id_Niveau` (`id_Niveau`),
  KEY `id-AnneeScolaire` (`id-AnneeScolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_Classe`, `nom`, `id_Niveau`, `id-AnneeScolaire`) VALUES
(1, 'TD1', 3, 1),
(2, 'TD2', 3, 1),
(3, 'TD3', 3, 1),
(4, 'TD4', 3, 1),
(5, 'TD5', 3, 1),
(6, 'TD6', 3, 1),
(7, 'TD7', 3, 1),
(8, 'TD8', 3, 1),
(9, 'TD9', 3, 1),
(10, 'TD10', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `detailbulletin`
--

DROP TABLE IF EXISTS `detailbulletin`;
CREATE TABLE IF NOT EXISTS `detailbulletin` (
  `id_DetailBulletin` int(11) NOT NULL AUTO_INCREMENT,
  `id_Bulletin` int(11) NOT NULL,
  `id_Enseignement` int(11) NOT NULL,
  `appéciation` varchar(255) NOT NULL,
  PRIMARY KEY (`id_DetailBulletin`),
  KEY `id_Bulletin` (`id_Bulletin`),
  KEY `id_Enseignement` (`id_Enseignement`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `detailbulletin`
--

INSERT INTO `detailbulletin` (`id_DetailBulletin`, `id_Bulletin`, `id_Enseignement`, `appéciation`) VALUES
(1, 3, 2, 'Tres bon travail'),
(2, 2, 3, 'Satisfaisant'),
(3, 1, 4, 'Très bon travail, bravo\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id_Discipline` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Discipline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`id_Discipline`, `nom`) VALUES
(1, 'mathematiques'),
(2, 'francais'),
(3, 'physique'),
(4, 'anglais');

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `id_Enseignement` int(11) NOT NULL AUTO_INCREMENT,
  `id_Classe` int(11) NOT NULL,
  `id_Discipline` int(11) NOT NULL,
  `id_Personne` int(11) NOT NULL,
  PRIMARY KEY (`id_Enseignement`),
  KEY `id_Classe` (`id_Classe`),
  KEY `id_Discipline` (`id_Discipline`),
  KEY `id_Personne` (`id_Personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`id_Enseignement`, `id_Classe`, `id_Discipline`, `id_Personne`) VALUES
(2, 1, 1, 22),
(3, 1, 3, 42),
(4, 3, 1, 43),
(5, 2, 1, 46);

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_Evaluation` int(11) NOT NULL AUTO_INCREMENT,
  `id_DetailBulletin` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `appreciation` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Evaluation`),
  KEY `id_DetailBulletin` (`id_DetailBulletin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id_Evaluation`, `id_DetailBulletin`, `note`, `appreciation`) VALUES
(1, 1, 19, 'Excellent travail, felicitations'),
(2, 2, 12, 'Travail satisfaisant mais peux mieux faire');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id_Inscription` int(11) NOT NULL AUTO_INCREMENT,
  `id_Classe` int(11) NOT NULL,
  `id_Personne` int(11) NOT NULL,
  PRIMARY KEY (`id_Inscription`),
  KEY `id_Classe` (`id_Classe`),
  KEY `id_Personne` (`id_Personne`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id_Inscription`, `id_Classe`, `id_Personne`) VALUES
(1, 1, 21),
(2, 1, 3),
(3, 2, 4),
(4, 2, 10);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_Niveau` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_Niveau`, `nom`) VALUES
(1, 'ING1'),
(2, 'ING2'),
(3, 'ING3'),
(4, 'ING4'),
(5, 'ING5');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_Personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id_Personne`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_Personne`, `nom`, `prenom`, `type`) VALUES
(3, 'harafa', 'sarah', 1),
(4, 'mondesir', 'cathleen', 1),
(10, 'leandri', 'vannina', 1),
(21, 'poujol', 'charlotte', 1),
(22, 'coudray', 'fabienne', 2),
(35, 'lecor', 'luc', 2),
(36, 'LEBARON', 'FRANCOISE', 2),
(37, 'LEBARON', 'FRANCOISE', 2),
(38, 'LEBARO', 'FRANCOIS', 2),
(39, 'francois', 'claude', 2),
(40, 'francois', 'claude', 2),
(41, 'poujol', 'mariella', 2),
(42, 'poujol', 'guy', 2),
(43, 'poujol', 'thomas', 2),
(44, 'poujol', 'vera', 2),
(45, 'bertei', 'marcel', 2),
(46, 'bertei', 'vera', 2);

-- --------------------------------------------------------

--
-- Structure de la table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
CREATE TABLE IF NOT EXISTS `trimestre` (
  `id_Trimestre` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `début` varchar(255) NOT NULL,
  `fin` varchar(255) NOT NULL,
  `id_AnneeScolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_Trimestre`),
  KEY `id_AnneeScolaire` (`id_AnneeScolaire`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `trimestre`
--

INSERT INTO `trimestre` (`id_Trimestre`, `numero`, `début`, `fin`, `id_AnneeScolaire`) VALUES
(1, 1, 'septembre', 'decembre\r\n', 1),
(2, 2, 'janvier ', 'avril', 1),
(3, 3, 'mai', 'juillet', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_2` FOREIGN KEY (`id_Trimestre`) REFERENCES `trimestre` (`id_Trimestre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_3` FOREIGN KEY (`id_Inscription`) REFERENCES `inscription` (`id_Inscription`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`id_Niveau`) REFERENCES `niveau` (`id_Niveau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`id-AnneeScolaire`) REFERENCES `anneescolaire` (`id_AnneeScolaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailbulletin`
--
ALTER TABLE `detailbulletin`
  ADD CONSTRAINT `detailbulletin_ibfk_2` FOREIGN KEY (`id_Enseignement`) REFERENCES `enseignement` (`id_Enseignement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailbulletin_ibfk_3` FOREIGN KEY (`id_Bulletin`) REFERENCES `bulletin` (`id_Bulletin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`id_Classe`) REFERENCES `classe` (`id_Classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignement_ibfk_2` FOREIGN KEY (`id_Discipline`) REFERENCES `discipline` (`id_Discipline`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignement_ibfk_3` FOREIGN KEY (`id_Personne`) REFERENCES `personne` (`id_Personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`id_DetailBulletin`) REFERENCES `detailbulletin` (`id_DetailBulletin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_Classe`) REFERENCES `classe` (`id_Classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_Personne`) REFERENCES `personne` (`id_Personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trimestre`
--
ALTER TABLE `trimestre`
  ADD CONSTRAINT `trimestre_ibfk_1` FOREIGN KEY (`id_AnneeScolaire`) REFERENCES `anneescolaire` (`id_AnneeScolaire`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
