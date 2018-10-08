params["_vehicle"];
private["_pos"];

deletevehicle _vehicle;

[2500,true,true] call Client_fnc_addMoneyToPlayer;

["Vehicle has been returned, you are awarded $2,500.00", true] spawn domsg;