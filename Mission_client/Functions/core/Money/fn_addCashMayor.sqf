private ["_old", "_new"];
params ["_amount"];
_old = player getVariable "cashinhand";
_new = _old + _amount;
player setVariable ["cashinhand", _new, false];

[format ["You got paid %1 in taxes.",_amount], true] spawn domsg;