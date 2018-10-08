_chance = random ( 100 );
if(_chance > 85) then {
	player additem "cg_lockpick";
	["You were successful", true] spawn domsg;
} else { ["You failed", true] spawn domsg; };