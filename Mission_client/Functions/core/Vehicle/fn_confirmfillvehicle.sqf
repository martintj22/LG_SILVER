disableserialization;
private["_vehicle","_car","_mycash","_curFuel"];
_currentitemindex = lbCurSel 1500;
if (_currentitemindex == -1) exitWith {};
_car = lbData [1500, _currentitemindex];
_vehicle = call compile format["%1", _car]; 
_pos = _vehicle select 1;
_vehicle = _vehicle select 0;

_vehicles = nearestObjects [_pos, ["Car","Air","Ship"], 7];

{
	if(typeof _x == _vehicle) exitwith { _vehicle = _x; };
}foreach _vehicles;

if(isEngineOn _vehicle) exitWith { ["The car must be turned off to fill the gas.", true] spawn domsg; };
if(player IN _vehicle) exitWith { ["You cannot be inside the car to start refilling it.", true] spawn domsg; };

_startpos = getpos _vehicle;
closedialog 0;
_total = 0;
_price = 13.34;
while {true} do {
	_cashcheck = [1,_price] call client_fnc_checkmoney;
	if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!", _price call client_fnc_numberText], true] spawn domsg; };

	_curFuel = fuel _vehicle;
	_total = _total + _price;
	
	_vehicle setFuel (_curFuel + 0.05);
	
	if(_curFuel > 0.99 || isEngineOn _vehicle || _vehicle distance _startpos >= 5) exitwith { 
		if(isEngineOn _vehicle) then { ["Refuelling canceled due to the car being turned on.", true] spawn domsg; };
		
		[format["Vehicle has been refilled and it cost you %1.",_total call client_fnc_numberText], true] spawn domsg; 
		[_total] call Client_fnc_removeCash;
	};

	uisleep 0.25;
};

[_vehicle, fuel _vehicle] remoteExec["setFuel"];