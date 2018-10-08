private["_display","_list","_side"];
disableSerialization;

	_radios = player call TFAR_fnc_radiosList;
	if(count _radios == 0) then {
		player additem "cg_tabletd";
		player assignitem "cg_tabletd";
		radioGiven = true;
	};

createdialog "client_PhoneCallPP_Menu";

_playableUnits = (playableUnits) apply {[name _x, _x]}; 
_playableUnits sort true; 
_playableUnits = (_playableUnits) apply {_x select 1}; 

uisleep 0.05;
_display = findDisplay 5337;
_list = _display displayCtrl 5338;
lbClear _list;
{
	if(_x != player) then {
		_list lbAdd format["%1", name _x];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach _playableUnits;


if(myjob == "Radio") exitwith {};
	
if(myjob != "Cop" && myjob != "EMS" && myjob != "Fire") then {
		player setvariable["PhoneCallNumber",0,true];
		player setvariable["PhoneID",0,true];
		callInProgress = false;
		myCallOwner = player;
		_mynumber = getPlayerUID player;
		_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
		_channel = _channel + 1;
		[(call TFAR_fnc_activeSwRadio), _channel, _mynumber] call TFAR_fnc_SetChannelFrequency;
		call TFAR_fnc_HideHint;
};