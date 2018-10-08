params["_cash"];

[format["You took %1",_cash], true] spawn domsg;

if(isNil "_cash") exitwith {};

if(_cash == 0) exitwith {};

[_cash,false,true] call Client_fnc_addMoneyToPlayer;