if ( !(0 IN licensearray) ) exitWith { ["You must have a Driver's License.", false] spawn domsg; };

createDialog "garage";

ctrlSetText [1000, "Garage"];

_garage = player getVariable "garage";

{
	_class = _x select 1;
	_vehicleName = [_class] call Client_fnc_getVehicleName;
	_Color = _x select 2;
	_colorName = getText(configFile >> "cfgIvoryTextures" >> _Color >> "displayname");
	_license = _x select 0; 
	_availability = _x select 7;
	if(_availability == 0) then {
		_veh = lbAdd [1500, format["%1 %2 [%3]", _colorName, _vehicleName, toUpper(_license)] ];
		lbSetData [1500, _veh, format["%1",Str(_x)]];
	};
}forEach _garage;

lbSetCurSel [1500, 0];
