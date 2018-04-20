-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 20. 04 2018 kl. 12:32:49
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kulturhus`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `arrangementer`
--

CREATE TABLE IF NOT EXISTS `arrangementer` (
  `id` int(11) NOT NULL,
  `navn` varchar(55) NOT NULL,
  `pris` int(11) NOT NULL,
  `dato` datetime NOT NULL,
  `Sal_fk` int(11) NOT NULL,
  `varighed` int(11) NOT NULL,
  `beskrivelse` text NOT NULL,
  `billede` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `arrangementer`
--

INSERT INTO `arrangementer` (`id`, `navn`, `pris`, `dato`, `Sal_fk`, `varighed`, `beskrivelse`, `billede`) VALUES
(1, 'Star Wars the force awakens', 87, '2018-04-04 19:45:00', 5, 135, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'starwars.jpg'),
(2, 'Olsen Banden ser rødt', 40, '2018-04-12 16:00:00', 5, 60, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'olsen_banden.jpg'),
(3, 'Kim Larsen', 150, '2018-04-10 00:00:00', 9, 120, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'koncert.jpg'),
(4, 'Beauty and the Beast', 250, '2018-04-19 00:00:00', 6, 140, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'bea.jpg'),
(5, 'The Phantom of the Opera', 280, '2018-04-27 00:00:00', 6, 140, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'teaterr.jpg'),
(6, 'PICASSO KERAMIK', 150, '2018-04-09 00:00:00', 8, 60, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'kunst33.jpg'),
(7, 'Sundhed og Kost', 80, '2018-04-15 00:00:00', 7, 150, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'sundhed.jpg'),
(8, 'Kreative Kurser', 160, '2018-05-18 00:00:00', 7, 120, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'kurser.jpg'),
(9, 'Kunstværker', 50, '2018-05-15 00:00:00', 8, 60, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'kunst22.jpg'),
(10, 'Scarlet Pleasures', 150, '2018-06-19 00:00:00', 9, 120, 'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard\r\n                    fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en\r\n                    bog til sammenligning af forskellige skrifttyper.', 'koncert2.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(11) NOT NULL,
  `navn` varchar(55) NOT NULL,
  `pladser` int(11) NOT NULL,
  `type_fk` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `sale`
--

INSERT INTO `sale` (`id`, `navn`, `pladser`, `type_fk`) VALUES
(5, 'Biograf', 175, 17),
(6, 'Teater Sal', 200, 18),
(7, 'Foredrags Sal', 100, 21),
(8, 'Udstillings Sal', 80, 20),
(9, 'Koncert Sal', 250, 19);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL,
  `navn` varchar(55) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `type`
--

INSERT INTO `type` (`id`, `navn`) VALUES
(17, 'Film'),
(21, 'Foredrag'),
(19, 'Koncert'),
(18, 'Teater'),
(20, 'Udstilling');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `mob_no` int(11) NOT NULL,
  `user_name` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mob_no`, `user_name`, `password`) VALUES
(1, '', '', 0, 'admin', 'admin');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `arrangementer`
--
ALTER TABLE `arrangementer`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `navn` (`navn`), ADD KEY `Sal_fk` (`Sal_fk`);

--
-- Indeks for tabel `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Navn` (`navn`), ADD KEY `type_fk_2` (`type_fk`);

--
-- Indeks for tabel `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Navn` (`navn`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mob_no` (`mob_no`), ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `arrangementer`
--
ALTER TABLE `arrangementer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Tilføj AUTO_INCREMENT i tabel `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- Tilføj AUTO_INCREMENT i tabel `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `sale`
--
ALTER TABLE `sale`
ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`type_fk`) REFERENCES `type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
