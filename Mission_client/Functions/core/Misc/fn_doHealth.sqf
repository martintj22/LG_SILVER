/*
Handle Health Changes by Koil
*/
if(deadPlayer) exitwith {};	

params [["_adjust", "", [""]], ["_amount", 0, [0]], ["_source", objNull, [objNull]],["_headshot", 0, [0]]];
_change = false;

if(_adjust == "Add") then {
	myHealth = myHealth - _amount;
	if(_amount > 0.1) then {
		[6] spawn Client_fnc_HudElements;	
	};	
};
if(_adjust == "Remove") then {
	myHealth = myHealth + _amount; 
	/*
	if(_amount > 0.1) then {
		[5] spawn Client_fnc_HudElements;
	};
	*/
};

if(_adjust == "Set") then {
	[6] spawn Client_fnc_HudElements; 
	myHealth = _amount;
	if(_amount == 0) then {
		if(isNil "bleedingEffect") then { bleedingEffect = 0; };
		if(bleedingEffect > 10) then { bleedingEffect = bleedingEffect - 5; };
	};
};

if(myHealth < 0) then { myHealth = 0; };

_myStatuses = player getvariable "statuses";
_myStatuses set [5, myHealth]; 
player setVariable ["statuses",_mystatuses,false];

if((lastsync + 120) < time || myhealth > 0.99) then {
	lastsync = time; 
	[player, "statuses", (player getvariable "statuses")] remoteExec ["Server_fnc_setVariable",2];
};

if(myHealth > 0.99) exitwith { 
	if(Myhealth > 1.8) then { myHealth = 1.8; };
	_damage = myHealth - 1;
	_damage = _damage * 10;
	[] spawn client_fnc_hudhealth;
	[] spawn client_fnc_hudeffects;
	[player,_source,_damage,_headshot] spawn Client_fnc_HandleKilled;
};

if((damage player) != myhealth && myhealth < 0.2) then {
	player setdamage myHealth;
};


[] spawn client_fnc_hudhealth;
[] spawn client_fnc_hudeffects;