create database ipl;
drop  database ipl;
use ipl;

select *
from csk;

CALL get_ipl_info1(0);
CALL get_players_with_sixes(5);
CALL get_best_player('Batting Average');


CREATE DEFINER=`root`@`localhost` PROCEDURE `get_players_with_sixes`(IN `NumSixes` INT)
BEGIN
    SELECT  `Player Name`, `Player Nationality`, `Sixes`
    FROM `csk`
    WHERE `Sixes` = NumSixes;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ipl_info1`(IN `BattingStrikeRate` DOUBLE)
BEGIN
    SELECT  `Player Name`, `Player Nationality`, `Batting Strike Rate`
    FROM `csk`
    WHERE `Batting Strike Rate` = BattingStrikeRate;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_best_player`(IN `Criteria` VARCHAR(100))
BEGIN
    DECLARE bestPlayer VARCHAR(100);
    
    IF Criteria = 'Batting Average' THEN
        SELECT `Player Name` INTO bestPlayer
        FROM `csk`
        ORDER BY `Batting Average` DESC
        LIMIT 1;
    ELSEIF Criteria = 'Batting Strike Rate' THEN
        SELECT `Player Name` INTO bestPlayer
        FROM `csk`
        ORDER BY `Batting Strike Rate` DESC
        LIMIT 1;
    ELSEIF Criteria = 'Bowling Average' THEN
        SELECT `Player Name` INTO bestPlayer
        FROM `csk`
        ORDER BY `Bowling Average` ASC
        LIMIT 1;
    ELSE
        SET bestPlayer = 'Invalid Criteria';
    END IF;
    
    SELECT bestPlayer AS `Best Player`;
END
