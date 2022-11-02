-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Nov 2022 um 16:45
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `social_network`
--
CREATE DATABASE IF NOT EXISTS `social_network` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `social_network`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `publication_date` date NOT NULL DEFAULT current_timestamp(),
  `fk_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `comment`
--

INSERT INTO `comment` (`comment_id`, `text`, `publication_date`, `fk_profile_id`) VALUES
(1, 'This is the first comment from John Doe.', '2022-11-02', 1),
(2, 'And here is another comment', '2022-11-02', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `file_name` varchar(30) NOT NULL,
  `description` varchar(30) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `photo`
--

INSERT INTO `photo` (`photo_id`, `file_name`, `description`, `fk_user_id`) VALUES
(1, 'my_nice_picture', 'A short description...', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `nick` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `profile`
--

INSERT INTO `profile` (`profile_id`, `PASSWORD`, `email_address`, `NAME`, `nick`) VALUES
(1, '123', 'john@abc.com', 'John Doe', 'john25'),
(2, '123', 'homer@simpsons.com', 'Homer Simpson', 'homer12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `fk_profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `age`, `country`, `profession`, `fk_profile_id`) VALUES
(2, 35, 'Austria', 'Teacher', 1),
(3, 28, 'Germany', 'Geologist', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_profile_id` (`fk_profile_id`);

--
-- Indizes für die Tabelle `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_profile_id` (`fk_profile_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`);

--
-- Constraints der Tabelle `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
