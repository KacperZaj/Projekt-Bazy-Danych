CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_etap`(id_projektu INT(10), komentarz VARCHAR(500), kto_dodal INT(10)) RETURNS int(11)
BEGIN
INSERT INTO `project_stage`(`projectID`, `comment`, `date`,`who_added`) VALUES (id_projektu, komentarz, curdate(), kto_dodal);
RETURN 1;
END