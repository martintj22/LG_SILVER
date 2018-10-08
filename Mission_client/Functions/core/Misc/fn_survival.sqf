/*
Survival Koil
*/

[] spawn {
	[player, "govtbank"] remoteExec ["client_fnc_getremotevar",2];
	waitUntil { !isNil "packet"; };
	_govtbank = packet;
	packet=nil;

	if(isNil "paycheck") then { paycheck = 0; };

	if(!taskrunning || myJob IN ['Mafia','Mobster','Biker']) then {

		if(Mayor || Senator) then {

			_random = random [0,0.5,1];
			
			paycheck = 35 + paycheck + _random;

			if(Mayor) then { _addition = 10 + _random; paycheck = paycheck + (22*_addition); };
			if(Senator) then { _addition = 10 + _random; paycheck = paycheck + (20*_addition); };

			[format["You received a government check for %1 and also %2 tax payable.", paycheck call client_fnc_numberText, (paycheck*(taxRate/100)) call client_fnc_numberText], false] spawn domsg;

			["add","Karma",1,"Default"] call client_fnc_sustain;


		} else {
			_random = random [0,0.5,1];

			paycheck = 35 + paycheck + _random;

			[format["You received an unemployment check for %1 and also %2 income tax payable.", paycheck call client_fnc_numberText, (paycheck*(taxRate/100)) call client_fnc_numberText], false] spawn domsg;

			["add","Karma",1,"Default"] call client_fnc_sustain;
		};
		
		
		


	} else {

		_random = random [0,0.5,1];

		if(myJob == "EMS") then { _addition = player getvariable "EMS"; _addition = _addition + _random; paycheck = paycheck + (16*_addition); };
		if(myJob == "Cop") then { _addition = player getvariable "Cop"; _addition = _addition + _random; paycheck = paycheck + (16*_addition); };
		if(myJob == "doc") then { _addition = player getvariable "doc"; _addition = _addition + _random; paycheck = paycheck + (16*_addition); };
		if(myJob == "Legal") then { _addition = player getvariable "legal"; _addition = _addition + _random; paycheck = paycheck + (18*_addition); };
		if(myJob == "DA") then { _addition = player getvariable "DA"; _addition = _addition + _random; paycheck = paycheck + (18*_addition); };

		_level_default = (client_level_array select 0);
		_level_default = round((_level_default / 10) + 175);

		if(extracash > 0) then {
			_level_default = _level_default + 150;
		};

		if (paycheck > _level_default) then { paycheck = _level_default; };

		paycheck = 55 + paycheck;

		_govJobs = ["DA","Legal","doc","Cop","EMS"];

		if(_govtbank < 100000 && myjob IN _govJobs) then {
			_rate = 0.85;
			paycheck = paycheck * _rate;
			[format["You received a government check for %1 instead of %2 because of low funds and also %3 income tax payable.", paycheck call client_fnc_numberText, (paycheck/_rate) call client_fnc_numberText, ((paycheck)*(taxRate/100)) call client_fnc_numberText], false] spawn domsg;
		} else {
			[format["You received a government check for %1 and also %2 income tax payable.", paycheck call client_fnc_numberText, (paycheck*(taxRate/100)) call client_fnc_numberText], false] spawn domsg;
		};

		["add","Karma",1,"Default"] call client_fnc_sustain;
		
	};


	["govtBank", (paycheck/10), "Remove"] remoteExec["server_fnc_setValue",2]; // remove paycheck from government
	["govtBank", format["%1 (%2) removed %3 into the Government bank account because of salary.", name player, getplayeruid player, (paycheck/10) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
	[paycheck,true,true] call Client_fnc_addMoneyToBank; // add paycheck to player

	(player getvariable "statuses") set [13, call compile ([((player getvariable "statuses") select 13) + paycheck*(taxRate/100), 1, 2, false] call CBA_fnc_formatNumber) ]; // add unpaid tax

	paycheck = 0;
};


AllowJob = true;
if( client_marijuana > 0 || client_cocaine > 0 || client_meth > 0 || client_heroin > 0  || client_energy > 0 || client_drunk > 0 || extraCash > 0 ) then { 

	if( client_marijuana > 10 || client_cocaine > 10 || client_meth > 10 || client_heroin > 10  || client_energy > 0 || client_drunk > 10 ) then { 
		_chance = random (5);
		if (_chance > 3 && vehicle player == player) then { [] spawn KK_fnc_forceRagdoll; };
	};

	["Remove","drug",1] call client_fnc_sustain;

	["Remove","Karma",5,"Stress"] call client_fnc_sustain;
};

["Remove","Drink",0.75] call client_fnc_sustain; 
["Remove","Food",0.75] call client_fnc_sustain;

if( (client_hunger <= 50 && client_hunger >= 25) || (client_thirst <= 50 && client_thirst >= 25) ) then { 
	[7] spawn client_fnc_HudElements;		
	playSound3D ["cg_sndimg\sounds\cough1.ogg", player, false, getPosASL player, 3, 1, 45]; 
};

if( (client_hunger < 25 && client_hunger >= 0) || (client_thirst < 25 && client_thirst >= 0) ) then { 
	[7] spawn client_fnc_HudElements;	
	playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];
};	

if(!ClientArrested) then { 
	_chance = round (random 100);
	if(_chance > 35) then {
		["Add","Karma",1,"Default"] call client_fnc_sustain;
	};	
_chance = round (random 100);
	if(_chance > 35) then {	
		["Remove","Drink",2] call client_fnc_sustain; 
	};
	_chance = round (random 100);
	if(_chance > 35) then {		
		["Remove","Food",2] call client_fnc_sustain;
	};
	_chance = round (random 100);
	if(_chance > 25 && vehicle player == player) then {		
		["Remove","battery",2] call client_fnc_sustain;
	};
};

if (!paintballing) then {
	[player, "getunitloadout", getunitloadout player] remoteExec ["Server_fnc_setVariable",2];
};

if(!(isNil "getLicensePerson")) then { getLicensePerson = nil; };
acceptBail = [];

[player] remoteExec ["Server_fnc_wantedListMine",2];

{
	_garage = player getVariable "garage";
	_information = _x getVariable "information";

	if(!isnil "_information") then {
		_license = _information select 0;
		_newdamage = ((getAllHitPointsDamage _x) select 2);
		_newfuel = fuel _x;
		_information SET [10,_newfuel];
		_information SET [11,_newdamage];
		[_newdamage,_newfuel,_license] remoteexec ["server_fnc_updateCarDamages",2];
	};
} forEach current_cars;