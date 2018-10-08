_price = parseNumber (ctrlText 1111);
closeDialog 0;
if(isNil "_price") exitwith { ["No Price", true] spawn domsg; };
if(_price < 1) exitwith { ["No Price", true] spawn domsg; };

_car = currentcursortarget getvariable "information";
if(isNil "_car") exitwith { ["You cant sell this car", true] spawn domsg; };
_seller = player;
_licensePlate = _car select 0;
_information = _car;

if (currentcursortarget in current_cars) then {
    currentcursortarget setvariable ["sale",[_price,_seller,_licensePlate,_information],true];
    currentcursortarget setvariable ["salecheck",true,true];
} else {
    ["You do not own this car!", true] spawn domsg;
};