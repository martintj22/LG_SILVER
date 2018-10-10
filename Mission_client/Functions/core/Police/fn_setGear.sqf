params["_type"];


_freq = 0;

[player, "govtbank"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };

currentDetectives = currentDetectives - [player];
currentMarshals = currentMarshals - [player];

publicVariable "currentDetectives";
publicVariable "currentMarshals";

if(_type == "uav") exitwith {
	player addWeapon "B_UavTerminal";
};

if(_type == "mwater") exitwith {
	player adduniform "U_B_Wetsuit";
	player addGoggles "G_B_Diving";
	player addvest "V_RebreatherB";
};

if(_type == "water") exitwith {
	player adduniform "U_B_Wetsuit";
	player addvest "V_RebreatherB";
	player addGoggles "G_B_Diving";
	player addweapon "arifle_SDAR_F";
	player addmagazine "20Rnd_556x45_UW_mag";
	player addmagazine "20Rnd_556x45_UW_mag";
};

if(_type == "emspilot") exitwith {
	player adduniform "RF_EMS_1";
	player addheadgear "H_PilotHelmetHeli_B";
};

if(_type == "coppilot") exitwith {
	player adduniform "RF_WING_3";
	player addheadgear "H_PilotHelmetHeli_B";
};



lastGovtUseWeapon = time + 1200;

