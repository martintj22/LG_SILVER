disableSerialization;
_quantity = ctrlText 9339;
_quantity = call compile format["%1", _quantity];

_cashcheck = [1,_quantity] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_quantity call client_fnc_numberText], true] spawn domsg; };
if((((player getvariable "statuses") select 13) - _quantity) < 0) exitwith { ["You can not pay for tax you do not have.", true] spawn domsg; };

(player getvariable "statuses") set [13, ((player getvariable "statuses") select 13) - _quantity]; 

[_quantity] call Client_fnc_removeCash;

["You have paid for your tax.", true] spawn domsg;

closeDialog 0;