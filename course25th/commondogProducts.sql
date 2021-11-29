CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `commonDogProducts` AS
    SELECT 
        `p`.`name` AS `name`, COUNT(`ols`.`id`) AS `The Count`
    FROM
        (((`orderlines` `ols`
        JOIN `orders` `o` ON ((`ols`.`orderid` = `o`.`id`)))
        JOIN `animals` `a` ON (((`o`.`userid` = `a`.`id`)
            AND (`a`.`species` = `a`.`species`))))
        JOIN `products` `p` ON ((`ols`.`productid` = `p`.`id`)))
    GROUP BY `ols`.`productid`
    ORDER BY `The Count` DESC
    LIMIT 5