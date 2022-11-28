CREATE DEFINER=`root`@`localhost` FUNCTION `ukoncz_projekt`(id_projektu INT(10)) RETURNS int(11)
BEGIN
UPDATE `project` SET `or_finished`='1' WHERE `projectID` = id_projektu;
RETURN 1;
END