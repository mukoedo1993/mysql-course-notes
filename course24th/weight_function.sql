-- weight>75?unhealthy : healthy
CREATE DEFINER=`root`@`localhost` FUNCTION `weight_function`(theweight INT) RETURNS varchar(100) CHARSET ascii
    DETERMINISTIC
BEGIN

RETURN CONCAT(theweight, IF(theweight>=75, ' which is not healthy', ' which is healthy')) ;
END