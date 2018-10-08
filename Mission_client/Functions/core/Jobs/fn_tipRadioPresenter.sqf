//serverRadios = [99.1,99.2,99.3,99.4,99.5];

_cashcheck = [1,50] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",50 call client_fnc_numberText], true] spawn domsg; };	
[50] call Client_fnc_removeCash;
[player] remoteexec ["client_fnc_finishPayRadioPresenter",mycallowner];