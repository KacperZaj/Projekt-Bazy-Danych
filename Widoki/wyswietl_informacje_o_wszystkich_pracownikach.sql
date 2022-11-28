CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `studia`.`wyswietl_informacje_o_wszystkich_pracownikach` AS
    SELECT 
        CONCAT(`studia`.`employee`.`name`,
                ' ',
                `studia`.`employee`.`last_name`) AS `Imie i nazwisko`,
        `studia`.`employee`.`email` AS `E-mail`,
        `studia`.`position`.`position_name` AS `Rola`
    FROM
        (`studia`.`employee`
        JOIN `studia`.`position` ON (`studia`.`employee`.`positionID` = `studia`.`position`.`positionID`))