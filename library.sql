-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2021 um 09:08
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `journal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article`
--

INSERT INTO `article` (`article_id`, `title`, `journal_id`) VALUES
(1, 'article123', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_include_keyword`
--

CREATE TABLE `article_include_keyword` (
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article_include_keyword`
--

INSERT INTO `article_include_keyword` (`article_id`, `keyword_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`, `date_of_birth`) VALUES
(1, 'Max', 'Mustermann', '2019-10-09');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_write_article`
--

CREATE TABLE `author_write_article` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author_write_article`
--

INSERT INTO `author_write_article` (`article_id`, `author_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_write_book`
--

CREATE TABLE `author_write_book` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author_write_book`
--

INSERT INTO `author_write_book` (`book_id`, `author_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `publishing_house_id` int(11) NOT NULL,
  `shelf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`book_id`, `title`, `publishing_house_id`, `shelf_id`) VALUES
(1, 'Book123', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_include_keyword`
--

CREATE TABLE `book_include_keyword` (
  `book_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_include_keyword`
--

INSERT INTO `book_include_keyword` (`book_id`, `keyword_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Susi', 'Musterfrau', 'Susi.muster@beispiel.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Fred', 'Feuerstein');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `journal_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `publishing_house_id` int(11) NOT NULL,
  `shelf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `journal`
--

INSERT INTO `journal` (`journal_id`, `title`, `publishing_house_id`, `shelf_id`) VALUES
(1, 'journal123', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `name`) VALUES
(1, 'Apfel');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id_create` int(11) NOT NULL,
  `employee_id_back` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `loan`
--

INSERT INTO `loan` (`loan_id`, `customer_id`, `employee_id_create`, `employee_id_back`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishing_house`
--

CREATE TABLE `publishing_house` (
  `publishing_house_id` int(11) NOT NULL,
  `publish_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publishing_house`
--

INSERT INTO `publishing_house` (`publishing_house_id`, `publish_name`) VALUES
(1, 'HelloWorld');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reserve`
--

CREATE TABLE `reserve` (
  `reserve_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reserve`
--

INSERT INTO `reserve` (`reserve_id`, `customer_id`, `employee_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelf`
--

CREATE TABLE `shelf` (
  `shelf_id` int(11) NOT NULL,
  `row` int(11) DEFAULT NULL,
  `shelf_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shelf`
--

INSERT INTO `shelf` (`shelf_id`, `row`, `shelf_number`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` int(11) NOT NULL,
  `subject_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subject_area`
--

INSERT INTO `subject_area` (`subject_area_id`, `subject_name`) VALUES
(1, 'Datenbanken');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `journal_id` (`journal_id`);

--
-- Indizes für die Tabelle `article_include_keyword`
--
ALTER TABLE `article_include_keyword`
  ADD PRIMARY KEY (`article_id`,`keyword_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `author_write_article`
--
ALTER TABLE `author_write_article`
  ADD PRIMARY KEY (`article_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indizes für die Tabelle `author_write_book`
--
ALTER TABLE `author_write_book`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publishing_house_id` (`publishing_house_id`),
  ADD KEY `shelf_id` (`shelf_id`);

--
-- Indizes für die Tabelle `book_include_keyword`
--
ALTER TABLE `book_include_keyword`
  ADD PRIMARY KEY (`book_id`,`keyword_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journal_id`),
  ADD KEY `publishing_house_id` (`publishing_house_id`),
  ADD KEY `shelf_id` (`shelf_id`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indizes für die Tabelle `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `employee_id_create` (`employee_id_create`),
  ADD KEY `employee_id_back` (`employee_id_back`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `publishing_house`
--
ALTER TABLE `publishing_house`
  ADD PRIMARY KEY (`publishing_house_id`);

--
-- Indizes für die Tabelle `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`reserve_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indizes für die Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_id`);

--
-- Indizes für die Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `journal`
--
ALTER TABLE `journal`
  MODIFY `journal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keyword_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `publishing_house`
--
ALTER TABLE `publishing_house`
  MODIFY `publishing_house_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `reserve`
--
ALTER TABLE `reserve`
  MODIFY `reserve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `shelf`
--
ALTER TABLE `shelf`
  MODIFY `shelf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  MODIFY `subject_area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`journal_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `article_include_keyword`
--
ALTER TABLE `article_include_keyword`
  ADD CONSTRAINT `article_include_keyword_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `article_include_keyword_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `author_write_article`
--
ALTER TABLE `author_write_article`
  ADD CONSTRAINT `author_write_article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `author_write_article_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `author_write_book`
--
ALTER TABLE `author_write_book`
  ADD CONSTRAINT `author_write_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `author_write_book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishing_house` (`publishing_house_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `shelf` (`shelf_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `book_include_keyword`
--
ALTER TABLE `book_include_keyword`
  ADD CONSTRAINT `book_include_keyword_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_include_keyword_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishing_house` (`publishing_house_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `shelf` (`shelf_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`employee_id_create`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`employee_id_back`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
