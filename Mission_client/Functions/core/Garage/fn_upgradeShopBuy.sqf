_price = 0;

_index = lbCurSel (1500);
_status = lbData[1500, _index];
_SELECTEDVEHICLE = call compile format["%1", _status];
_GarageSelection = _selectedvehicle select 1;
_license = _GarageSelection select 0;



_index = lbCurSel (1501);
_color = lbData[1501, _index];
_color = call compile format["%1", _color];


_index = lbCurSel (1502);
_status = lbData[1502, _index];
_finish = call compile format["%1", _status];
_pricePaint = _finish select 1;
_finish = format["%1",(_finish select 0)];

if((_garageselection select 3) find _finish > -1 && _color == _garageselection select 2) then {
	_price = 0;
} else {
	_price = _price + _pricepaint;
};

_index = lbCurSel (1503);
_status = lbData[1503, _index];
_windows = call compile format["%1", _status];

_index = lbCurSel (1504);
_status = lbData[1504, _index];
_lights = call compile format["%1", _status];

_index = lbCurSel (1505);
_status = lbData[1505, _index];
_WHEELS = call compile format["%1", _status];

_index = lbCurSel (1506);
_status = lbData[1506, _index];
_spoiler = call compile format["%1", _status];

if(_windows != _garageselection select 5) then { _price = _price + 1000; };
if(_lights != _garageselection select 6) then { _price = _price + 1000; };	
if(_wheels != _garageselection select 4) then { _price = _price + 1000; };	

_cashcheck = [1,_price] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_price call client_fnc_numberText], true] spawn domsg; };	

[_price] call Client_fnc_removeCash;

closedialog 0;

_garage = player getvariable "garage";

_pia = _garage FIND _garageselection;

(_garage select _pia) SET [4,_wheels];
(_garage select _pia) SET [5,_windows];
(_garage select _pia) SET [6,_lights];
(_garage select _pia) SET [3,_finish];
(_garage select _pia) SET [2,_color];
(_garage select _pia) SET [9,_spoiler];

player setvariable ["garage",_garage,false];

_plate = _garageselection select 0;

[_windows,_lights,_wheels,_finish,_color,_garage,_plate,player,_spoiler] REMOTEEXEC ["SERVER_FNC_UPGRADEVEHICLEPARTS",2];

["Vehicle has been updated.", true] spawn domsg;

