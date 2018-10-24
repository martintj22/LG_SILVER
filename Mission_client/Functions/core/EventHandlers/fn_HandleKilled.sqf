params [["_unit", objNull, [objNull]], ["_killer", objNull, [objNull]], ["_length", 0, [0]], ["_headshot", 0, [0]]];

disableSerialization;

if(deadplayer) exitwith {};

{ detach _x; } forEach (attachedObjects _unit);

deadPlayer = true;
attachedplayer = false;
inGameUISetEventHandler ["Action", "true"];

for [{_x=1},{_x<=25},{_x=_x+1}] do {   
 
	[] call client_Fnc_huddamaged; 
 
};

cutText ["YOU HAVE BEEN PARALYZED. YOU MAY TALK, BUT NOT MOVE.","PLAIN"];

[_unit] remoteExec ["server_fnc_requestMedic", 2];

[_unit, vehicle _unit, _headshot] spawn {
	params["_unit","_vehicle","_headshot"];
	private["_anim"];
	
	if(_vehicle != _unit) then {
		
		_unit action ["Eject", _vehicle];
		waitUntil { vehicle _unit == _unit;  }; 

		sleep 1; 

		for [{_x=1},{_x<=10},{_x=_x+1}] do { 
			[] call KK_fnc_forceRagdoll; 
			sleep 0.1;
			if(animationState _unit == "unconscious") exitWith{}; 
		};

	} else {

		for [{_x=1},{_x<=10},{_x=_x+1}] do { 
			[] call KK_fnc_forceRagdoll; 
			sleep 0.1;
			if(animationState _unit == "unconscious") exitWith{}; 
		};

	};

	waitUntil {animationstate _unit != "unconscious"};
	
	if(_headshot == 1) then {
		_anim = selectRandom [
			"UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C"
		];
	} else {
		_anim = selectRandom [
			"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C",
			"UnconsciousReviveBody_A","UnconsciousReviveBody_B",
			"UnconsciousReviveDefault_A","UnconsciousReviveDefault_B",
			"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"
		];
	};

	[_unit, _anim] remoteExec["switchMove"];

	while{true} do {
		sleep 1;

		_unit setOxygenRemaining 1;

		if (round(maxTime - time) > 0) then {
			hintSilent parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>Respawn</t><br/>You may respawn in %1",[(maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
		} else {
			hint "";
		};

		if(deadPhase == 1 && animationState player != _anim ) then { [_unit, ""] remoteExec["switchMove"]; [_unit, _anim] remoteExec["switchMove"]; sleep 5; };
		if(deadPhase == 2 && animationState player != "UnconsciousReviveDefault" ) then { [_unit, ""] remoteExec["switchMove"]; [_unit, "UnconsciousReviveDefault"] remoteExec["switchMove"]; sleep 5; };

		if(!deadPlayer) exitwith {
			[_unit, "UnconsciousOutProne"] remoteExec["switchMove"];
		};
	};
};


TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 3;
["OnSpeakVolume", _unit, [_unit, TF_speak_volume_meters]] call TFAR_fnc_fireEventHandlers;
_unit setVariable ["tf_voiceVolume", 0.3, true];

im_dead = true;
imRestrained = false;
_unit setVariable ['surrender', nil, false];

_length = 15 - _length;
_length = round(_length);
if(_length > 11) then { _length = 11; };
if(_length < 5) then { _length = 5; };
if(!(myJob IN ['Cop','EMS','doc'])) then {
	client_respawn_timer = _length;
} else {
	client_respawn_timer = 5;
};

_unit setVariable["dead",true,true];

_playerkill = false;
_killdistance = round ((_unit distance _killer) * 10) / 10;
_killweapon = (configfile >> "CfgWeapons" >> currentWeapon _killer >> "displayName") call BIS_fnc_getCfgData;
_killmagazine = currentMagazine _killer;
_fuck = name _killer;
_fuck2 = [getplayeruid _killer, 7] call CBA_fnc_substr;
_you = name _unit;

