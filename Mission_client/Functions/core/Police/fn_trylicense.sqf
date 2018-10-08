_price = _this select 1;
_cashcheck = [1,_price] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_price call client_fnc_numberText], true] spawn domsg; };	

["Add","license",_this select 0] call client_fnc_sustain;

[_price] call Client_fnc_removeCash;
["govtBank", _price, "Add"] remoteExec["server_fnc_setValue",2];
["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

closedialog 0;