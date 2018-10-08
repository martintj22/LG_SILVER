params["_player"];



_cash = player getvariable "cashinhand";
if(isNil "_cash") exitwith {};
if(_cash == 0 || bankrobber != 1) exitwith { ["No money",true] remoteexec ["domsg",_player]; };

[_cash] call client_fnc_removeCash;

[_cash] remoteexec ["client_fnc_robfinish",_player];