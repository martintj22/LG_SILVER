params["_target"];
_price = 3000;

_cashcheck = [1,_price] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_price call client_fnc_numberText], true] spawn domsg; };	

[_price] call Client_fnc_removeCash;

[player] remoteexec ["client_fnc_trackingme",_target]; 
_target setvariable ["tracking",true,false];