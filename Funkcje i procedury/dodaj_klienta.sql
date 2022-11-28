CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_klienta`(nazwa_klienta VARCHAR(50), adres VARCHAR(150), miasto VARCHAR(150), kod_pocztowy VARCHAR(50)) RETURNS int(11)
BEGIN
INSERT INTO `client`(`name`, `address`, `city`, `zip_code`) VALUES (nazwa_klienta,adres,miasto,kod_pocztowy);
RETURN 1;
END