CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_pozycje`(nazwa_pozycji VARCHAR(50), opis VARCHAR(500)) RETURNS int(11)
BEGIN
INSERT INTO `position`(`position_name`, `description`) VALUES (nazwa_pozycji,opis);
RETURN 1;
END