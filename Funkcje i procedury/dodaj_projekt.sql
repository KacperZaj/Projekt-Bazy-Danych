CREATE DEFINER=`root`@`localhost` FUNCTION `dodaj_projekt`(id_klienta INT(10),temat VARCHAR(50),komentarz VARCHAR(500),deadline DATE) RETURNS int(11)
BEGIN
INSERT INTO `project`(`clientID`, `topic`, `comment`, `deadline`, `or_finished`) VALUES (id_klienta,temat,komentarz,deadline, '0');
RETURN 1;
END