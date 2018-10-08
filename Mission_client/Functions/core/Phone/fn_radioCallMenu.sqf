private["_display","_list","_side"];
disableSerialization;

createdialog "client_RadioCall_Menu";

_display = findDisplay 5337;
_list = _display displayCtrl 5338;
lbClear _list;
{
	if(_x != player) then {
		_list lbAdd format["%1", name _x];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach radioConnections; 