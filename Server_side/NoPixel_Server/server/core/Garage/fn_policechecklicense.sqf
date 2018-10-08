private["_owner"];

_plate = _this select 0;
_officer = _this select 1;

_checkstr = format ["existLicense:%1", _plate];
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
_booli = (_check select 0) select 0;


diag_log ["license check police: %1 %2", _officer, _plate];

if(_booli) then {

	_fetchstr = format ["getLicense:%1", _plate];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	diag_log format["%1",str(_fetch)];

	_fetch = call compile format["%1",(_fetch select 0)];

	_owner = (_fetch select 3);

	_owner = _owner call BIS_fnc_getUnitByUid;

	[format["License: %1 - Car: %2 - Color: %3 - Owner: %4",toUpper(_fetch select 0),getText(configFile >> "cfgVehicles" >> (_fetch select 1) >> "displayName"),(_fetch select 2),name _owner], true] remoteexec ["domsg",_officer];
} else {
	["This plate returned no results in the DMV database.", true] remoteexec ["domsg",_officer];
};