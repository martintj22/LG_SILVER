private ["_old", "_new"];
params ["_amount"];
_old = (client_level_array select 17);
_new = _old - _amount;
if (_new < 0) then {
	_return = false;
} else {
    ["Set","Karma",_new,"DirtyStash"] call client_fnc_sustain;
	_return = true;
};