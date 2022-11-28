-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Lis 2022, 20:16
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `studia`
--

DELIMITER $$
--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_etap` (`id_projektu` INT(10), `komentarz` VARCHAR(500), `kto_dodal` INT(10)) RETURNS INT(11)  BEGIN
INSERT INTO `project_stage`(`projectID`, `comment`, `date`,`who_added`) VALUES (id_projektu, komentarz, curdate(), kto_dodal);
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_klienta` (`nazwa_klienta` VARCHAR(50), `adres` VARCHAR(150), `miasto` VARCHAR(150), `kod_pocztowy` VARCHAR(50)) RETURNS INT(11)  BEGIN
INSERT INTO `client`(`name`, `address`, `city`, `zip_code`) VALUES (nazwa_klienta,adres,miasto,kod_pocztowy);
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_pozycje` (`nazwa_pozycji` VARCHAR(50), `opis` VARCHAR(500)) RETURNS INT(11)  BEGIN
INSERT INTO `position`(`position_name`, `description`) VALUES (nazwa_pozycji,opis);
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_pracownika` (`id_stanowiska` INT(10), `imie` VARCHAR(50), `nazwisko` VARCHAR(50), `numer_telefonu` VARCHAR(50), `email` VARCHAR(50)) RETURNS INT(11)  BEGIN
INSERT INTO `employee`( `positionID`, `name`, `last_name`, `phone_number`, `email`, `login`, `password`) VALUES (id_stanowiska, imie, nazwisko,numer_telefonu,email);
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_projekt` (`id_klienta` INT(10), `temat` VARCHAR(50), `komentarz` VARCHAR(500), `deadline` DATE) RETURNS INT(11)  BEGIN
INSERT INTO `project`(`clientID`, `topic`, `comment`, `deadline`, `or_finished`) VALUES (id_klienta,temat,komentarz,deadline, '0');
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `ukończ projekt` (`id_projektu` INT(10)) RETURNS INT(11)  BEGIN
UPDATE `project` SET `or_finished`='1' WHERE `projectID` = id_projektu;
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `ukoncz_projekt` (`id_projektu` INT(10)) RETURNS INT(11)  BEGIN
UPDATE `project` SET `or_finished`='1' WHERE `projectID` = id_projektu;
RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `usun_pracownika` (`id_pracownika` INT(10)) RETURNS INT(11)  BEGIN
DELETE FROM `employee` WHERE `employeeID` = id_pracownika;
RETURN 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client`
--

