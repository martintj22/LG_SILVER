params["_car"];

if!(_car isKindOf "Car" || _car isKindOf "Air" || _car isKindOf "Boat") exitWith { ["You have to be inside the vehicle to start repairing it.", true] spawn domsg; };
if(driver _car != player) exitWith { ["You have to be the driver to start repairing the vehicle.", true] spawn domsg; };
if(isEngineOn _car) exitWith { ["The vehicle must be turned off to fill the gas.", true] spawn domsg; };

_price = 1000;
_cashcheck = [1,_price] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!", _price call client_fnc_numberText], true] spawn domsg; };

_check = ['Repairing',15,0,getPosATL player,0,player,'cg_sndimg\sounds\repair.ogg'] spawn client_fnc_dotask;

waitUntil { scriptDone _check };

if (!client_dotask) exitWith {};

_car setDamage 0;

[_price] call Client_fnc_removeCash;

["Your car has been fully repaired.", true] spawn domsg;