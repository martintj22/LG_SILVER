private ["_old", "_new"];
params [["_amount",0]];

_amount = call compile ([_amount, 1, 2, false] call CBA_fnc_formatNumber);

_old = (client_level_array select 17);
_new = _old + _amount;
if(_new < 0) then { _new = 0; };

["Set","Karma",_new,"DirtyStash"] call client_fnc_sustain;