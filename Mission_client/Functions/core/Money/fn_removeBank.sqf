private ["_old", "_new"];
params ["_amount"];
_old = player getVariable "cashinbank";
_new = _old - _amount;
if (_new < 0) then {
	_return = false;
} else {
	player setVariable ["cashinbank", _new, false];
	[player, "cashinbank", _new] remoteExec ["Server_fnc_setVariable",2];
	_return = true;
};