if(_fuck != _you) then {
	if(_fuck find "Error: " > -1) then {
		[getpos _unit, "News", "Vehicle Accident"] remoteexec ["server_fnc_giveTask",2];
		
		["You have been downed because of an unknown reason.", false] spawn domsg; 
		shooting_death = false;

		["death", format["%1 (%2) was downed because of an unknown reason.", name _unit, getplayeruid _unit]] remoteExec ["server_fnc_log",2];
	} else {
		[getpos _unit, "News", "Shooting"] remoteexec ["server_fnc_giveTask",2];
		if(_headshot == 1) then { 
			[format["%1 (%2) headshotted and downed you at a distance of %3m with a(n) %4.", _fuck, _fuck2, _killdistance, _killweapon], false] spawn domsg;  
		} else { 
			[format["%1 (%2) downed you at a distance of %3m with a(n) %4.", _fuck, _fuck2, _killdistance, _killweapon], false] spawn domsg; 
		};

		["Add","Karma",random(125),"Stress"] remoteexec ["client_fnc_sustain",_killer];

		_GroundWeaponHolder = createVehicle["Land_Magazine_rifle_F", getPosATL _killer, [], 0, "CAN_COLLIDE"];

		_nearPlayers = [];
		{ _nearPlayers pushBack (name _x); if(count _nearPlayers > 5) exitWith {}; } forEach nearestObjects[_killer,["Man"],50];
		_nearPlayers = _nearPlayers call BIS_fnc_arrayShuffle;

		_GroundWeaponHolder setVariable ["evidenceInformation", [_killer, name _killer, getplayeruid _killer, _unit, name _unit, getplayeruid _unit, _killweapon, currentMagazine _killer, _killdistance, _nearPlayers, 1], true];


		[_killer, _GroundWeaponHolder] spawn {
			params["_killer","_GroundWeaponHolder"];
			uiSleep 120;
			if(isNull _GroundWeaponHolder) exitWith {};			
							
			if(count currentDetectives > 0) then {
				_nearest = currentDetectives apply {[player distance getPos _x, _x]};
				_nearest sort true;
				_nearest = (_nearest select 0) select 1;

				[getPos _killer, "Homicide","Location",currentDetectives] remoteExec ["client_fnc_hudHelper", _nearest];
				[format["Dispatch to %1: There has been a homicide at %2.", _nearest getVariable "badgeNumber", mapGridPosition getPos _killer], true] remoteExec ["domsg", currentDetectives];
			};
		};


		_playerkill = true;
		shooting_death = true;

		IF(isNil "savedGear") then { savedGear = []; };

		if(myjob IN ["Cop","EMS","doc"]) then {
			
		} else {
			savedGear = getunitloadout _unit;

			[_unit, "getunitloadout", savedGear] remoteExec ["Server_fnc_setVariable",2];

		};

		["death", format["%1 (%2) was downed by %3 (%4) at a distance of %5m using a(n) %6.", name _unit, getplayeruid _unit, name _killer, getplayeruid _killer, _killdistance, _killweapon]] remoteExec ["server_fnc_log",2];


		
	};
} else {
	shooting_death = false;
	
	[getpos _unit, "News", "Unknown Death"] remoteexec ["server_fnc_giveTask",2];
	["You have been downed because of an unknown reason.", false] spawn domsg; 

	["death", format["%1 (%2) was downed because of an unknown reason.", name _unit, getplayeruid _unit]] remoteExec ["server_fnc_log",2];
};

[] spawn {
	sleep 10;
	0 cutFadeOut 5;
	deadPhase = 1;
	
	while { deadPlayer } do { [] spawn Client_fnc_huddamaged; uisleep (5+round(random 10));  };
};

_unit spawn
{
	private["_RespawnBtn","_Timer"];
	disableSerialization;
	maxTime = time + (client_respawn_timer * 60);
	waitUntil {round(maxTime - time) <= 0 OR isNull _this};
	createdialog "deathscreen";
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_RespawnBtn ctrlEnable true;
	(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == (_this select 1)) then {true}"];
	_Timer ctrlSetText "Your timer has run out. Press respawn in order to wake up at the Hospital.";
	"colorCorrections" ppEffectEnable true;     
	"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 1.0], [0, 0, 0, 1],  [0, 0, 0, 0.0]];  
	"colorCorrections" ppEffectCommit 5; 
	if(!deadplayer) exitwith { closedialog 0; };
	if(shooting_death && round(maxTime - time) <= 0) exitwith { 
		closeDialog 0; 
		[] call client_fnc_startFresh; 
	};			
};

[_unit] spawn
{
	params ["_unit"];
	while { deadPlayer } do { uisleep 0.05; };
	sleep 1;
	_unit setVariable["dead",nil,true];
	imrestrained = false;
};

_unit setdamage 0; 