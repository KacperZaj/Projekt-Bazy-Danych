CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `studia`.`wyswietl_osoby_odpowiedzialne_za_dany_projekt` AS
    SELECT 
        CONCAT(`studia`.`employee`.`name`,
                ' ',
                `studia`.`employee`.`last_name`) AS `Przypisani do projektu x`
    FROM
        ((`studia`.`employee to project`
        JOIN `studia`.`employee` ON (`studia`.`employee to project`.`employeeID` = `studia`.`employee`.`employeeID`))
        JOIN `studia`.`project` ON (`studia`.`employee to project`.`projectID` = `studia`.`project`.`projectID`))
    WHERE
        `studia`.`employee to project`.`projectID` = 25