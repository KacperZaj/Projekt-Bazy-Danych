CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_pracownika`(id_stanowiska INT(10), imie VARCHAR(50), nazwisko VARCHAR(50), numer_telefonu VARCHAR(50), email VARCHAR(50)) RETURNS int(11)
BEGIN
INSERT INTO `employee`( `positionID`, `name`, `last_name`, `phone_number`, `email`, `login`, `password`) VALUES (id_stanowiska, imie, nazwisko,numer_telefonu,email);
RETURN 1;
END