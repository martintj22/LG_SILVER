_unit = lbData[5338,lbCurSel (5338)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[player] remoteExec ["client_fnc_forceRadioConnection",_unit];

RadioConnected pushback _unit;

_pia = RadioConnections FIND _unit;
RadioConnections DELETEAT _pia;