if(myjob == "Cop") then {


	removeAllItems player;
	removeAllContainers player;
	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;	

	_level = player getVariable "cop";

	// commissioner
	if(_level == 10) then { 
		player forceAddUniform "vvv_traje_policia_3";		
	};	

	if(_level == 9) then { 
		player forceAddUniform "U_007_US_Police_officer";
		player addHeadgear "H_007_policecap";
	};	

	// patrol bureau
	if(_type == "patrol") then {

		_freq = 33.3;

		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		if (_level == 5) then { 
			player addBackpack "AM_POLICEBELT";
		} else {
			player addBackpack "AM_PoliceBelt"; 
		};


		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

		if(packet > 100000) then {

			player additemtobackpack "RH_uspm";

			for "_i" from 1 to 6 do {player addItemToBackPack "RH_16Rnd_40cal_usp"; };
			for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
			for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
			{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		} ELSE {
			player additemtobackpack "RH_g17";

			for "_i" from 1 to 5 do {player addItemToBackPack "RH_17Rnd_9x19_g17"; };
			for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
			for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
			{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		};

		player addweapon "taser";
		player addweapon "cg_baton";
		player addWeapon "Binocular";

		if(female) then { 
			if(_level == 1) then {
				player forceAddUniform "female_police2";
			};
			if(_level == 2) then {				
				player forceAddUniform "female_police2";
			};				
			if(_level == 3) then {				
				player forceadduniform "female_police2"; 
				player addHeadgear "Campaign_Hat_Light"; 
			};
			if(_level == 4) then {				
				player forceadduniform "female_police2";
				player addHeadgear "Campaign_Hat_Light"; 
			};
			if(_level == 5) then { 
			player forceadduniform "EF_M_jkt4"; 
				player addVest "EF_BSF"; 
				player addheadgear "H_Hat_brown";
				player removeweapon "cg_baton";
				player additemtobackpack "Press_Mic_CNN_F";
				currentDetectives pushBack player;
				publicVariable "currentDetectives";
			};
			if(_level == 6) then {
				player forceadduniform "female_police2"; 
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 7) then {				
				player forceAddUniform "female_police3";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 8) then {
				player forceAddUniform "female_police3";
				player addHeadgear "Campaign_Hat_Dark"; 
			};

		} else { 
			if(_level == 1) then {
				player forceAddUniform "silver_lake_statepolice";
				player addHeadgear "AM_PatrolHat"; 
			};
			if(_level == 2) then {
				player forceAddUniform "silver_lake_statepolice";
				player addHeadgear "AM_PatrolHat"; 
			};
			if(_level == 3) then {
				player forceadduniform "silver_lake_police"; 
				player addHeadgear "Campaign_Hat_Light"; 
			};
			if(_level == 4) then {			
				player forceadduniform "silver_lake_police"; 
				player addHeadgear "AM_PatrolHat"; 
			};
			if(_level == 5) then { 
				player forceadduniform "EF_M_jkt4"; 
				player addVest "EF_BSF"; 
				player addHeadgear "AM_PatrolHat"; 
				player removeweapon "cg_baton";
				player additemtobackpack "EF_BADGE_P_NV";
				player additemtobackpack "Press_Mic_CNN_F";
				currentDetectives pushBack player;
				publicVariable "currentDetectives";
			};
			if(_level == 6) then {	
				player forceadduniform "silver_lake_police"; 
				player addHeadgear "AM_PatrolHat"; 
			};
			if(_level == 7) then {		
				player forceAddUniform "silver_lake_fbi";
				player addHeadgear "AM_PatrolHat"; 
			};
			if(_level == 8) then {
				player forceAddUniform "silver_lake_fbi";
				player addHeadgear "AM_PatrolHat"; 
			};
			
		};
	};

	// highway bureau
	if(_type == "highway") then {

		_freq = 33.4;

		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player addBackpack "AM_PoliceBelt"; 

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

	if(packet > 100000) then {

		player additemtobackpack "RH_uspm";

		for "_i" from 1 to 6 do {player addItemToBackPack "RH_16Rnd_40cal_usp"; };

		for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
		for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
		{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

	} ELSE {
			player additemtobackpack "RH_g17";

			for "_i" from 1 to 3 do {player addItemToBackPack "RH_17Rnd_9x19_g17"; };

			for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
			for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
		{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

	};

		player addweapon "taser";
		player addweapon "cg_baton";
		player addWeapon "Binocular";


		if(female) then { 
			
			if(_level == 1) then {
				player forceAddUniform "female_bluepatrol";
			};
			if(_level == 2) then {				
				player forceAddUniform "female_bluepatrol";
			};				
			if(_level == 3) then {	
				player forceAddUniform "female_bluepatrol";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 4) then {		
				player forceAddUniform "female_bluepatrol";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 5) then {	
				player forceAddUniform "female_bluepatrol";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 6) then {
				player forceadduniform "female_bluepatrol"; 
				player addHeadgear "Campaign_Hat_Light"; 
			};
			if(_level == 7) then {				
				player forceAddUniform "female_police3";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 8) then {
				player forceAddUniform "female_police3";
				player addHeadgear "Campaign_Hat_Dark"; 
			};

		} else { 
			if(_level == 1) then {
				player forceAddUniform "silver_lake_statepolice";
			};
			if(_level == 2) then {
				player forceAddUniform "silver_lake_statepolice";
			};
			if(_level == 3) then {
				player forceAddUniform "silver_lake_police";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 4) then {	
				player forceAddUniform "silver_lake_police";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 5) then {	
				player forceAddUniform "vvv_character_swat_3";
				player addHeadgear "Campaign_Hat_Dark"; 
				this setFace "vvv_head_swat_3";
			};
			if(_level == 6) then {	
				player forceAddUniform "silver_lake_police";
				player addHeadgear "Campaign_Hat_Light"; 
				player addVest "EF_BS"; 
			};
			if(_level == 7) then {	
				player forceAddUniform "silver_lake_fbi";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 8) then {
				player forceAddUniform "silver_lake_fbi";
				player addHeadgear "Campaign_Hat_Dark"; 
			};

		};
	};

	// marshal bureau
	if(_type == "marshal") then {

		_freq = 33.5;

		if(count currentMarshals > 5) exitWith { ["There are too many Marshals on duty.", true] spawn domsg; };

		currentMarshals pushBack player;
		publicVariable "currentMarshals";

		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player addBackpack "AM_PoliceBelt"; 

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

	if(packet > 100000) then {

		player additemtobackpack "RH_uspm";

		for "_i" from 1 to 6 do {player addItemToBackPack "RH_16Rnd_40cal_usp"; };

		for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
		for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
		{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

	} ELSE {
			player additemtobackpack "RH_g17";

			for "_i" from 1 to 3 do {player addItemToBackPack "RH_17Rnd_9x19_g17"; };

			for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
			for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
		{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

	};
		player addweapon "taser";
		player addweapon "cg_baton";
		player addWeapon "Binocular";

		if(female) then { 
		
			if(_level == 5) then {
				player forceAddUniform "EF_FEM_3_3G";
			};
			if(_level == 6) then {
				player forceAddUniform "EF_FEM_3_3G";
			};
			if(_level == 7) then {				
				player forceAddUniform "EF_FEM_3_3G";
			};
			if(_level == 8) then {
				player forceAddUniform "EF_FEM_3_3G";
			};

		} else { 
		
			if(_level == 5) then {
				player forceadduniform "EF_HMMSL_2"; 
			};
			if(_level == 6) then {
				player forceadduniform "EF_HMMSL_2"; 
			};
			if(_level == 7) then {				
				player forceadduniform "EF_HMMSL_2"; 
			};
			if(_level == 8) then {
				player forceAddUniform "EF_HMMSL_2";
			};

		};
	};
	
	// SWAT
	if(_type == "swat") then {

		_freq = 33.3;

		_cost = 1000;
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player forceAddUniform "nopixel_character_swat";
		
		player addBackpack "AM_POLICEBELT";

		player addWeapon "Binocular";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";


		player addHeadgear "TRYK_H_PASGT_BLK";
		player addGoggles "Balaclava_Blk_Plain";

		for "_i" from 1 to 9 do {player addItemTobackpack "29rnd_300BLK_STANAG";};
		for "_i" from 1 to 4 do {player addItemTobackpack "SUPER_Flash";};
		for "_i" from 1 to 9 do {player addItemToBackpack "RH_16Rnd_40cal_usp";};	

		{ player additemtobackpack _x; } foreach ["ToolKit","CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		player addWeapon "hlc_rifle_vendimus";
		player addWeapon "RH_uspm";

		player addPrimaryWeaponItem "optic_MRCO";

	};

	[] SPAWN {


	};
};

if(myjob == "doc") then {
	removeAllItems player;
	removeAllContainers player;
	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;	
	_level = player getvariable "doc";

	// commissioner
	if(_level == 10) then { 
		if(female) then { 
				player forceAddUniform "CUP_U_C_Policeman_01";
				player addheadgear "CUP_H_C_Policecap_01";
		} else {
				player forceAddUniform "CUP_U_C_Policeman_01";
				player addheadgear "CUP_H_C_Policecap_01";
		};	
	};		


	// Prison bureau
	if(_type == "prison") then {

		_freq = 33.2;

		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player addBackpack "AM_PoliceBelt";

		if(packet > 100000) then {

			player additemtobackpack "RH_uspm";

			for "_i" from 1 to 6 do {player addItemToBackPack "RH_16Rnd_40cal_usp"; };

			for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
			for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
			{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		} ELSE {

				player additemtobackpack "RH_g17";

				for "_i" from 1 to 3 do {player addItemToBackPack "RH_17Rnd_9x19_g17"; };

				for "_i" from 1 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
				for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };
			{ player additemtobackpack _x; } foreach ["CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		};

		player addweapon "cg_baton";
		player addweapon "taser";
		player addWeapon "Binocular";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

		if(female) then { 
			
			if(_level == 1) then {
				player forceAddUniform "female_police1";
			};
			if(_level == 2) then {				
				player forceAddUniform "female_police1";
			};				
			if(_level == 3) then {	
				player forceAddUniform "female_police1";
			};
			if(_level == 4) then {		
				player forceAddUniform "female_police1";
			};
			if(_level == 5) then {	
				player forceAddUniform "female_police1";
			};
			if(_level == 6) then {
				player forceadduniform "female_police1"; 
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 7) then {				
				player forceAddUniform "female_police3"; 
				player addheadgear "Campaign_Hat_Dark";
			};
			if(_level == 8) then {
				player forceAddUniform "female_police3";
				player addheadgear "Campaign_Hat_Dark";
			};
			if(_level == 9) then {
				player forceAddUniform "female_police3";
				player addheadgear "Campaign_Hat_Dark";
			};

		} else { 
			if(_level == 1) then {
				player forceAddUniform "silver_lake_sheriff";
			};
			if(_level == 2) then {
				player forceAddUniform "silver_lake_sheriff";
			};
			if(_level == 3) then {
				player forceAddUniform "silver_lake_sheriff";
			};
			if(_level == 4) then {	
				player forceAddUniform "silver_lake_sheriff";
			};
			if(_level == 5) then {	
				player forceAddUniform "silver_lake_sheriff";
			};
			if(_level == 6) then {	
				player forceAddUniform "silver_lake_sheriff";
				player addHeadgear "Campaign_Hat_Dark"; 
			};
			if(_level == 7) then {	
				player forceAddUniform "silver_lake_fbi";
				player addheadgear "Campaign_Hat_Dark";
			};
			if(_level == 8) then {
				player forceAddUniform "silver_lake_fbi";
				player addheadgear "Campaign_Hat_Dark";
			};
			if(_level == 9) then {
				player forceAddUniform "silver_lake_fbi";
				player addheadgear "Campaign_Hat_Dark";
			};

		};
	};
	
	if(_type == "crt") then {

		_freq = 33.2;

		_cost = 1000;
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove", false] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player forceAddUniform "nopixel_character_swat";
		
		player addBackpack "AM_POLICEBELT";

		player addWeapon "Binocular";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";


		player addHeadgear "TRYK_H_PASGT_BLK";
		player addGoggles "Balaclava_Blk_Plain";

		for "_i" from 1 to 9 do {player addItemTobackpack "29rnd_300BLK_STANAG";};
		for "_i" from 1 to 4 do {player addItemTobackpack "SUPER_Flash";};
		for "_i" from 1 to 9 do {player addItemToBackpack "RH_16Rnd_40cal_usp";};	

		{ player additemtobackpack _x; } foreach ["ToolKit","CG_Spikes_Collapsed","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		player addWeapon "hlc_rifle_vendimus";
		player addWeapon "RH_uspm";

		player addPrimaryWeaponItem "optic_MRCO";
	};

};

if(myJob == "EMS") then {
	removeAllItems player;
	removeAllContainers player;
	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;	

	_level = player getvariable "EMS";

	if(_type == "Fire") then {

		_freq = 33.1;
		
		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player addWeapon "Binocular";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

		_level = player getVariable "fire";
		player forceAddUniform "vvv_traje_bombero_2";
		player addBackpack "AM_POLICEBELT";
		player addgoggles "TAC_SF10";
		{ player additemtobackpack _x; } foreach ["cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i","cg_atf_bandage_i"];

		for "_i" from 1 to 10 do {player addItemToBackPack "Manguera_magazine";};

		player addweapon "fireextinguisher";
	};

	if(_type == "EMS") then {

		_freq = 33.1;
		
		_cost = ((_level) * 10);
		[format["The government paid %1 for your loadout.",_cost call client_fnc_numberText], true] spawn domsg;
		["govtBank", _cost, "Remove"] remoteExec["server_fnc_setValue",2];
		["govtBank", format["%1 (%2) removed %3 into the Government bank account.", name player, getplayeruid player, _cost call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

		player addWeapon "Binocular";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player linkitem "cg_tabletd";

		if(female) then { 
		
			if(_level == 2) then { player forceAddUniform "female_ems6"; };
			if(_level == 4) then { player forceAddUniform "female_ems8"; };
			if(_level == 5 || _level == 6) then { player forceAddUniform "female_ems1"; };
			if(_level > 6) then { player forceAddUniform "female_ems7"; };
		} else { 
			if(_level == 1) then { player forceAddUniform "CG_EMS1"; };		
			if(_level == 2) then { player forceAddUniform "CG_EMS2"; };		
			if(_level == 3) then { player forceAddUniform "CG_EMS3"; };
			if(_level == 4) then { player forceAddUniform "CG_EMS4"; };
			if(_level == 5) then { player forceAddUniform "CG_EMS5"; };
			if(_level == 6) then { player forceAddUniform "CG_EMS6"; };
			if(_level == 7) then { player forceAddUniform "CG_EMS7"; };
			if(_level == 8) then { player forceAddUniform "CG_EMS8";
			player addWeapon "taser"; };
			if(_level == 9) then { player forceAddUniform "CG_EMS10";
			player addWeapon "taser"; };
			if(_level == 10) then { player forceAddUniform "CUP_U_C_Rescuer_01";
			player addWeapon "taser"; };
		};

		player addGoggles "Masque_Chirurgical";
		player addBackpack "AM_POLICEBELT";
		
		for "_i" from 8 to 10 do {player addItemToBackPack "vvv_np_magazine_taser"; };
		
		{ player additemtobackpack _x; } foreach ["cg_atf_bandage_i","cg_atf_bandage_i"];
	};
};

if(myjob == "Mafia") then {

	_level = player getVariable "Mafia";

	if(_level >= 3 && _level <= 5) then { player addHeadgear "H_Hat_brown"; };

	if(_level >= 6 && _level <= 9) then { player addHeadgear "H_Hat_tan"; };

	if(_level == 10 ) then { player addHeadgear "H_Hat_grey"; };

	if(female) then { 
		player forceAddUniform "woman3";
	} else { 
		player forceAddUniform "vvv_traje_mafioso_F_1";
	};

};

if(myjob == "Biker") then {

	_freq = 69.1;

	_level = player getVariable "Biker";
	
	if(_level == 2) then { player addHeadgear "acj_casco_germani"; player addvest "brotherhood_1"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level >= 3 && _level <= 4) then { player addHeadgear "acj_casco_germani"; player addvest "brotherhood_2to4"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 5) then { player addHeadgear "acj_casco_espider"; player addvest "brotherhood_5"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 6) then { player addHeadgear "acj_casco_espider"; player addvest "brotherhood_6"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 7) then { player addHeadgear "acj_casco_espider"; player addvest "brotherhood_7"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 8) then { player addHeadgear "acj_casco_calavera"; player addvest "brotherhood_8"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 9) then { player addHeadgear "acj_casco_calavera"; player addvest "brotherhood_9"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
	if(_level == 10) then { player addHeadgear "acj_casco_gris"; player addvest "brotherhood_10"; player addweapon "cg_bat"; for "_i" from 1 to 1 do {player addItemToBackPack "nonlethal_swing"; };};
};





if(myjob == "Mobster") then {

	_level = player getVariable "Mobster";

	if(_level >= 3 && _level <= 5) then { player addHeadgear "H_Hat_brown"; };

	if(_level >= 6 && _level <= 9) then { player addGoggles "G_Aviator"; player addHeadgear "H_Hat_tan"; };

	if(_level == 10 ) then { player addGoggles "G_Aviator"; player addHeadgear "H_Hat_grey"; };


	if(female) then { 
		player forceAddUniform "woman4_4";
	} else { 
		player forceAddUniform "vvv_gangster_white";
	};

	
	if(_level >= 5 && _level <= 7) then { player addHeadgear "H_Hat_blue"; };

	if(_level >= 8) then { player addHeadgear "H_Hat_tan"; };

};

if(myjob == "Legal") then {

	_level = player getVariable "Legal";

	if(_level >= 9) then { player forceAddUniform "KAEL_SUITS_BR_Judge"; };

};

if(currentweapon player != "") then {
	player action ["SwitchWeapon", player, player, 400];
};

if(_freq != 0) then {
	[_freq] SPAWN {
		params["_freq"];
		
		uisleep 3;
		[] spawn client_fnc_tryhangup;
		uisleep 5;
		_freq call client_fnc_changeFrequency;
	};
};

packet=nil;
