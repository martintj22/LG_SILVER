private["_vehicle"];

_vehicle = _this select 0;

if(isNil "Attachedcar") then {
	attachedcar = true;
};
attachedcar = true;

_vehicle attachTo [player, [0, 2.5, 3.5]]; 
if(_vehicle iskindof "SHIP") then {
	_vehicle attachTo [player, [0, 4.5, 5.5]]; 
};

_vehicle setdir 90;

[_vehicle, getpos player] spawn {
	params["_vehicle","_pos"];

	waitUntil { sleep 1; getPos player distance _pos > 250 || vehicle player != player};
	
	[] spawn client_fnc_detach;
};

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;


if(str CurrentCursorTarget find 'otros' < 0 && str CurrentCursorTarget find 'garaje' < 0 && str CurrentCursorTarget find 'tallerdepinturaabandonado' < 0 && str CurrentCursorTarget find 'hangar' < 0 && str CurrentCursorTarget find 'embarcadero' < 0) exitWith {};

_vehiclename = getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");

_totalTickets = 0;
_handle = false;
if(isNil "wantedTimer") then { wantedTimer = time-301; };
if (time >= wantedTimer + 300 && count currentMarshals > 0) then {
	
     if( ((player getVariable 'statuses') select 13 >= 1000) || myTickets > 2000 || myWarrants > 0) then {

		_nearest = currentMarshals apply {[player distance getPos _x, _x]};
		_nearest sort true;
		_nearest = (_nearest select 0) select 1;

		[getPos player, format["Spotted Wanted Person with a(n) %1", _vehiclename], "Location", currentMarshals] remoteExec ["client_fnc_hudHelper", _nearest];
		wantedTimer = time;
		[format["Dispatch to %1: A wanted person has been spotted at %2 taking out a(n) %3.", _nearest getVariable "badgeNumber", mapGridPosition getPos player, _vehiclename], true] remoteExec ["domsg",currentMarshals];
		
    };
};