disableSerialization;

_betamt = 100;
_cashcheck = [1,_betamt] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_betamt call client_fnc_numberText], true] spawn domsg; };	

[_betamt] call Client_fnc_removeCash;


_message = ctrlText 9331;
if(_message == "Enter Advertisement Message, Keep it short.") exitwith { ["You must enter a valid message.", true] spawn domsg;  };
closedialog 0;
sleep 0.05;

[format["%1: %2",name player,_message],false] remoteexec ["domsg",-2];
