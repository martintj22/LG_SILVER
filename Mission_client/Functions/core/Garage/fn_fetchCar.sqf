/*
_textures = getArray(configfile >> "cfgivorytextures" >> "textures"); ["%1",_textures, true] spawn domsg;
[this] call ivory_fnc_initVehicle;
    This will randomize the color of the body, ceteris paribus.
    This will turn the car into Matte Olive Green with White rims and 100% tint on windows and 50% tint on lights.
[this] call ivory_fnc_setLicense;
vehspawned = createVehicle ["ivory_r34", getpos player, [], 0, "NONE"];
[vehicle player, "nopixel"] call ivory_fnc_setLicense;
[vehicle player, ["white","matte"], "white", 1, 1] call ivory_fnc_initVehicle;

 license, class, color, finish, rims, windows, lights, statuses, owner 


*/

_currentitemindex = lbCurSel 1500;
if (_currentitemindex == -1) exitWith {};
_car = lbData [1500, _currentitemindex];

lbDelete [1500, _currentitemindex];

_car = call compile format["%1", _car]; 

if((_this select 0) == 1) exitwith { 
	_vehicle = _car createvehicle getpos player; 
	_vehicle allowdamage false; 
	[_vehicle] call client_fnc_spawnvehicle;
	_vehicle allowdamage true;
	Current_Cars pushBack _vehicle;

	_random = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","Y","U","V","W","X","Y","Z"];

	_cost = 0;

	if(myJob == "Legal") then {
		if(typeOf _vehicle == "ivory_isf_1") then {

			[_vehicle, "ivory_isf_slcs"] remoteExec ["ivory_fnc_initVehicle",2];

		};
	};

	if(myJob == "Mobster") then {
		if(typeOf _vehicle IN ["ivory_m3_2","VVV_Cadillac_CTSV"]) then {

			[_vehicle, "ivory_m3_cvc", "default", 0.5, 0.5] remoteExec ["ivory_fnc_initVehicle",2];

		};
	};

	if(myJob == "Mafia") then {
		if(typeOf _vehicle IN ["ivory_c_2","VVV_Aston_Martin_1964_DB5","VVV_Bentley_Arnage"]) then {

			[_vehicle, ["black","glossy"], "default", 0.5, 0.5] remoteExec ["ivory_fnc_initVehicle",2];

		};
	};

	if(Mayor) then {
		if(typeOf _vehicle IN ["shounka_limo_civ_noir"]) then {

			[_vehicle, ["black","glossy"]] remoteExec ["ivory_fnc_initVehicle",2];

		};
	};
	
	if(myJob == "Cop") then {
		_cost = 50;
		_vehicle setVariable ["pdCar", format["UNIT %1%2", player getVariable "badgeNumber", selectRandom _random], true];
		lastGovtUseCar = time + 1200;
	};

	if(myJob == "doc") then {
		_cost = 50;
		_vehicle setVariable ["docCar", format["UNIT %1%2", player getVariable "badgeNumber", selectRandom _random], true];
		lastGovtUseCar = time + 1200;
	};

	if(myJob == "EMS") then {
		_cost = 50;
		_vehicle setVariable ["emsCar", format["UNIT %1%2", player getVariable "badgeNumber", selectRandom _random], true];
	};

	if( typeOf _vehicle in ["B_UAV_01_F","B_Static_Designator_01_F"] ) then { 
		createVehicleCrew _vehicle; 
	}; 

	if( _vehicle isKindOf "Car") then {
		_vehicle addItemCargoGlobal ["CG_wheel", 3];
		
		if(myJob IN ["Cop","doc"]) then {
			_vehicle addItemCargoGlobal ["np_woodbarrierlongpolice",4];
			_vehicle addItemCargoGlobal ["np_WoodBarrierShortPoliceLightsOn",4];
			_vehicle addItemCargoGlobal ["np_TrafficConeOrange",4];
		};

		if(myJob IN ["EMS"]) then {
			_vehicle addItemCargoGlobal ["np_WoodBarrierLongRed",4];
			_vehicle addItemCargoGlobal ["np_WoodBarrierShortRedLightsOn",4];
			_vehicle addItemCargoGlobal ["np_TrafficConeRed",4];
		};

	};


	if(_cost > 0) then {
		[format["The government paid %1 for that vehicle.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, (_cost) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
	};

	closedialog 0;
};

_numberPlate = _car select 0;
_className = _car select 1;
_carColor = _car select 2;
_carFinish = _car select 3;
_wheelColor = _car select 4;
_windowTint = _car select 5;
_headlightTint = _car select 6;
_status = _car select 7;
_carowner = _car select 8;


closeDialog 0;
_garage = player getVariable "garage";

{
	if((_x select 0) == _numberplate) then { _garage deleteat _foreachindex; };
} foreach _garage;

player setVariable ["garage", _garage, false];

_vehicle = _classname createVehicle [(getpos player) select 0,(getpos player) select 1,((getpos player) select 2) + 200];

waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowdamage false;

//changing the vehicle to non-impounded
if(_status == 0) then { 
	[_numberPlate,1,_vehicle,player] remoteExec ["Server_fnc_updateCarStatus",2];
	_car SET [7,1];
};


[_vehicle, "information", _car] remoteExec ["Server_fnc_setVariable",2];
_vehicle setvariable ["information",_car,false];

[_vehicle, _carColor, _carFinish, _wheelColor, _windowTint, _headlightTint, _className, _numberPlate] spawn {
	params["_vehicle", "_carColor", "_carFinish", "_wheelColor", "_windowTint", "_headlightTint", "_className", "_numberPlate"];
	uiSleep 1;

	if (_vehicle isKindOf "Car") then {

		if (str _className find "vory_" > -1 || str _className find "vv_" > -1 || str _className find "VV_" > -1 ) then {
			[_vehicle, [_carColor,_carFinish], _wheelColor, _windowTint, _headlightTint] remoteExec ["ivory_fnc_initVehicle",2];
			[_vehicle, _numberPlate] remoteExec ["ivory_fnc_setLicense",2];
		};

		if (str _className find "onzie_" > -1 || str _className find "adm_" > -1  || str _className find "ADM_" > -1 ) then {
			[_vehicle, [_carColor,_carFinish]] remoteexec ["client_fnc_initVehicle",2];
			[_vehicle, _numberPlate, "jonzie"] remoteexec ["client_fnc_numberPlate",2];
		};

		if (str _className find "nopixel_" > -1 ) then {
			[_vehicle, [_carColor,_carFinish]] remoteexec ["client_fnc_initVehicle",2];
		};
	};
};

[_vehicle] call client_fnc_spawnvehicle;
_vehicle allowdamage true;
Current_Cars pushBack _vehicle;
[getPlayerUID player, "usedgarage", Current_Cars] remoteExec ["Server_fnc_setVariable",2];
_vehicle animate["spoiler", (_vehicle getVariable "information" select 9)];