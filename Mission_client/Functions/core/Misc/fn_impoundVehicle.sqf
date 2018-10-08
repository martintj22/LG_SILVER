params["_vehicle", ["_type",0]];

if(myjob == "towtruck") then { 


	paycheck = paycheck + 500;

	if(currentcursortarget getVariable ["requestImpound", false]) then {
		paycheck = paycheck + 300;
		[ format["You received %1 bonus because this vehicle was requested to be impounded.", 300 call client_fnc_numberText] , false ] spawn domsg;
	};

	_level_check = (client_level_array select 4);
	_amount = 0;
	if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 5; };
	if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 3; };
	if(_level_check > 599) then { _amount = _level_check / 2; };

	_amount = round(_amount);
	["add","Karma",2,"Tow Truck Driver"] call client_fnc_sustain;
	if(_amount > 0) then {
		if(_amount > 150) then { _amount = 150; };
		[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText] , false ] spawn domsg;	
		[_amount,true,true] call Client_fnc_addMoneyToPlayer;
	};

	if(count ( _vehicle getvariable ["information", []] ) > 0) then {

		_targetid = (_vehicle getvariable "information" select 8);
		_targetowner = _targetid call BIS_fnc_getUnitByUid;

		if(isNull(_targetowner)) then {
			_targetowner = "John Doe";
		} else {
			_targetowner = name _targetowner;
		};

		[_targetowner, _targetid, name player, getplayeruid player, "Impounded vehicle", 2, 0, 1, 1000] remoteexec ["server_fnc_addcriminal",2];
		[_targetid, format["Your %1 was impounded because of a traffic violation. Go to the impound lot to retrieve it. You must also pay the impound fee at the court house.", getText(configFile >> "cfgVehicles" >> typeOf currentcursortarget >> "displayName")], "Silver Lake", "Impounded Car"] remoteExec ["server_fnc_sendMail",2];

	};

	["who cares",0,currentcursortarget,player] remoteExec ["Server_fnc_updateCarStatus",2];  

	["You have impounded that vehicle and have been paid.", true] spawn domsg;

} else { 

	if(count currenttowtruckdrivers == 0 || _type == 1) then {

		if(count ( _vehicle getvariable ["information", []] ) > 0) then {

			_targetid = (_vehicle getvariable "information" select 8);
			_targetowner = _targetid call BIS_fnc_getUnitByUid;

			if(isNull(_targetowner)) then {
				_targetowner = "John Doe";
			} else {
				_targetowner = name _targetowner;
			};

			[_targetowner, _targetid, name player, getplayeruid player, "Impounded vehicle", 2, 0, 1, 1000] remoteexec ["server_fnc_addcriminal",2];
			[_targetid, format["Your %1 was impounded because of a traffic violation. Go to the impound lot to retrieve it. You must also pay the impound fee at the court house.", getText(configFile >> "cfgVehicles" >> typeOf currentcursortarget >> "displayName")], "Silver Lake", "Impounded Car"] remoteExec ["server_fnc_sendMail",2];

		};

		["who cares",0,currentcursortarget,player] remoteExec ["Server_fnc_updateCarStatus",2];  

		["The car has been impounded.", true] spawn domsg;


	} else {
		
        _nearest = currenttowtruckdrivers apply {[player distance getPos _x, _x]};
        _nearest sort true;
        _nearest = (_nearest select 0) select 1;

        [getPos player, format["Impound Requested %1", name player], "Location", currenttowtruckdrivers] remoteExec ["client_fnc_hudHelper", _nearest];
        wantedTimer = time;
        [format["Dispatch to %1: %2 has requested impound at %3.", name _nearest, name player, mapGridPosition getPos player], true] remoteExec ["domsg", currenttowtruckdrivers];

		["A dispatch has been sent to all tow truck drivers.", true] spawn domsg;

		currentcursortarget setVariable ["requestImpound", true, true];

	};

 };

