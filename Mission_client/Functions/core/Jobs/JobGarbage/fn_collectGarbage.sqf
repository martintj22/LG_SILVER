private["_oldBinDir","_oldBinPos"];
_veh = vehicle player;
_type = _this select 0;

if(_type == "dump") then {

	_veh setfuel 0;
	_veh animate ['contenedor_unhide',1];
	_veh animate ['contenedor',1];
	_veh animate ['tapacontenedor',1];
	sleep 3;
	_veh animate ['contenedor',0];
	_veh animate ['tapacontenedor',0];
	sleep 3;
	_veh animate ['contenedor_unhide',0];
	sleep 3;
	_veh animate ['pala',0];
	_veh animate ['hidraulicos',0];
	_veh animate ['hidraulicos2',0];
	sleep 1;
	_veh animate ['porton',1];
	_veh animate ['basura_unhide',1];
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;

	_level_check = (client_level_array select 5);
	if(_level_check > -1 && _level_check < 300) then { 	sleep 7; };
	if(_level_check > 299 && _level_check < 600) then { sleep 5; };
	if(_level_check > 599) then { sleep 3; };


	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	sleep 2;
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
	_veh animate ['porton',0];

	_level_check = (client_level_array select 5);
	if(_level_check > -1 && _level_check < 300) then { 	sleep 7; };
	if(_level_check > 299 && _level_check < 600) then { sleep 5; };
	if(_level_check > 599) then { sleep 3; };

	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	sleep 1;
	_veh animate ['basura_unhide',0];
	_veh setfuel 1;

};


if(mybin distance (vehicle player) < 25 && _type == "bin") then {
	(vehicle player) setVelocity [0, 0, 0];
	_isBinSelected = mybin;
	_oldBinPos = getpos _isBinSelected;
	_oldBinDir = getdir _isBinSelected;

	[_isbinselected,50,25] spawn client_fnc_hideobjectnear;



	paycheck = paycheck + 35;

	if(_veh == player) exitwith {};
		
	_veh setfuel 0;
	_veh animate ['contenedor_unhide',1];
	_veh animate ['contenedor',1];
	_veh animate ['tapacontenedor',1];
	sleep 3;
	_veh animate ['contenedor',0];
	_veh animate ['tapacontenedor',0];
	sleep 3;
	_veh animate ['contenedor_unhide',0];
	sleep 3;
	_veh animate ['pala',0];
	_veh animate ['hidraulicos',0];
	_veh animate ['hidraulicos2',0];
	sleep 1;
	_veh animate ['porton',1];
	_veh animate ['basura_unhide',1];
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
	_level_check = (client_level_array select 5);
	if(_level_check > -1 && _level_check < 300) then { 	sleep 7; };
	if(_level_check > 299 && _level_check < 600) then { sleep 5; };
	if(_level_check > 599) then { sleep 3; };
	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	sleep 2;
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
	_veh animate ['porton',0];
	_level_check = (client_level_array select 5);
	if(_level_check > -1 && _level_check < 300) then { 	sleep 7; };
	if(_level_check > 299 && _level_check < 600) then { sleep 5; };
	if(_level_check > 599) then { sleep 3; };
	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	_veh animate ['basura_unhide',0];
	_veh setfuel 1;

	} else {

	["There is no garbage near you!", true] spawn domsg;	

};
