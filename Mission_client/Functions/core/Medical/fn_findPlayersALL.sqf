disableSerialization;
if(!dialog) then {	createdialog "FindPlayer_Menu"; };


uisleep 0.05;
_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;


_playableUnits = (playableUnits) apply {[name _x, _x]}; 
_playableUnits sort true; 
_playableUnits = (_playableUnits) apply {_x select 1}; 

{
	_list lbAdd format["%1", name _x];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach _playableUnits;
