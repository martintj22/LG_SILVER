params["_statement","_amount"];

[_statement,false] spawn domsg;

_amount = _amount * 0.1;

if(_amount > 2000) then { _amount = 2000; };
if(_amount < 50) exitwith {};

[_amount,true,true] call Client_fnc_addMoneyToPlayer;