CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `studia`.`wyswietl_spoznione_projekty` AS
    SELECT 
        `studia`.`project`.`projectID` AS `projectID`,
        `studia`.`project`.`clientID` AS `clientID`,
        `studia`.`project`.`topic` AS `topic`,
        `studia`.`project`.`comment` AS `comment`,
        `studia`.`project`.`deadline` AS `deadline`,
        `studia`.`project`.`or_finished` AS `or_finished`
    FROM
        `studia`.`project`
    WHERE
        `studia`.`project`.`deadline` < CURDATE()