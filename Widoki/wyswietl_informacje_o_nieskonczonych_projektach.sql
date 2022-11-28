CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `studia`.`wyswietl_informacje_o_nieskonczonych_projektach` AS
    SELECT 
        `studia`.`client`.`name` AS `Nazwa klienta`,
        `studia`.`project`.`topic` AS `Nazwa projektu`,
        `studia`.`project`.`comment` AS `Komentarz`,
        `studia`.`project`.`deadline` AS `Deadline`,
        TO_DAYS(`studia`.`project`.`deadline`) - TO_DAYS(CURDATE()) AS `Dni do deadlinu`,
        COUNT(`studia`.`employee to project`.`projectID`) AS Ilość przypisanych pracowników
    FROM
        ((studia.project
        JOIN studia.client ON (studia.project.clientID = studia.client.clientID))
        JOIN studia.employee to project ON (studia.project.projectID = studia.employee to project.projectID))
    WHERE
        TO_DAYS(studia.project.deadline) - TO_DAYS(CURDATE()) > 0
            AND studia.project.or_finished = 0
    GROUP BY studia.employee to project.projectID