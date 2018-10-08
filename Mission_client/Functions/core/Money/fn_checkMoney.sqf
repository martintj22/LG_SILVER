/*
Params
0 - Number - (1 - Cash, 2 - Bank)
1 - Number - Amount of checked money
["cashinhand",_amount] call client_fnc_checkmoney;
*/
params ["_type", "_amount"];

_return = false;
if (_type == 1) then {
	_cash = player getVariable "cashinhand";
	_math = _cash - _amount;
	if (_math >= 0 && _amount >= 0) then {_return = true};
} else {
	_bank = player getVariable "cashinbank";
	_math = _bank - _amount;
	if (_math >= 0 && _amount >= 0) then {_return = true};
};

_return