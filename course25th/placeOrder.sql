CREATE DEFINER=`root`@`localhost` PROCEDURE `placeOrder`(IN user INT, IN items JSON)
BEGIN
  INSERT INTO orders (date, userid) VALUES (NOW(), user); -- traditional insert statement
  SET @thelast = LAST_INSERT_ID(); -- return the last item that was just inserted or created
  SET @i = 0;
  WHILE @i < JSON_LENGTH(items) DO -- loop through JSON objects.
    INSERT INTO orderlines (productid, orderid, quantity) VALUES (JSON_EXTRACT(items, CONCAT("$[", @i, "].product")), @thelast, JSON_EXTRACT(items, CONCAT("$[", @i, "].quantity"))); -- loop inside json object
    SET @i = @i + 1;
  END WHILE;
  SELECT * FROM orderlines JOIN orders ON orderlines.orderid = orders.id AND orderlines.orderid = @thelast JOIN products ON orderlines.productid = products.id JOIN animals ON orders.userid = animals.id; -- select relevant data 
  -- we want to show to the user. Join these tables together to show human-readable names of products to the user.
  -- only show the orderlines where the order ID equals the last overall ID just got inserted
  -- that just got created.
  -- first param: 2
  -- second param[{"product": 1, "quantity": 9}, {"product": 46, "quantity": 99}]
END
