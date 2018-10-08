_shop = currentcursortarget;
_pos = getpos _shop;
_stolen = 0;
_amount = 0;

if(count currentcop < 4) exitwith { ["Ikke nok politi, ingen sjov!", true] spawn domsg; };

if(_shop getVariable["robbing",FALSE]) exitwith { ["Someone is robbing this store!", true] spawn domsg; }; 

if(isNil "robbedStores2") then { robbedstores2 = []; rs2modifier = 0; };

if(_shop IN robbedstores2) exitwith { ["This shop has nothing left for you!", true] spawn domsg; };

_shop setvariable ["robbing",true,true];
rs2modifier = rs2modifier + 1;
if(rs2modifier > count currentcop) then { rs2modifier = count currentcop; };


_counter = 0;
_distpolice = round((player distance [8263.31,3011.19,0.00143814]) / 2000);

if(_distpolice < 2) then { _distpolice=2; };

_failure = false;

[player] remoteexec ["server_fnc_robberyCall",2];

if(count currentCop > 3) then {
	_nearest = currentCop apply {[player distance getPos _x, _x]};
	_nearest sort true;
	_nearest = (_nearest select 0) select 1;

	[_pos, "Store Robbery", "Location", currentCop-currentMarshals-currentDetectives] remoteExec ["client_fnc_hudHelper", _nearest];
	[format["Dispatch to %1: There is a store robbery at %2.", _nearest getVariable "badgeNumber", mapGridPosition _pos], true] remoteExec ["domsg", currentCop-currentMarshals-currentDetectives];
};

while{true} do {
	_dist = player distance _shop;
	if ((player getVariable["dead",FALSE]) || currentWeapon player == "" || currentWeapon player == "Binocular" || currentWeapon player == "Rangefinder" || _dist >= 10) exitwith { _failure = true; };
	sleep 2;
	_stolen = random(10) + _counter;
	[_stolen,false,true] call Client_fnc_addMoneyToPlayer; 
	["Add","Karma",random(3),"Stress"] call client_fnc_sustain;
	_counter = _counter + 0.1;
	if((_distpolice - _counter) < 0.2) exitwith {}; 
};

robbedstores2 pushback _shop; 

if(!_failure) then {
	_amount =  (rs2modifier * _counter) * random(500);
	_amount = _amount + ((count currentcop) * 3);
	[_amount,false,true] call Client_fnc_addMoneyToPlayer; 
	[format["You just robbed this store for %1",(_amount+_stolen) call client_fnc_numberText], true] spawn domsg;

} else { 
	[format["You just robbed this store for %1",_stolen call client_fnc_numberText], true] spawn domsg;
};

if(count currentCop > 3) then {
	_nearest = currentCop apply {[player distance getPos _x, _x]};
	_nearest sort true;
	_nearest = (_nearest select 0) select 1;

	[_pos, "Store Robbery [FLED]", "Location", currentCop-currentMarshals-currentDetectives] remoteExec ["client_fnc_hudHelper", _nearest];
	[format["Dispatch to %1: The suspect of the store robbery at %2 has fled the scene.", _nearest getVariable "badgeNumber", mapGridPosition _pos], true] remoteExec ["domsg",currentCop-currentMarshals-currentDetectives];
};

_shop setvariable ["robbing",nil,true];

if(robbedstores2 isEqualto []) then {
	[] spawn { uisleep 600; robbedstores2 = []; rs2modifier = 0; };
};

if(_amount > 10 || _stolen > 10) then {

	_GroundWeaponHolder = createVehicle["Land_Money_F", getPosATL player, [], 0, "CAN_COLLIDE"];

	_nearPlayers = [];
	{ _nearPlayers pushBack (name _x); if(count _nearPlayers > 5) exitWith {}; } forEach nearestObjects[player,["Man"],50];
	_nearPlayers = _nearPlayers call BIS_fnc_arrayShuffle;

	_daGun = (configfile >> "CfgWeapons" >> currentWeapon player >> "displayName") call BIS_fnc_getCfgData;

	_GroundWeaponHolder setVariable ["evidenceInformation", [player, name player, getplayeruid player, _shop, getText(configFile >> "cfgVehicles" >> typeOf _shop >> "displayName"), "", _daGun, currentMagazine player, 0, _nearPlayers, 3], true ];

	[player, _GroundWeaponHolder] spawn {
		params["_player","_GroundWeaponHolder"];
		uiSleep 120;
		if(isNull _GroundWeaponHolder) exitWith {};
	
		if(count currentDetectives > 0) then {
			_nearest = currentDetectives apply {[_player distance getPos _x, _x]};
			_nearest sort true;
			_nearest = (_nearest select 0) select 1;

			[getPos _GroundWeaponHolder, "Store Robbery","Location", currentDetectives] remoteExec ["client_fnc_hudHelper", _nearest];
			[format["Dispatch to %1: There has been a store robbery at %2.", _nearest getVariable "badgeNumber", mapGridPosition getPos _GroundWeaponHolder], true] remoteExec ["domsg", currentDetectives];
		};
	};
	
};