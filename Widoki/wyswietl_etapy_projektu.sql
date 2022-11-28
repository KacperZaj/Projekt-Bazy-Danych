CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `studia`.`wyswietl_etapy_projektu` AS
    SELECT 
        `studia`.`project`.`topic` AS `Projekt`,
        `studia`.`project_stage`.`comment` AS `Komentarz`,
        `studia`.`project_stage`.`date` AS `Data dodania`,
        CONCAT(`studia`.`employee`.`name`,
                ' ',
                `studia`.`employee`.`last_name`) AS Kto dodal
    FROM
        ((studia.project_stage
        JOIN studia.employee ON (studia.project_stage.who_added = studia.employee.employeeID))
        JOIN studia.project ON (studia.project_stage.projectID = studia.project.projectID))
    WHERE
        studia.project.projectID = 23