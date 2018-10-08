// lets pat down CurrentCursorTarget;

/*
	Repurposed for strip search
*/
params["_returnkeys","_myJob"];

if(deadplayer || player getVariable["dead",FALSE]) exitwith {};

private["_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps"];



_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, 1337] call TFAR_fnc_SetChannelFrequency;

_safeItems = ["FirstAidKit","ItemMap","ItemCompass","ItemWatch"];
_weps = [];
_all = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;
_assItems = assignedItems player;
_invItems = items player;
_weapons = weapons player;

{
	_temp = _x;
	{
		if(!(_x in _weapons) && !(_x in _safeItems)) then
		{
			_all pushBack _x;
			
		};
	}forEach _temp;

} forEach [_assItems,_invItems];

_mags = magazinesAmmoFull player;
{player removeMagazine _x} foreach (magazines player);

if(primaryWeapon player != "") then
{
	_weps pushBack (primaryWeapon player);
	player removeWeapon (primaryWeapon player);

};
		
if(secondaryWeapon player != "") then
{
	_weps pushBack (secondaryWeapon player);
	player removeWeapon (secondaryWeapon player);

};
		
if(handgunWeapon player != "") then
{
	_weps pushBack (handgunWeapon player);
	player removeWeapon (handgunWeapon player);
};

{
	_items = _x;
	{
		player unassignItem _x;
		player removeItem _x;
	}forEach _items;
	
}forEach [_hgItems, _pwItems, _swItems, _all];

{
	if (!(_x in _safeItems)) then
	{
		player removeWeapon _x;
		_weps pushBack _x;
	};

}forEach (weapons player);


 _holder = createVehicle [ "GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
 
{
	_holder addWeaponCargoGlobal [_x,1];
}forEach _weps;

{
	_holder addMagazineCargoGlobal [_x select 0,1];
}forEach _mags;

{
	_items = _x;
	{
		_holder addItemCargoGlobal [_x,1];
	}forEach _items;
}forEach [_hgItems, _pwItems, _swItems, _all];

player say3D "Patdown";

_uniform = uniform player; 
_vest = vest player; 
_back = backpack player; 

[_uniform,_vest,_back] spawn {
	_uniform = _this select 0;
	_vest = _this select 1;
	_back = _this select 2;
	removeBackpackglobal player;
	uiSleep 0.25;
	removeVest player;
	uiSleep 0.25;
	removeUniform player;
	uiSleep 2;
	player forceAddUniform _uniform;
	uiSleep 0.5;
	player addVest _vest;
	uiSleep 0.5;
	player addBackpackglobal _back;
};

_new = player getVariable "cashinhand";	

[player, "cashinhand", _new] remoteExec ["Server_fnc_setVariable",2]; 

_loadout = getunitloadout player; 

[player,1,getplayeruid player,name player,_loadout] remoteExec ["server_fnc_steppedsync",2]; 

lastforcesync = time;


[current_cars] remoteexec ["client_fnc_givekeys",_returnkeys];

if(count licenseArray > 0) then {
	[format["You found ID and it says %1.",name player], true] remoteExec["domsg", _returnkeys];
} else {
	["This person does not seem to have any ID.", true] remoteExec["domsg", _returnkeys];
};

_GroundWeaponHolder = createVehicle["Land_FilePhotos_F", getPosATL _killer, [], 0, "CAN_COLLIDE"];

_nearPlayers = [];
{ _nearPlayers pushBack (name _x); if(count _nearPlayers > 5) exitWith {}; } forEach nearestObjects[player,["Man"],50];
_nearPlayers = _nearPlayers call BIS_fnc_arrayShuffle;

_daGun = (configfile >> "CfgWeapons" >> currentWeapon _returnkeys >> "displayName") call BIS_fnc_getCfgData;

_GroundWeaponHolder setVariable ["evidenceInformation", [_returnkeys, name _returnkeys, getplayeruid _returnkeys, player, name player, getplayeruid player, _daGun, currentMagazine _returnkeys, 0, _nearPlayers, 2], true ];

[player, _GroundWeaponHolder] spawn {
	params["_player","_GroundWeaponHolder"];
	uiSleep 120;
	if(isNull _GroundWeaponHolder) exitWith {};

	if(count currentDetectives > 0) then {
		_nearest = currentDetectives apply {[_player distance getPos _x, _x]};
		_nearest sort true;
		_nearest = (_nearest select 0) select 1;

		[getPos _player, "Robbery","Location", currentDetectives] remoteExec ["client_fnc_hudHelper", _nearest];
		[format["Dispatch to %1: There has been a robbery at %2.", _nearest getVariable "badgeNumber", mapGridPosition getPos _player], true] remoteExec ["domsg", currentDetectives];
	};

};
