_quantity = _this select 0;
_item = _this select 1;
_totalprice = _this select 2;
_type = _this select 3;
_shopcontent = _this select 4;

//shopcontent wasnt updating properly here for some reason, may be fixed now, dno.
player setvariable ["shopcontent",_shopcontent,false];
shopcontent = _shopcontent;

[format["Someone bought %1 of %2 for %3 - it has been added to your Bank - you lost %4 to taxes.",_quantity, _item, _totalprice call client_fnc_numberText,  (_totalPrice-(_totalPrice/(1+taxRate/100))) call client_fnc_numberText], true] spawn domsg;

[_totalprice,true,true] call Client_fnc_addMoneyToBank;
["govtBank", _totalPrice-(_totalPrice/(1+taxRate/100)), "Add"] remoteExec["server_fnc_setValue",2];
["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, (_totalPrice-(_totalPrice/(1+taxRate/100))) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];