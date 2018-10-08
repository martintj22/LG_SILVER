private ["_old", "_new"];
params [["_amount",0]];

_amount = call compile ([_amount, 1, 2, false] call CBA_fnc_formatNumber);

_old = player getVariable "cashinbank";
_new = _old + _amount;
if(_new < 0) then { _new = 0; };

player setVariable ["cashinbank", _new, false];

[player, "cashinbank", _new] remoteExec ["Server_fnc_setVariable",2];