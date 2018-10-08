 disableSerialization;

_whatdo = _this select 0;

_textures = getArray(configfile >> "CfgIvoryTextures" >> "defaulttextures");
_finishes = [["Glossy",0]];



_farmingVehicles = ["vvv_DOD_RamSRT_civ","VVV_Fortransi_civ"];

//remember to use this array in the mafia selling script & ALSO THE CAR UPDATE SCRIPT.
_civilianVehicle = [
	// type 1
	["ivory_190e",3300],
	["VVV_Chevrolet_Camaro_RS",3300], 
	["VVV_Aston_Martin_Cygnet",5900], 
	["VVV_Abarth_500",5900], 
	["ivory_gti",6000],	
	["VVV_Abarth_695",6900], 
	["VVV_Chevrolet_Bel_Air",7900], 
	["ivory_e36",8000],
	["VVV_Cadillac_Eldorado",8900], 
	["VVV_Fortransi_civ",8900], 
	["VVV_Alfa_Romeo_59",9900], 
	["VVV_Alfa_Romeo_Spider_Duetto",9900], 

	// type 2
	["nopixel_GMC_Campervan",10000],	
	["nopixel_Box_Default",10000],	
	["VVV_Chevrolet_Blazer",10000],	
	["VVV_Audi_RS6_Avant_C6",14000], 
	["vvv_Chevrolet_Impala",15900], 

	// type 3
	["ivory_gt500",22000],	
	["VVV_Audi_A4",24000], 
	["VVV_Audi_Q7",24000], 
	["vvv_DOD_RamSRT_civ",24000], 

	// type 4
	["VVV_Cadillac_DTS",31000], 
	["VVV_Aston_Martin_DB9",32000], 
	["VVV_Chevrolet_Cone0",36000], 
	["VVV_Aston_Martin_Rapide",36000], 
	["ivory_rs4",40000],
	["VVV_Aston_Martin_DB5",42000],
	["ivory_isf",42000],
	["ivory_m3",46000],	
	["VVV_Cadillac_XLR_V",46000],	

	// type 5
	["ivory_evox",55000],
	["ivory_wrx",56000],	
	["ivory_elise",59000],	
	["ivory_supra",62000],	
	["ivory_r34",60000],
	["Acj_HarleyDavidson_Sholvehead",65000],
	// type 6
	["ivory_suburban",70000],
	["VVV_Cadillac_Escalade",72000], 
	["ivory_c",102000],	
	["VVV_Chevrolet_Corvette_Cone",100000], 
	["ivory_r8",120000],
	["ivory_r8_spyder",125000],
	["VVV_Audi_TT_RS_Coupe",120000],	
	["ivory_911",120000],
	["ivory_supra_topsecret",140000],	
	["ivory_lp560",170000],	
	["ivory_mp4",195000],

	// type 7
	["ivory_lfa",265000],
	["ivory_f1",320000],
	["ivory_rev",340000],
	["ivory_veyron",390000],
	["ivory_ccx",450000]
];

if(str CursorObject find "embarcadero" > -1) then {
	_type = "BOAT";
	_civilianVehicle = [
		["B_Boat_Transport_01_F",5500],
		["sab_boat",12600],
		["sab_boat_2",12600],
		["sab_boat_3",12600],
		["sab_boat_4",12600],
		["C_Scooter_Transport_01_F",12600],
		["Lexx_Jetboat_H",112000],
		["C_Boat_Transport_02_F",223000],		
		["POP_Speed_yatch",1150000],
		["vvv_NewYacht",1500000]
	];
};


if(str CursorObject find "hangar" > -1) then {
	_type = "AIR";
	_civilianVehicle = [
		["r_hotairballoon",500000],
		["C_Plane_Civil_01_F",650000],
		["C_Plane_Civil_01_racing_F",650000],		
		["sab_FAAllegro",650000],
		["sab_katana",750000],
		["sab_albatrosb2_civ",750000],
		["sab_piper5",750000],
		["sab_an12_4",850000]
	];
};

