CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
calendar_date date
) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

	declare m tinyint;
    declare fiscal_quarter char(2);
    set m = month(calendar_date);
    
    case 
		when m in (9,10,11) then set fiscal_quarter = "Q1";
		when m in (12,1,2) then set fiscal_quarter = "Q2";
        when m in (3,4,5) then set fiscal_quarter = "Q3";
        else set fiscal_quarter = "Q4";

        
	end case;
    

RETURN fiscal_quarter;
END