CREATE TABLE `client` (
  `clientID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `zip_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `client`
--

INSERT INTO `client` (`clientID`, `name`, `address`, `city`, `zip_code`) VALUES
(1, 'firma X', 'Architektów 10', 'Rzeszow', '12-123'),
(2, 'firma Y', 'Warszawska 123', 'Rzeszow', '12-123'),
(3, 'firma Z', 'Wieniawskiego 12', 'Krosno', '38-400');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(10) NOT NULL,
  `positionID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `employee`
--

INSERT INTO `employee` (`employeeID`, `positionID`, `name`, `last_name`, `phone_number`, `email`) VALUES
(27, 1, 'Jacek', 'Kość', '123456789', 'jacek@gmail.com'),
(28, 2, 'Kacper', 'Zając', '122346453', 'kacper@gmail.com'),
(29, 3, 'Maciej', 'Zieminski', '12346546', 'maciek@gmail.com'),
(31, 2, 'Marcin', 'Dypa', '123312322', 'marcin.d@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee to project`
--

CREATE TABLE `employee to project` (
  `employeeID` int(10) NOT NULL,
  `projectID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `employee to project`
--

INSERT INTO `employee to project` (`employeeID`, `projectID`) VALUES
(28, 23),
(28, 24),
(28, 26),
(28, 27),
(28, 29),
(28, 30),
(29, 25),
(29, 28),
(29, 30),
(31, 25),
(31, 28),
(31, 30),
(27, 24),
(27, 25),
(27, 26),
(27, 27),
(27, 28),
(27, 29),
(27, 30),
(27, 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `position`
--

CREATE TABLE `position` (
  `positionID` int(10) NOT NULL,
  `position_name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `position`
--

INSERT INTO `position` (`positionID`, `position_name`, `description`) VALUES
(1, 'Project Manager', 'Zarządza projektami'),
(2, 'Koder', 'Koduje strony internetowe'),
(3, 'Grafik', 'Tworzy projekty graficzne');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `project`
--

CREATE TABLE `project` (
  `projectID` int(10) NOT NULL,
  `clientID` int(10) NOT NULL,
  `topic` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `deadline` date NOT NULL,
  `or_finished` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `project`
--

INSERT INTO `project` (`projectID`, `clientID`, `topic`, `comment`, `deadline`, `or_finished`) VALUES
(23, 1, 'Mailing', 'Mailing dla ', '2023-05-11', 1),
(24, 1, 'Stopka mailowa', '-', '2023-01-01', 0),
(25, 2, 'Strona internetowa', '-', '2023-03-12', 0),
(26, 2, 'Mailing', 'Mailing na styczeń', '2023-01-15', 0),
(27, 2, 'Mailing', 'Mailing na luty', '2023-02-15', 0),
(28, 3, 'Strona internetowa', 'Strona internetowa ze sklepem', '2023-12-30', 1),
(29, 3, 'Mailing', '-', '2022-12-31', 1),
(30, 3, 'Stopka mailowa', '-', '2022-11-25', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `project_stage`
--

CREATE TABLE `project_stage` (
  `stageID` int(10) NOT NULL,
  `projectID` int(10) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `who_added` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `project_stage`
--

INSERT INTO `project_stage` (`stageID`, `projectID`, `comment`, `date`, `who_added`) VALUES
(1, 23, 'Kodowanie', '2022-11-27', 28),
(2, 23, 'Testy', '2022-11-30', 31),
(3, 24, 'Utworzono projekt graficzny', '2022-11-28', 29),
(4, 24, 'Zaakceptowany projekt', '2022-11-29', 27),
(5, 24, 'Kodowanie', '0000-00-00', 28),
(6, 25, 'Utworzono projekt graficzny', '2022-12-27', 29),
(7, 25, 'Zaakceptowany projekt', '2022-01-10', 27),
(8, 25, 'Kodowanie', '2022-01-12', 28),
(9, 26, 'Utworzono projekt graficzny', '2022-12-27', 29),
(10, 26, 'Zaakceptowany projekt', '2022-01-10', 27),
(11, 26, 'Kodowanie', '2022-01-12', 31),
(12, 28, 'Utworzono projekt graficzny', '2022-12-27', 29),
(13, 28, 'Zaakceptowany projekt', '2022-01-10', 27),
(14, 28, 'Kodowanie', '2022-01-12', 28),
(15, 29, 'Ukończono', '2022-11-20', 27);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_etapy_projektu`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_etapy_projektu` (
`Projekt` varchar(50)
,`Komentarz` varchar(500)
,`Data dodania` date
,`Kto dodał` varchar(101)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_informacje_o_nieskonczonych_projektach`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_informacje_o_nieskonczonych_projektach` (
`Nazwa klienta` varchar(50)
,`Nazwa projektu` varchar(50)
,`Komentarz` varchar(500)
,`Deadline` date
,`Dni do deadlinu` int(7)
,`Ilość przypisanych pracowników` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_informacje_o_wszystkich_pracownikach`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_informacje_o_wszystkich_pracownikach` (
`Imie i nazwisko` varchar(101)
,`E-mail` varchar(50)
,`Rola` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_osoby_odpowiedzialne_za_dany_projekt`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_osoby_odpowiedzialne_za_dany_projekt` (
`Przypisani do projektu x` varchar(101)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_spoznione_projekty`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_spoznione_projekty` (
`projectID` int(10)
,`clientID` int(10)
,`topic` varchar(50)
,`comment` varchar(500)
,`deadline` date
,`or_finished` tinyint(1)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyswietl_ukonczone_projekty`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyswietl_ukonczone_projekty` (
`projectID` int(10)
,`clientID` int(10)
,`topic` varchar(50)
,`comment` varchar(500)
,`deadline` date
,`or_finished` tinyint(1)
);

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_etapy_projektu`
--
DROP TABLE IF EXISTS `wyswietl_etapy_projektu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_etapy_projektu`  AS SELECT `project`.`topic` AS `Projekt`, `project_stage`.`comment` AS `Komentarz`, `project_stage`.`date` AS `Data dodania`, concat(`employee`.`name`,' ',`employee`.`last_name`) AS `Kto dodał` FROM ((`project_stage` join `employee` on(`project_stage`.`who_added` = `employee`.`employeeID`)) join `project` on(`project_stage`.`projectID` = `project`.`projectID`)) WHERE `project`.`projectID` = 2323  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_informacje_o_nieskonczonych_projektach`
--
DROP TABLE IF EXISTS `wyswietl_informacje_o_nieskonczonych_projektach`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_informacje_o_nieskonczonych_projektach`  AS SELECT `client`.`name` AS `Nazwa klienta`, `project`.`topic` AS `Nazwa projektu`, `project`.`comment` AS `Komentarz`, `project`.`deadline` AS `Deadline`, to_days(`project`.`deadline`) - to_days(curdate()) AS `Dni do deadlinu`, count(`employee to project`.`projectID`) AS `Ilość przypisanych pracowników` FROM ((`project` join `client` on(`project`.`clientID` = `client`.`clientID`)) join `employee to project` on(`project`.`projectID` = `employee to project`.`projectID`)) WHERE to_days(`project`.`deadline`) - to_days(curdate()) > 0 AND `project`.`or_finished` = 0 GROUP BY `employee to project`.`projectID``projectID`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_informacje_o_wszystkich_pracownikach`
--
DROP TABLE IF EXISTS `wyswietl_informacje_o_wszystkich_pracownikach`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_informacje_o_wszystkich_pracownikach`  AS SELECT concat(`employee`.`name`,' ',`employee`.`last_name`) AS `Imie i nazwisko`, `employee`.`email` AS `E-mail`, `position`.`position_name` AS `Rola` FROM (`employee` join `position` on(`employee`.`positionID` = `position`.`positionID`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_osoby_odpowiedzialne_za_dany_projekt`
--
DROP TABLE IF EXISTS `wyswietl_osoby_odpowiedzialne_za_dany_projekt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_osoby_odpowiedzialne_za_dany_projekt`  AS SELECT concat(`employee`.`name`,' ',`employee`.`last_name`) AS `Przypisani do projektu x` FROM ((`employee to project` join `employee` on(`employee to project`.`employeeID` = `employee`.`employeeID`)) join `project` on(`employee to project`.`projectID` = `project`.`projectID`)) WHERE `employee to project`.`projectID` = 2525  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_spoznione_projekty`
--
DROP TABLE IF EXISTS `wyswietl_spoznione_projekty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_spoznione_projekty`  AS SELECT `project`.`projectID` AS `projectID`, `project`.`clientID` AS `clientID`, `project`.`topic` AS `topic`, `project`.`comment` AS `comment`, `project`.`deadline` AS `deadline`, `project`.`or_finished` AS `or_finished` FROM `project` WHERE `project`.`deadline` < curdate()  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyswietl_ukonczone_projekty`
--
DROP TABLE IF EXISTS `wyswietl_ukonczone_projekty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyswietl_ukonczone_projekty`  AS SELECT `project`.`projectID` AS `projectID`, `project`.`clientID` AS `clientID`, `project`.`topic` AS `topic`, `project`.`comment` AS `comment`, `project`.`deadline` AS `deadline`, `project`.`or_finished` AS `or_finished` FROM `project` WHERE `project`.`or_finished` = 11  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientID`);

--
-- Indeksy dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `positionID` (`positionID`);

--
-- Indeksy dla tabeli `employee to project`
--
ALTER TABLE `employee to project`
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indeksy dla tabeli `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionID`);

--
-- Indeksy dla tabeli `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `clientID` (`clientID`);

--
-- Indeksy dla tabeli `project_stage`
--
ALTER TABLE `project_stage`
  ADD PRIMARY KEY (`stageID`),
  ADD KEY `projectID` (`projectID`),
  ADD KEY `who_added` (`who_added`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `client`
--
ALTER TABLE `client`
  MODIFY `clientID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT dla tabeli `position`
--
ALTER TABLE `position`
  MODIFY `positionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `project_stage`
--
ALTER TABLE `project_stage`
  MODIFY `stageID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `employee to project`
--
ALTER TABLE `employee to project`
  ADD CONSTRAINT `employee to project_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee to project_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `client` (`clientID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `project_stage`
--
ALTER TABLE `project_stage`
  ADD CONSTRAINT `project_stage_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_stage_ibfk_2` FOREIGN KEY (`who_added`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