if(_whatdo == "NEW") then {
	_display = findDisplay 1444;
	_list = _display displayCtrl 1500;

	lbClear _list;

	{
		_class = _x select 0;
		_cost = _x select 1;
		_vehicleName = [(_x select 0)] call Client_fnc_getVehicleName;

		_addedprice = (_cost / 100) * taxRate;
		_cost = _addedprice + _cost;

		if(_class IN _farmingvehicles) then { 
			_list lbAdd format["%2 %1 (Auto Refine)",_vehicleName, _cost call client_fnc_numberText]; 
		} else { 
			_list lbAdd format["%2 %1",_vehicleName, _cost call client_fnc_numberText]; 
		};



		_list lbSetdata [(lbSize _list)-1,str([_class, _cost - _addedprice])];
	} foreach _civilianVehicle;

	_list = _display displayCtrl 1501;
	lbClear _list;
	{
		_TextureDisplayName = getText(configFile >> "CfgIvoryTextures" >> _x >> "displayName");
		_list lbAdd format["%1",_TextureDisplayName];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _textures;

	_list = _display displayCtrl 1502;
	lbClear _list;
	{
		_class = _x select 0;
		_cost = _x select 1;	
		_FinishDisplayName = getText(configFile >> "CfgIvoryMaterials" >> _class >> "displayName");
		_list lbAdd format["COST: %2 - %1",_FinishDisplayName,_cost call client_fnc_numberText];
		_list lbSetdata [(lbSize _list)-1,str([_class, _cost])];
	} foreach _finishes;

	lbSetCurSel [1500, 0];
	lbSetCurSel [1501, 0];
	lbSetCurSel [1502, 0];

};

_index = lbCurSel (1500);
_status = lbData[1500, _index];
_SELECTEDVEHICLE = call compile format["%1", _status];
_selectedvehicle = _selectedvehicle select 0;

_index = lbCurSel (1501);
_status = lbData[1501, _index];
_SELECTEDCOLOR = call compile format["%1", _status];
_SELECTEDCOLOR = getText(configfile >> "CfgIvoryTextures" >> _SELECTEDCOLOR >> "texture");

_index = lbCurSel (1502);
_status = lbData[1502, _index];
_SELECTEDFINISH = call compile format["%1", _status];
_SELECTEDFINISH = _SELECTEDFINISH select 0;
_SELECTEDFINISH = getText(configfile >> "CfgIvoryMaterials" >> _SELECTEDFINISH >> "material");

if(_whatdo == "CAR" || isNil "spawnedvehicle") then {
	
	if(!isNil "spawnedvehicle") then {
		deletevehicle spawnedvehicle;
	};

	player allowdamage false;
	_dir = 180;

	if(_SELECTEDVEHICLE iskindof "car") then {
		spawnedvehicle = _SELECTEDVEHICLE createvehiclelocal [9720.13,827.599,25];
		spawnedvehicle setpos [9720.13,827.599,0.5];
		spawnedvehicle setdir _dir;
	};

	if(_SELECTEDVEHICLE iskindof "ship") then {
		spawnedvehicle = _SELECTEDVEHICLE createvehiclelocal [696.876,416.723,3.13335];
		spawnedvehicle setpos [696.876,419.723,3.13335];
		_dir = 180;
		spawnedvehicle setdir _dir;
	};

	if(_SELECTEDVEHICLE iskindof "Air") then {
		spawnedvehicle = _SELECTEDVEHICLE createvehiclelocal [3282.51,914.667,1.24039];
		spawnedvehicle setpos [3282.51,914.667,1.24039];
		_dir = 180;
		spawnedvehicle setdir _dir;
	};

	spawnedvehicle animate["spoiler", 0];

	spawnedvehicle allowdamage false;
	client_kcCamera camSetTarget spawnedvehicle;
	client_kcCamera camSetRelPos [2.7,1,0.25];
	client_kcCamera camSetFOV .99;
	client_kcCamera camCommit 0;

	spawnedVehicle setObjectTexture	[0, _SELECTEDCOLOR];
	spawnedVehicle setObjectMaterial [0, _SELECTEDFINISH];
	player allowDamage true;
};

if(spawnedvehicle iskindof "car" && !isNil "spawnedvehicle") then {
	spawnedVehicle setObjectMaterial [0, _SELECTEDFINISH];

	spawnedVehicle setObjectTexture	[0, _SELECTEDCOLOR];
};

















_medicVehicles = [
"Jonzie_ambluance",
"ivory_evox_ems"
];

_policeVehicle = [

"ivory_suburban_marked",

"ivory_rs4_marked",
"ivory_wrx_marked",
"ivory_evox_marked",
"ivory_isf_marked",

"ivory_suburban_unmarked",
"ivory_rs4_unmarked",
"ivory_wrx_unmarked",
"ivory_evox_unmarked",
"ivory_isf_unmarked",

"ivory_suburban_slicktop",
"ivory_rs4_slicktop",
"ivory_wrx_slicktop",
"ivory_evox_slicktop",
"ivory_isf_slicktop"

];


_specialVehicleList = [

//buggys no colors

"shounka_buggy",
"shounka_buggy_bleufonce",
"shounka_buggy_grise",
"shounka_buggy_jaune",
"shounka_buggy_noir",
"shounka_buggy_orange",
"shounka_buggy_rose",
"shounka_buggy_rouge",
"shounka_buggy_violet",

//utility

"Jonzie_flatbed_roadtrain",
"Jonzie_flatbed",
"Jonzie_curtain_roadtrain",
"Jonzie_Curtain",

"Jonzie_Log_Truck",
"Jonzie_Tanker_Truck",
"Jonzie_Tow_Truck",

"ivory_190e_taxi",
"ivory_rs4_taxi",
"Jonzie_Forklift",
"Jonzie_Transit",

//racing F1
"vvv_formula1_tmac",
"vvv_formula1_sayeed",
"vvv_formula1_Ciggy",
"vvv_formula1_Doge",
"vvv_formula1_ferrari",
"vvv_formula1_mario",
"vvv_formula1_marvel",
"vvv_formula1_mclaren",
"vvv_formula1_mingsucks",
"vvv_formula1_netflix1",
"vvv_formula1_netflix2",
"vvv_formula1_fb",
"vvv_formula1_andy",
"vvv_formula1_redbull",
"vvv_formula1_thad",
"vvv_formula1_twitch",

"vvv_seatleon_2014_arruabarrena",
"vvv_seatleon_2014_baus",
"vvv_seatleon_2014_briche_blue",
"vvv_seatleon_2014_carbonell",
"vvv_seatleon_2014_comini",
"vvv_seatleon_2014_dediego",
"vvv_seatleon_2014_font",
"vvv_seatleon_2014_giao",
"vvv_seatleon_2014_grise",
"vvv_seatleon_2014_hernandez",
"vvv_seatleon_2014_mourgues",
"vvv_seatleon_2014_oriola",
"vvv_seatleon_2014_rueda",
"vvv_seatleon_2014_schmarl",
"vvv_seatleon_2014_veglia",
"vvv_seatleon_2014_vinyes",
"vvv_seatleon_2014_weber"

];



















_medicVehicles = [
"Jonzie_ambluance",
"ivory_evox_ems"
];

_policeVehicle = [

"ivory_suburban_marked",

"ivory_rs4_marked",
"ivory_wrx_marked",
"ivory_evox_marked",
"ivory_isf_marked",

"ivory_suburban_unmarked",
"ivory_rs4_unmarked",
"ivory_wrx_unmarked",
"ivory_evox_unmarked",
"ivory_isf_unmarked",

"ivory_suburban_slicktop",
"ivory_rs4_slicktop",
"ivory_wrx_slicktop",
"ivory_evox_slicktop",
"ivory_isf_slicktop"

];


_specialVehicleList = [

//buggys no colors

"shounka_buggy",
"shounka_buggy_bleufonce",
"shounka_buggy_grise",
"shounka_buggy_jaune",
"shounka_buggy_noir",
"shounka_buggy_orange",
"shounka_buggy_rose",
"shounka_buggy_rouge",
"shounka_buggy_violet",

//utility

"Jonzie_flatbed_roadtrain",
"Jonzie_flatbed",
"Jonzie_curtain_roadtrain",
"Jonzie_Curtain",

"Jonzie_Log_Truck",
"Jonzie_Tanker_Truck",
"Jonzie_Tow_Truck",

"ivory_190e_taxi",
"ivory_rs4_taxi",
"Jonzie_Forklift",
"Jonzie_Transit",

//racing F1
"vvv_formula1_tmac",
"vvv_formula1_sayeed",
"vvv_formula1_Ciggy",
"vvv_formula1_Doge",
"vvv_formula1_ferrari",
"vvv_formula1_mario",
"vvv_formula1_marvel",
"vvv_formula1_mclaren",
"vvv_formula1_mingsucks",
"vvv_formula1_netflix1",
"vvv_formula1_netflix2",
"vvv_formula1_fb",
"vvv_formula1_andy",
"vvv_formula1_redbull",
"vvv_formula1_thad",
"vvv_formula1_twitch",

"vvv_seatleon_2014_arruabarrena",
"vvv_seatleon_2014_baus",
"vvv_seatleon_2014_briche_blue",
"vvv_seatleon_2014_carbonell",
"vvv_seatleon_2014_comini",
"vvv_seatleon_2014_dediego",
"vvv_seatleon_2014_font",
"vvv_seatleon_2014_giao",
"vvv_seatleon_2014_grise",
"vvv_seatleon_2014_hernandez",
"vvv_seatleon_2014_mourgues",
"vvv_seatleon_2014_oriola",
"vvv_seatleon_2014_rueda",
"vvv_seatleon_2014_schmarl",
"vvv_seatleon_2014_veglia",
"vvv_seatleon_2014_vinyes",
"vvv_seatleon_2014_weber"

];