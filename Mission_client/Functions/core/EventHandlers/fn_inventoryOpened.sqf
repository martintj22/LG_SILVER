private["_container","_unit","_handle"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
handle = false;

if(isNil "globalProtection") then { globalProtection = 0; };

if(imrestrained || globalProtection != 0 || deadPlayer) exitwith {
	handle = true;
	handle;
};

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) exitWith {
	handle = true;
	handle;
};

[] spawn
{
	uiSleep 0.05;
	waituntil {!(isnull (finddisplay 602)) || handle };
	if(!handle) then {
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call client_fnc_fuckyoucgandprorpandothershitmods"];  
		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call client_fnc_fuckyoucgandprorpandothershitmods"];  
		((findDisplay 602) displayCtrl 640) ctrlSetEventHandler ["LBDblClick", "_this call client_fnc_fuckyoucgandprorpandothershitmods"];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call client_fnc_fuckyoucgandprorpandothershitmods"];
	}; 
};


[] spawn
{
	waituntil {!(isnull (finddisplay 602)) || handle };
	if(!handle) then {
		while {true} do
		{
			if(!isNull (findDisplay 49)) exitwith {
				closedialog 0;
				sleep 0.25;
				closedialog 0;
			};
			if(!isNull (findDisplay 602)) exitwith {
			};
			sleep 0.05;
		};
	};
};

//prevent multiple people using the same container, prevents dooping of shops and housing.


_varcontainer = _container getvariable "antidupecontainer";

//if the variable exists, we know someones using it, so we close it.
if( ( _container != player || _container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" ) && !(isNil "_varcontainer") ) exitwith {

	["This container is being used.", false] spawn domsg;

	//if somehow we broke it and we are the owner, we will reset it and allow access again. Just incase lag or dbl click breaks something.

	if((_container getvariable "antidupecontainer") == player) then { _container setvariable ["antidupecontainer",nil,true]; };

	if(isNull (_container getvariable "antidupecontainer")) then { _container setvariable ["antidupecontainer",nil,true]; };

	if(_container distance (_container getvariable "antidupecontainer") > 10) then { 0 remoteexec ["closedialog",_varcontainer]; _container setvariable ["antidupecontainer",nil,true]; };

	handle = true;
	handle;

};

if( ( _container != player || _container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" ) && (isNil "_varcontrainer") ) then {

	_container setvariable ["antidupecontainer",player,true];
	savedcontainer = _container;

	[] spawn { 

		waituntil {!(isnull (finddisplay 602))};
		while{true} do {

			uisleep 0.05;

			if(isNull (findDisplay 602)) exitwith {
				//we have closed the inventory or it closed itself. Reset the variable to reallow access to other users.
				savedcontainer setvariable ["antidupecontainer",nil,true];
			};

			//just incase both get it at the same time. Another player is somehow the owner of the crate.
			if( (savedcontainer getvariable "antidupecontainer") != player) exitwith { closedialog 0; savedcontainer setvariable ["antidupecontainer",nil,true]; };

			//if for some reason the variable is reset by another player while inside the crate.
			if( isNull (savedcontainer getVariable "antidupecontainer") ) exitwith { closedialog 0; savedcontainer setvariable ["antidupecontainer",nil,true]; };
		};
	};

};


if(_container isKindOf "Car" && {(locked _container) == 2}) exitWith {
	if(!(_container in current_cars)) then {
		["You're not allowed to open the vehicles inventory while it's locked.", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "Ship" && {(locked _container) == 2}) exitWith {
	if(!(_container in current_cars)) then {
		["You're not allowed to open the vehicles inventory while it's locked.", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "Air" && {(locked _container) == 2}) exitWith {
	if(!(_container in current_cars)) then {
		["You're not allowed to open the vehicles inventory while it's locked.", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "LandVehicle" && {(locked _container) == 2}) exitWith {
	if(!(_container in current_cars)) then {
		["You're not allowed to open the vehicles inventory while it's locked.", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "MotorCycle" && {(locked _container) == 2}) exitWith {
	if(!(_container in current_cars)) then {
		["You're not allowed to open the vehicles inventory while it's locked.", false] spawn domsg;
	handle = true;
	handle;
	};
};

