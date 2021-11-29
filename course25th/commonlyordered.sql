CREATE DEFINER=`root`@`localhost` PROCEDURE `commonlyordered`(IN species varchar(100))
BEGIN
SELECT p.name, COUNT(ols.id) AS 'The Count' FROM orderlines ols
JOIN orders o ON ols.orderid = o.id
JOIN animals a ON o.userid = a.id AND a.species = species -- COLLATE utf8mb4_unicode_520_ci -- to use order setting tell mysql
JOIN products p ON ols.productid = p.id
GROUP BY ols.productid
ORDER BY `The Count` DESC
LIMIT 5;
END