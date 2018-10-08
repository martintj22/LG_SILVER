_injuryArray = ["head","face_hub","neck","body","spine1","arms","leg","pelvis","hands"];
_currentHitLocation = _this select 1;
_source = _this select 2;


[3] spawn client_fnc_bleed;

if(_currentHitLocation IN _injuryArray) then {
	_myInjuries = player getVariable "playerInjuries";
	_currentHitNumber = _injuryArray find _currentHitLocation;
	_mychance = round (random 2);
	_injuryLevel = (_myInjuries select _currentHitnumber) + _myChance;
	if(_injuryLevel > 4) then { _injuryLevel = 4; };
	_myInjuries set [_currentHitNumber, _injuryLevel];

	if(_currentHitLocation == "Body") then {
		_chance = round (random 50);
		if(_chance < 3) then {
			_organDamage = round (random 4);
			_myInjuries set [9, _organDamage];
		};
	};

	_chance = round (random 1000);
	if(_chance < 2) then {
		_disease = round (random 4);
		_myInjuries set [10, _disease];
	};




	if(_currentHitLocation IN ["Head","face_hub","neck"] && _source != player) then {
		["Remove",0.25,_source,1] spawn Client_Fnc_DoHealth;
		[35] spawn client_fnc_bleed;
	};

	if(_currentHitLocation IN ["body","spine1"] && _source != player && uniform player != "nopixel_character_swat") then {
		[25] spawn client_fnc_bleed;
	};

	if(_currentHitLocation IN ["leg","pelvis","hands"] && _source != player && uniform player != "nopixel_character_swat") then {
		[10] spawn client_fnc_bleed;
	};


	player setVariable ["playerInjuriesToUpdate",_myInjuries,false];

	if(myUpdate) then {
		[] spawn client_fnc_doInjuriesUpdate;
	};



};



