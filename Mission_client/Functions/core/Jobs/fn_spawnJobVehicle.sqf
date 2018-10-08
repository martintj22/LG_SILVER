if(!taskrunning) exitwith {};

if(!isNil "vehspawned") then {
	if(!isNull vehspawned) then {
		_players = crew (vehspawned);
		if(count _players == 0) then {

			{ 
					detach _x;
					deletevehicle _x; 
			} forEach attachedObjects vehspawned;
			
			deletevehicle vehspawned;
		};
	};
};

[10] call Client_fnc_removeBank;
["You have been charged $10.00 for renting a Job Vehicle.", true] spawn domsg;

_jobType = myjob;

if (_jobType == "Mafia") exitwith {
	vehspawned = createVehicle ["VVV_Bentley_Arnage", [0,0,(random(500) + 3)], [], 0, "NONE"];	
	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
};

if (_jobType == "Mobster") exitwith {
	vehspawned = createVehicle ["VVV_Bentley_Arnage", [0,0,(random(500) + 3)], [], 0, "NONE"];	
	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
};

if (_jobType == "Biker") exitwith {
	vehspawned = createVehicle ["Acj_Harley_Davidson_Sons_Of_Anarchy", [0,0,(random(500) + 3)], [], 0, "NONE"];	
	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
};

if (_jobType == "Wood Logging") exitwith {
	vehspawned = createVehicle ["jonzie_log_truck", [0,0,(random(500) + 3)], [], 0, "NONE"];
	[vehspawned] spawn client_fnc_spawnvehicle;
	[vehspawned, ["white","Glossy"]] remoteexec ["client_fnc_initVehicle",2];
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["TRYK_OVERALL_SAGE",1];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "mail") exitwith {

	_level_check = (client_level_array select 1);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["nopixel_fedex", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["nopixel_fedex_1", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["nopixel_fedex_2", [0,0,(random(500) + 3)], [], 0, "NONE"]; };


	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["G_Uniform_worker_l",1];	
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "trashman") exitwith {	
	vehspawned = createVehicle ["nopixel_garbageTruck", [0,0,(random(500) + 3)], [], 0, "NONE"];	
	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["G_Uniform_worker_l",1];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "repairman") exitwith {	

	_level_check = (client_level_array select 7);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["nopixel_mrfixit", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["nopixel_mrfixit_1", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["nopixel_mrfixit_2", [0,0,(random(500) + 3)], [], 0, "NONE"]; };

	[vehspawned, ["white","Glossy"]] spawn client_fnc_initVehicle;
	[vehspawned] spawn client_fnc_spawnvehicle;	
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["TRYK_OVERALL_SAGE",1];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "security") exitwith {

	_level_check = (client_level_array select 2);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["np_rs4_security", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["np_isf_security", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["np_isf_security", [0,0,(random(500) + 3)], [], 0, "NONE"]; };

	[vehspawned] spawn client_fnc_spawnvehicle;
	[vehspawned] remoteexec ["client_fnc_ivoryInitVehicle",2];
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["vvv_character_agente_473",1];
	["You have some items in the truck, use them.", true] spawn domsg;
};

if (_jobType == "towtruck") exitwith {

	_level_check = (client_level_array select 4);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["jonzie_tow_truck", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["jonzie_tow_truck_1", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["jonzie_tow_truck_2", [0,0,(random(500) + 3)], [], 0, "NONE"]; };

	[vehspawned] spawn client_fnc_spawnvehicle;
	[vehspawned, ["white","Glossy"]] remoteexec ["client_fnc_initVehicle",2];
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["TRYK_OVERALL_SAGE",1];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "NewsMan") exitwith {	

	_level_check = (client_level_array select 6);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["nopixel_news_van_original", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["nopixel_news_van_original_1", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["nopixel_news_van_original_2", [0,0,(random(500) + 3)], [], 0, "NONE"]; };

	[vehspawned] spawn client_fnc_spawnvehicle;
	clearmagazinecargoGlobal (vehspawned);
	current_cars pushback vehspawned; uisleep 1;

	vehspawned addWeaponCargo ["Press_Cam_F",2];
	_microphone = ["Press_Mic_AAN_F", "Press_Mic_BBC_F", "Press_Mic_CNN_F", "Press_Mic_ARD_F", "Press_Mic_ZDF_F"] call BIS_fnc_selectRandom;
	vehspawned addWeaponCargo [_microphone,2];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "taxi") exitwith {	

	_level_check = (client_level_array select 9);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["ivory_190e_taxi", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["ivory_rs4_taxi", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["shounka_limo_civ_noir", [0,0,(random(500) + 3)], [], 0, "NONE"]; };

	[vehspawned] spawn client_fnc_spawnvehicle;
	[vehspawned] remoteexec ["client_fnc_ivoryInitVehicle",2];
	current_cars pushback vehspawned; uisleep 1;
	vehspawned addItemCargo ["np_shirt_8",1];
	["You have some items in the truck, use them!", true] spawn domsg;
};

if (_jobType == "cropdusting") exitwith {	
	vehspawned = createVehicle ["sab_grob109", [0,0,(random(500) + 3)], [], 0, "NONE"];
	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
};

if (_jobType == "bus") exitwith {	

	_level_check = (client_level_array select 9);
	if(_level_check > -1 && _level_check < 300) then { vehspawned = createVehicle ["a3l_bus", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 299 && _level_check < 600) then { vehspawned = createVehicle ["acj_bus", [0,0,(random(500) + 3)], [], 0, "NONE"]; };
	if(_level_check > 599) then { vehspawned = createVehicle ["acj_bus", [0,0,(random(500) + 3)], [], 0, "NONE"]; };


	vehspawned = createVehicle ["acj_bus", [0,0,(random(500) + 3)], [], 0, "NONE"];

	[vehspawned] spawn client_fnc_spawnvehicle;
	current_cars pushback vehspawned; uisleep 1;
};