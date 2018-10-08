params ["_ct"];

_pia = Current_Cars find _ct;
Current_Cars deleteAt _pia;

_garage = player getVariable "garage";
_information = _ct getVariable "information";

if(!isnil "_information") then {
	_license = _information select 0;
	_newdamage = ((getAllHitPointsDamage _ct) select 2);
	_newfuel = fuel _ct;
	_information SET [10,_newfuel];
	_information SET [11,_newdamage];
	[_newdamage,_newfuel,_license] remoteexec ["server_fnc_updateCarDamages",2];

	_garage pushBack _information;

	player setVariable ["garage", _garage, false];

	[getPlayerUID player, "usedgarage", current_cars] remoteExec ["Server_fnc_setVariable",2];
	
};

deleteVehicle _ct;