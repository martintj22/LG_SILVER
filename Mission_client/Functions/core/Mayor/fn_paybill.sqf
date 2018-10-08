disableSerialization;
_quantity = ctrlText 9339;
_quantity = call compile format["%1", _quantity];
if(_quantity > 1000000) exitWith { ["You cannot spend more than $1,000,000.00!", true] spawn domsg; };
if(_quantity < 0) exitWith { };
[format["You have succesfully spent %1 and the transaction has been logged.",_quantity call client_fnc_numberText], true] spawn domsg;

["govtBank", format["Mayor %1 (%2) spent %3 of government money.", name player, getplayeruid player, _quantity call client_fnc_numberText]] remoteExec["server_fnc_log",2];

["govtBank", _quantity, "Remove"] remoteExec["server_fnc_setValue",2];

closeDialog 0;