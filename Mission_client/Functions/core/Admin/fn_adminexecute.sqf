_target = call compile format["%1",(lbData[1500,(lbCurSel 1500)])]; 
_statementsent = call compile format["%1",(lbData[1501,(lbCurSel 1501)])];

if (_statementsent == 1) then {
	(vehicle player) allowdamage false;
	(vehicle player) setposatl getposatl (vehicle _target);
	uisleep 1;
	(vehicle player) allowdamage true;
};

if (_statementsent == 2) then {
	godmode = true;
	(vehicle _target) setposatl getposatl (vehicle player);
	uisleep 1;
	godmode = false;
};

if(_statementsent == 3) then {
	[missionNamespace, ["godmode", true]] remoteExec ["setVariable", _target];
};

if(_statementsent == 4) then {
	[missionNamespace, ["godmode", false]] remoteExec ["setVariable", _target];
};

if(_statementsent == 5) then {
	[_target,true] remoteExec ["hideobjectglobal", 2]; 
	_target setvariable ["admingod",true,true];
};

if(_statementsent == 6) then {
	[_target,false] remoteExec ["hideobjectglobal", 2]; 
	_target setvariable ["admingod",nil,true];
};

if(_statementsent == 7) then {
	["Remove",1,_target] remoteExec ["Client_Fnc_DoHealth", _target]; 
};

if(_statementsent == 8) then {
	[] remoteExec ["server_fnc_statsaveloop", 2]; 
};

if(_statementsent == 9) then {
	if(_target == player) exitWith {};
	{
		godMode = true;

		if(vehicle player != player) then {
			player action ["Eject", vehicle player];
		};

		lastPositionAdmin = getpos player;
		disableuserinput true;

		player setpos [9756.69,788.971,0.00144315];
		
		cutText ["YOU HAVE BEEN FROZEN BY AN ADMINISTRATOR.","BLACK OUT"]; 

	} remoteExec ["bis_fnc_spawn", _target];
};

if(_statementsent == 10) then {
	if(_target == player) exitWith {};
	{
		disableuserinput false;

		godMode = false;

		0 cutFadeOut 0;

		player setpos lastPositionAdmin;

		lastPositionAdmin = nil;

	} remoteExec ["bis_fnc_spawn", _target];
};

if(_statementsent == 11) then {
	removeAllItems _target;
	removeAllContainers _target;
	removeAllWeapons _target;
	removeAllAssignedItems _target;
	removeUniform _target;
	removeVest _target;
	removeBackpack _target;
	removeGoggles _target;
	removeHeadgear _target;
	[_target] spawn client_fnc_destroyGroundHolders;
};

if(_statementsent == 12) then {

};

if(_statementsent == 13) then {
	[] remoteExec ["client_fnc_fullheal", _target]; 
	[missionNamespace, ["bleedingEffect",0]] remoteExec ["setVariable", _target]; 
};

if(_statementsent == 14) then {
	if(_target getvariable ["dead",false]) then {
		[_target] remoteExec ["client_fnc_revived", _target]; 
		[] remoteExec ["client_fnc_fullheal", _target]; 
		[missionNamespace, ["bleedingEffect",0]] remoteExec ["setVariable", _target]; 
	};
};

if(_statementsent == 15) then {
	if(vehicle _TARGET != _target) then {
		[(vehicle _TARGET)] spawn client_fnc_moveIn;
	};
};

if(_statementsent == 16) then {
	{ player action ["Eject", vehicle player]; } remoteExec["bis_fnc_spawn", driver (vehicle _target)];
};

if(_statementsent == 16) then {
	_target = driver (vehicle _target);
	[_target] remoteExec ["client_fnc_revived", _target]; 
};

if(_statementsent == 17) then {
	private["_crew"];
	_crew = crew (vehicle _target);
	_veh = (vehicle _target);
	{
		[_x] remoteExec ["client_fnc_pulloutVeh",_x];
	} foreach _crew;
};

