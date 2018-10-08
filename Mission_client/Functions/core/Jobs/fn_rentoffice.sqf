disableSerialization;
_shopname = ctrlText 9339;

_cashcheck = [1, 500] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",250 call client_fnc_numberText], true] spawn domsg; };	

if(count _shopname > 35) exitWith { ["Office name can not be longer than 35 characters.", false] spawn domsg; };

[getpos currentcursortarget,player,_shopname] remoteexec ["server_fnc_rentoffice",2];