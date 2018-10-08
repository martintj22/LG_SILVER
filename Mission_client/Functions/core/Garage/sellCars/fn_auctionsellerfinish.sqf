_amount = _this select 0;
_purchasefrom = _this select 1;
_car = _this select 3;
_information = _this select 2;

_pia = current_cars FIND _car;
current_cars DELETEAT _pia;

_garage = player getvariable "garage";
_pia = _garage FIND _information;
_garage DELETEAT _pia;

player setvariable ["garage",_garage,false];

["You just sold a car!", true] spawn domsg;

_amount = _amount;

[_amount,true,true] call Client_fnc_addMoneyToBank;