private["_type","_activeorno"];

disableSerialization;

latestWanted = _this select 0;

_display = findDisplay 5111;

_list = _display displayCtrl 911;

lbClear _list;

{
	
	switch(_x select 8) do {
		case 0: {
			_activeorno = "CLOSED";
		};
		case 1: {
			_activeorno = "OPEN";
		};
	};
	switch(_x select 6) do {
		case 0: {
			_type = "C";
		};
		case 1: {
			_type = "W";
		};
		case 2: {
			_type = "T";
		};
		case 3: {
			_type = "S";
		};
		case 4: {
			_type = "APB";
		};
		case 5: {
			_type = "E";
		};
	};

	_list lbAdd format["FILE #%1 [%2]", [(_x select 0), 7, 0, false] call CBA_fnc_formatNumber, _activeorno];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach latestWanted;




_list = _display displayCtrl 1120;
lbClear _list;


_playableUnits = (playableUnits) apply {[name _x, _x]}; 
_playableUnits sort true; 
_playableUnits = (_playableUnits) apply {_x select 1}; 


{
	_list lbAdd format["%1", name _x];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach _playableUnits;
