SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `jalkapallo`
--

-- --------------------------------------------------------

--
-- Table structure for table `joukkue`
--

DROP TABLE IF EXISTS `joukkue`;
CREATE TABLE IF NOT EXISTS `joukkue` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(50) NOT NULL,
  `Kaupunki` varchar(50) NOT NULL,
  `Perustamisvuosi` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joukkue`
--

INSERT INTO `joukkue` (`Id`, `Nimi`, `Kaupunki`, `Perustamisvuosi`) VALUES
(1, 'HJK', 'Helsinki', 1950),
(2, 'Rops', 'Rovaniemi', 1951),
(3, 'FC Honka', 'Espoo', 1980),
(4, 'Kups', 'Kuopio', 1967),
(5, 'Ilves', 'Tampere', 1976),
(6, 'VPS', 'Vaasa', 1999),
(7, 'FC Lahti', 'Lahti', 1978),
(8, 'FC Inter', 'Espoo', 1987),
(9, 'SJK', 'Seinäjoki', 1986),
(10, 'Marieham', 'Marieham', 1965),
(11, 'TPS', 'Turku', 1945),
(12, 'PS Kemi', 'Kemi', 1988);

-- --------------------------------------------------------

--
-- Table structure for table `pelaaja`
--

DROP TABLE IF EXISTS `pelaaja`;
CREATE TABLE IF NOT EXISTS `pelaaja` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sukunimi` varchar(30) NOT NULL,
  `Etunimi` varchar(30) NOT NULL,
  `Pelinumero` int(11) NOT NULL,
  `Joukkue_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelaaja`
--

INSERT INTO `pelaaja` (`Id`, `Sukunimi`, `Etunimi`, `Pelinumero`, `Joukkue_id`) VALUES
(1, 'Purje', 'Ats', 10, 4),
(2, 'Karjalainen', 'Rasmus', 7, 4),
(3, 'Riski', 'Riku', 9, 1),
(4, 'Pelvas', 'Akseli', 11, 1),
(5, 'Järvenpää', 'Lassi', 13, 2),
(6, 'Roiha', 'Simo', 20, 2),
(7, 'Paunio', 'Atte', 32, 3),
(8, 'Rahikka', 'Joona', 22, 3),
(9, 'Tanska', 'Jani', 5, 5),
(10, 'Haarala', 'Santeri', 29, 5),
(11, 'Stranvall', 'Sebastian', 8, 6),
(12, 'Vahtera', 'Joonas', 17, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sarjataulukko`
--

DROP TABLE IF EXISTS `sarjataulukko`;
CREATE TABLE IF NOT EXISTS `sarjataulukko` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ottelumaara` int(11) NOT NULL,
  `Joukkue_id` int(11) NOT NULL,
  `Voittoja` int(11) NOT NULL,
  `Tappioita` int(11) NOT NULL,
  `Tasapeleja` int(11) NOT NULL,
  `Tehdyt_maalit` int(11) NOT NULL,
  `Paastetyt_maalit` int(11) NOT NULL,
  `Pisteet` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sarjataulukko`
--

INSERT INTO `sarjataulukko` (`Id`, `Ottelumaara`, `Joukkue_id`, `Voittoja`, `Tappioita`, `Tasapeleja`, `Tehdyt_maalit`, `Paastetyt_maalit`, `Pisteet`) VALUES
(1, 29, 1, 21, 3, 5, 55, 19, 68),
(2, 29, 2, 15, 6, 8, 37, 22, 53),
(3, 29, 3, 12, 5, 12, 45, 32, 48),
(4, 29, 4, 13, 9, 7, 47, 35, 46),
(5, 29, 5, 13, 9, 7, 41, 37, 46),
(6, 29, 6, 10, 8, 11, 35, 24, 41),
(7, 29, 12, 4, 19, 6, 25, 52, 18),
(8, 29, 10, 7, 16, 6, 32, 54, 27),
(9, 29, 11, 6, 15, 8, 30, 45, 26),
(10, 29, 9, 7, 15, 7, 25, 33, 28),
(11, 29, 7, 9, 12, 8, 32, 39, 35),
(12, 29, 8, 8, 8, 13, 32, 39, 35);

-- --------------------------------------------------------

--
-- Table structure for table `tapahtuma`
--

DROP TABLE IF EXISTS `tapahtuma`;
CREATE TABLE IF NOT EXISTS `tapahtuma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `aika` date NOT NULL,
  `kuvaus` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tapahtuma`
--

INSERT INTO `tapahtuma` (`Id`, `aika`, `kuvaus`) VALUES
(13, '1995-03-06', 'Ottelu'),
(14, '1996-03-06', 'Ottelu1'),
(15, '1997-03-06', 'Ottelu2'),
(16, '1998-03-06', 'Ottelu3'),
(17, '1999-03-06', 'Ottelu4'),
(18, '2024-06-06', 'Kups-Honka Suomen Cup'),
(19, '2024-05-06', 'Kauden avaijaiset'),
(20, '2021-07-06', 'Kalpa-Ilves'),
(21, '2023-09-06', 'Siipo-Pupe'),
(22, '2023-12-06', 'ToU-Kups');
COMMIT;