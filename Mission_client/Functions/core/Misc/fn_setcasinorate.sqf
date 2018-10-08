disableSerialization;
_quantity = ctrlText 9339;
_quantity = call compile format["%1", _quantity];
if(_quantity > 200) then { _quantity = 200; };
if(_quantity < 0) then { _quantity = 0; };

["casinoRate", _quantity, "None", true] remoteExec["server_fnc_setValue",2];