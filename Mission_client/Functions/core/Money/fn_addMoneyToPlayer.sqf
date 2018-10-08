private ["_old", "_new"];
params [["_amount",0],["_clean",true],["_notcleaning",true]];

// if _clean is true, the money is coming from a valid source.
// if _notcleaning is true, it is normal money, if it is false, we are removing dirty money from our total of dirty money.
//so the default to add normal money 
//[_amount,true,true] call Client_fnc_addMoneyToPlayer; -- NORMAL
//[_amount,false,true] call Client_fnc_addMoneyToPlayer; -- DIRTY MONEY
//[_amount,true,false] call Client_fnc_addMoneyToPlayer; -- CLEANING

_amount = call compile ([_amount, 1, 2, false] call CBA_fnc_formatNumber);

_old = player getVariable "cashinhand";
_new = _old + _amount;
if(_new < 0) then { _new = 0; };

player setVariable ["cashinhand", _new, false];

[player, "cashinhand", _new] remoteExec ["Server_fnc_setVariable",2];

if(!_clean) then {
	["Add","Karma",_amount,"DirtyMoney"] call client_fnc_sustain;
};

if(!_notcleaning) then {
	["Remove","Karma",_amount,"DirtyMoney"] call client_fnc_sustain;
};
