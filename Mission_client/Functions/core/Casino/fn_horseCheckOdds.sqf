disableSerialization;

_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;

private["_odds","_type"];
_odds = 0;

{
	_odds = (_x select 2) + _odds;
} foreach horseRacers;

{

	_favoredType = _x select 3;
	_type = "Error - No Favor";

	if(_favoredType == 0) then {
		_type = "Dirt";
	};

	if(_favoredType == 1) then {
		_type = "Muddy";
	};

	if(_favoredType == 2) then {
		_type = "Grass";
	};

	if(_favoredType == 3) then {
		_type = "Wet Grass";
	};

	while {_odds > 50} do {
		_odds = _odds * 0.9;
	};

	_baseodd = (_odds / 7);
	_odd = _x select 2;
	_raceSkill = _x select 3;
	_odd = round((_baseodd + _odd + _raceskill));

	_odd = (_odds - _odd) / 6; 

	if(_odd < 1) then { _odd = 1; };

	_list lbAdd format["Name: %1 - Track Favor: %2 - Horse Odd: 1/%3",_x select 0,_type,_odd];
	_list lbSetdata [(lbSize _list)-1,str([_odd,_forEachIndex])];

} foreach horseRacers;


_type = "Error - No Favor";
_favoredType = racetype;
if(_favoredType == 0) then {
	_type = "Dirt";
};

if(_favoredType == 1) then {
	_type = "Muddy";
};

if(_favoredType == 2) then {
	_type = "Grass";
};

if(_favoredType == 3) then {
	_type = "Wet Grass";
};
