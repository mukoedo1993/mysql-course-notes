-- if start with A, half price. if start with F, free. 
CREATE DEFINER=`root`@`localhost` FUNCTION `discountLogic`(theprice decimal(10, 2), thename varchar(60)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
RETURN CASE LEFT(thename, 1)
WHEN 'A' THEN theprice * .5
WHEN 'F' THEN 0
ELSE theprice -- callback
END;
END