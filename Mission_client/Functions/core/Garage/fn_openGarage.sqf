params["_object"];
private["_type"];

if (str _object find "tallerdepinturaabandonado" > -1 || str _object find "otros" > -1 || str _object find "garaje" > -1) then { 
	createdialog "garageplates"; 
	_type = "Car";
};

if (player distance myhouse < 30) then { 
	createdialog "garage"; 
	_type = "Car";
};

if (str _object find "hangar" > -1 ) then { 
	createdialog "garage"; 
	_type = "Air";
};

if (str _object find "embarcadero" > -1 ) then { 
	createdialog "garage"; 
	_type = "Ship";
};


ctrlSetText [1000, "Garage"];

_garage = player getVariable "garage";

{
	_class = _x select 1;
	_vehicleName = [_class] call Client_fnc_getVehicleName; 
	_Color = _x select 2;
	_colorName = getText(configFile >> "cfgIvoryTextures" >> _Color >> "displayName");
	_license = _x select 0;
	_availability = _x select 7;
	if(_availability == 1) then {

		if (_class isKindOf "Air" && _type == "Air") exitWith {
			_veh = lbAdd [1500, format["%1",  _vehicleName] ];
			lbSetData [1500, _veh, format["%1",Str(_x)]];
		}; 

		if (_class isKindOf "Ship" && _type == "Ship") exitWith {
			_veh = lbAdd [1500, format["%1", _vehicleName] ];
			lbSetData [1500, _veh, format["%1",Str(_x)]];
		};

		if (_class isKindOf "Car" && _type == "Car") exitWith {
			_veh = lbAdd [1500, format["%1 %2 [%3]", _colorName, _vehicleName, toUpper(_license)] ];
			lbSetData [1500, _veh, format["%1",Str(_x)]];
		};
	};
}forEach _garage;

lbSetCurSel [1500, 0];