if(_statementsent == 18) then {
	if(isNil "adminESP") then { adminESP = false; player setvariable ["admin",false,true]; };
	if(!adminESP) exitwith { player setvariable ["admin",true,true]; adminESP = true; client_ID_PlayerTags = ["client_PlayerTags","onEachFrame","client_fnc_adminESP"] call BIS_fnc_addStackedEventHandler;  };
	if(adminESP) exitwith { player setvariable ["admin",nil,true]; adminESP = Nil; ["client_PlayerTags", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; };
};

if(_statementsent == 19) then {
	_units = nearestObjects [player, ["Man"], 300];
	_loadout = getunitloadout player;
	{
		[_x,_loadout] remoteExec ["setunitloadout",_x];
	} foreach _units - [player];
};

if(_statementsent == 20) then {
	_units = nearestObjects [player, ["Man"], 300];
	{
		[_x,getpos player] remoteExec ["setPOS",_x];
	} foreach _units - [player];
};

if(_statementsent == 21) then {
	_units = nearestObjects [player, ["Man"], 300];
	{
		if(_x getvariable ["dead",false]) then {
			[_x] remoteExec ["client_fnc_revived",_x];
			[] remoteExec ["client_fnc_fullheal", _x]; 
			[missionNamespace, ["bleedingEffect",0]] remoteExec ["setVariable", _x]; 
		};
	} foreach _units - [player];
};

if(_statementsent == 22) then {
	{
		[_x] remoteExec ["client_fnc_revived",_x];
		[] remoteExec ["client_fnc_fullheal", _x]; 
		[missionNamespace, ["bleedingEffect",0]] remoteExec ["setVariable", _x]; 
	} foreach allplayers;
};

if(_statementsent == 23) then {
	params ["_veh"];
	_veh = vehicle _target;
	_locked = locked _veh;
	if(_locked == 2 || _locked == 3) then 
	{
		_veh lock 0;
	} 
		else 
	{
		_veh lock 2;
	};
};

if(_statementsent == 24) then {
	if(isNil "Ghosting") then { Ghosting = false; };
	if(!Ghosting) exitwith {
		Ghosting = true;
		while{Ghosting} do {
			if(vehicle _target == _target) then {
				if(player IN (attachedobjects _target)) then { sleep 3; } else { player attachTo [_target, [0, 0, 1] ]; sleep 5; };
			};

			if(vehicle _target != _target) then {
				if(player IN (attachedobjects vehicle _target)) then { sleep 3; } else { player attachTo [vehicle _target, [0, 0, 1] ]; sleep 5; };
			};
		};
	};
	if(Ghosting) exitwith { detach player; Ghosting = False;};
};

if(_statementsent == 25) then {
	["Sign_Circle_F"] remoteExec ["client_fnc_createvehicle",-2];
};


if(_statementsent == 26) then {
	if(isNil "LoggedIn") then { LoggedIn = false; };
	if(!LoggedIn) exitwith { 
		onMapSingleClick "if (loggedIn) then {vehicle player setPos _pos};";
		LoggedIn = true;
	};
	if(LoggedIn) exitwith { LoggedIn = False; };
};

if(_statementsent == 27) then {
	["Sign_Circle_F"] remoteExec ["client_fnc_createvehicle",_TARGET];
};

if(_statementsent == 28) then {
	{vehicle player setDamage 0;} remoteExec ["bis_fnc_spawn",_target];
};

if(_statementsent == 29) then {
	{ _vehicle = vehicle player; if (_vehicle isKindOf "Air" || _vehicle isKindOf "Car" || _vehicle isKindOf "Boat") then { vehicle player setDamage 1; }; } remoteExec ["bis_fnc_spawn",_target];
};

if(_statementsent == 30) then {
	closedialog 0; 
	sleep 2;
	["Open", true] call bis_fnc_arsenal;
};

if(_statementsent == 32) then {
	closedialog 0; 
	sleep 1;
	createDialog "RscDisplayDebugPublic";
};

if(_statementsent == 33) then {
	closedialog 0; 
	sleep 1;
	createDialog "RscDisplayDebugPublic";
	sleep 1;
	ctrlSetText [12284, format["{ 







} remoteExec ['bis_fnc_spawn', %1];",_target] ]; 

};

if(_statementsent == 34) then {
	{
		[_x, nil, true] spawn BIS_fnc_moduleLightning;
	} remoteExec["bis_fnc_spawn", _target];

};