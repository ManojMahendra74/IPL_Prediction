create database ipl;
drop  database ipl;
use ipl;

select *
from csk;

CALL get_ipl_info1(0);
CALL get_players_with_sixes(5);
CALL get_best_player('Batting Average');
