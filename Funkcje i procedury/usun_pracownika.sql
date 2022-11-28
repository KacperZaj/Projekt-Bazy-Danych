CREATE DEFINER=`root`@`localhost` FUNCTION `usun_pracownika`(id_pracownika INT(10)) RETURNS int(11)
BEGIN
DELETE FROM `employee` WHERE `employeeID` = id_pracownika;
RETURN 1;
END