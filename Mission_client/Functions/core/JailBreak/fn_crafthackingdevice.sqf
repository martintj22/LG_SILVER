
_total = {_x == "cg_lockpick"} count magazines player;

if(_total == 0) exitwith { ["You need a lockpick", true] spawn domsg; };

_chance = random ( 100 );
if(_chance > 75) then {
	player additem "cg_hackingtool";
	["You were successful", true] spawn domsg;
} else { ["You failed", true] spawn domsg; };