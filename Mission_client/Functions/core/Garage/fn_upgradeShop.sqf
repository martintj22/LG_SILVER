disableSerialization;
private["_civilianVehicle","_startlights","_startwindows","_startwheels","_list","_TextureDisplayName"];
_whatdo = _this select 0;

_textures_Global = getArray(configfile >> "CfgIvoryTextures" >> "textures");

_textures_All = ["ivory_all_carbon",
"ivory_all_blueongray",
"ivory_all_blueongreen",
"ivory_all_blueonred",
"ivory_all_blueonyellow",
"ivory_all_grayonblue",
"ivory_all_grayongreen",
"ivory_all_grayonred",
"ivory_all_grayonyellow",
"ivory_all_greenonblue",
"ivory_all_greenongray",
"ivory_all_greenonred",
"ivory_all_greenonyellow",
"ivory_all_redonblue",
"ivory_all_redongray",
"ivory_all_redongreen",
"ivory_all_redonyellow",
"ivory_all_yellowonblue",
"ivory_all_yellowongray",
"ivory_all_yellowongreen",
"ivory_all_yellowonred",
"ivory_all_oceansky",
"ivory_all_cottonsky",
"ivory_all_galaxy",
"ivory_all_starburstgalaxy"];


_textures = _textures_Global + _textures_All;

_npfinishes = ["Glossy","Metallic","Matte","Chrome","PearlescentRed","PearlescentBlue","PearlescentGreen"];

_finishes = [["Glossy",3000],["Metallic",6000],["Matte",12000],["Chrome",30000],["PearlescentRed",35000],["PearlescentBlue",35000],["PearlescentGreen",35000]];

_windows = [["Windows: No Tint",0],["Windows: 50% Tint",0.5],["Windows: 100% Tint",1]];
_lights = [["Lights: No Tint",0],["Lights: 50% Tint",0.5],["Lights: 100% Tint",1]];

// 0.1 is floor and 0.9 is ceiling in ivory_fnc_initVehicle

_wheels = ["default"] + getArray(configfile >> "CfgIvoryTextures" >> "textures");

//remember to use this array in the mafia selling script & ALSO THE CAR UPDATE SCRIPT.


_civilianVehicle = player getvariable "garage";


if(_whatdo == "NEW") exitwith {
	["Wheels / Windows / Lights cost $1,000.00 EACH - Paints based on finish.",false] spawn doquickmsg; 
	_display = findDisplay 1444;
	_list = _display displayCtrl 1500;

	lbClear _list;

	{
		_class = _x select 1;

		_licenseplate = _x select 0;
		_vehicleName = [(_x select 1)] call Client_fnc_getVehicleName;

		_list lbAdd format["%1",_vehicleName]; 

		_list lbSetdata [(lbSize _list)-1,str([_class,_x])];
	} foreach _civilianVehicle;

	_list = _display displayCtrl 1502;
	lbClear _list;
	{
		_class = _x select 0;
		_cost = _x select 1;	
		_FinishDisplayName = getText(configFile >> "CfgIvoryMaterials" >> _class >> "displayName");
		_list lbAdd format["COST: %2 - %1",_FinishDisplayName,_cost call client_fnc_numberText];
		_list lbSetdata [(lbSize _list)-1,str([_class, _cost])];
	} foreach _finishes;



	_list = _display displayCtrl 1503;
	lbClear _list;
	{
		_text = _x select 0;
		_list lbAdd format["%1",_text];
		_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
	} foreach _windows;

	lbSetCurSel [1503, 0];

	_list = _display displayCtrl 1504;
	lbClear _list;
	{
		_text = _x select 0;
		_list lbAdd format["%1",_text];
		_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
	} foreach _lights;

	lbSetCurSel [1504, 0];



	_list = _display displayCtrl 1505;
	lbClear _list;
	{
		if(_x == "Default" ) then {
			_TextureDisplayName = "Default"; 
		} else {
			_TextureDisplayName = getText(configFile >> "CfgIvoryTextures" >> _x >> "displayName");
		};
		_list lbAdd format["%1",_TextureDisplayName];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _wheels;
	lbSetCurSel [1500, 0];

	
	_list = _display displayCtrl 1506;
	lbClear _list;
	_list lbAdd "No Spoiler";
	_list lbSetdata [(lbSize _list)-1,str(0)];
	_list lbAdd "Spoiler";
	_list lbSetdata [(lbSize _list)-1,str(1)];
	lbSetCurSel [1506, 0];

};

_index = lbCurSel (1500);
_status = lbData[1500, _index];
_SELECTEDVEHICLE = call compile format["%1", _status];
_selectedvehicle = _selectedvehicle select 0;
 

if(_whatdo == "CAR" || isNil "spawnedvehicle") then {

	if(!isNil "spawnedvehicle") then {
		deletevehicle spawnedvehicle;
	};

	_dir = 240;


	spawnedvehicle = _SELECTEDVEHICLE createvehiclelocal [9720.13,827.599,25];
	spawnedvehicle setpos [9720.13,827.599,1];


	spawnedvehicle allowDamage false;

	spawnedvehicle setdir _dir;
	client_kcCamera camSetTarget spawnedvehicle;
	client_kcCamera camSetRelPos [2,3.6,0.2];
	client_kcCamera camSetFOV 1.5;
	client_kcCamera camCommit 0;



};



if(_whatdo == "CAR") exitwith {

	_display = findDisplay 1444;
	_list = _display displayCtrl 1501;
	lbClear _list;

	_index = lbCurSel (1500);
	_status = lbData[1500, _index];
	_SELECTc = call compile format["%1", _status];
	_select = _selectc select 1;
	_selectc = _selectc select 0;

	if ( _selectc find "ivory_c" == 0) then { 
		_textures append ["ivory_c_2tblack",
		"ivory_c_2tblackwhite",
		"ivory_c_2tblueblack",
		"ivory_c_2tgreenblack",
		"ivory_c_2tpinkpeach",
		"ivory_c_2tpinkpurple",
		"ivory_c_2tredblack",
		"ivory_c_2ttealblack",
		"ivory_c_2ttealmint",
		"ivory_c_2twhiteblack",
		"ivory_c_2tzacspecial"];
	};

	if ( _selectc find "ivory_ccx" == 0) then { 
		_textures append ["ivory_ccx_champion",
		"ivory_ccx_iceyspicy",
		"ivory_ccx_imbatman",
		"ivory_ccx_pikapii",
		"ivory_ccx_racingyellow",
		"ivory_ccx_rasta",
		"ivory_ccx_rally",
		"ivory_ccx_slime"];
	};

	if ( _selectc find "ivory_e36" == 0) then { 
		_textures append ["ivory_e36_m",
		"ivory_e36_premium",
		"ivory_e36_ricer"];
	};


	if ( _selectc find "ivory_elise" == 0) then { 
		_textures append ["ivory_elise_classic",
		"ivory_elise_luxe",
		"ivory_elise_ocean",
		"ivory_elise_pro",
		"ivory_elise_red",
		"ivory_elise_sport",
		"ivory_elise_tuning"];
	};

	if ( _selectc find "ivory_evox" > -1) then { 
		_textures append ["ivory_evox_brightlime",
		"ivory_evox_cleanwhite", 
		"ivory_evox_forsakenteal", 
		"ivory_evox_reckfulred",
		"ivory_evox_koyama",
		"ivory_evox_raliart",
		"ivory_evox_motors"]; 
	};

	if ( _selectc find "ivory_f1" > -1) then { 
		_textures append ["ivory_f1_us",
		"ivory_f1_uk",
		"ivory_f1_lark"]; 
	};

	if ( _selectc find "ivory_gt500" > -1) then { 
		_textures append ["ivory_gt500_terlingua"]; 
	};

	if ( _selectc find "ivory_lfa" > -1) then { 
		_textures append ["ivory_lfa_deuce",
		"ivory_lfa_neon", 
		"ivory_lfa_nyan", 
		"ivory_lfa_tokyo", 
		"ivory_lfa_freshpink"]; 
	};

	if ( _selectc find "ivory_m3" > -1) then { 
		_textures append ["ivory_m3_c9",
		"ivory_m3_candyred", 
		"ivory_m3_crispyblue", 
		"ivory_m3_deluxeblue",
		"ivory_m3_icywhite", 
		"ivory_m3_special",
		"ivory_m3_carbon",
		"ivory_m3_monster",
		"ivory_m3_fnatic",
		"ivory_m3_feng"];
	};

	if ( _selectc find "ivory_r8" > -1) then { 
		_textures append ["ivory_r8_hankook",
		"ivory_r8_redwave"]; 
	};

	if ( _selectc find "ivory_r8_spyder" > -1) then { 
		_textures append ["ivory_r8_spyder_hellokitty"]; 
	};

	if ( _selectc find "ivory_r34" > -1) then { 
		_textures append ["ivory_r34_2fast", 
		"ivory_r34_cobaltgray", 
		"ivory_r34_majesticpurple", 
		"ivory_r34_nitrored",
		"ivory_r34_topsecret",
		"ivory_r34_nismo",
		"ivory_r34_nismoblue",
		"ivory_r34_nismored",
		"ivory_r34_kenwood"]; 
	};

	if ( _selectc find "ivory_rev" > -1) then { 
		_textures append ["ivory_rev_tiger",
		"ivory_rev_custom",
		"ivory_rev_tron1",
		"ivory_rev_tron2"];
	};

	if ( _selectc find "ivory_rs4" > -1) then { 
		_textures append ["ivory_rs4_camo"];
	};

	if ( _selectc find "ivory_supra" > -1) then { 
		_textures append ["ivory_supra_electricblue", 
		"ivory_supra_electricred", 
		"ivory_supra_electricwhite", 
		"ivory_supra_lastride", 
		"ivory_supra_shadowgray",
		"ivory_supra_36",
		"ivory_supra_39"];
	};


	if ( _selectc find "ivory_veyron" > -1) then { 
		_textures append ["ivory_veyron_blue", 
		"ivory_veyron_bw", 
		"ivory_veyron_century", 
		"ivory_veyron_classic", 
		"ivory_veyron_dark", 
		"ivory_veyron_sport",
		"ivory_veyron_diamond",
		"ivory_veyron_gingerbread"]; 
	};

	if ( _selectc find "ivory_wrx" > -1) then { 
		_textures append ["ivory_wrx_candy",
		"ivory_wrx_graymatter", 
		"ivory_wrx_nyan", 
		"ivory_wrx_sparco",
		"ivory_wrx_coca",
		"ivory_wrx_monster",
		"ivory_wrx_martini"]; 
	};

	lbClear _list;
	{
		_TextureDisplayName = getText(configFile >> "CfgIvoryTextures" >> _x >> "displayName");
		_list lbAdd format["%1",_TextureDisplayName];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _textures;

	_thepia = _civilianvehicle FIND _select;

	_bcolor = (_civilianVehicle select _thepia) select 2;
	_startcolor = _textures FIND _bcolor;

	_bfinish = (_civilianVehicle select _thepia) select 3;
	_startfinish = _npfinishes FIND _bfinish;

	_bwheels = (_civilianVehicle select _thepia) select 4;
	_startwheels = _wheels FIND _bwheels;

	_startspoiler = (_civilianVehicle select _thepia) select 9;

	if((_civilianVehicle select _thepia) select 5 == 0) then  { _startwindows = 0; };
	if((_civilianVehicle select _thepia) select 5 == 0.5) then { _startwindows = 1; };	
	if((_civilianVehicle select _thepia) select 5 == 1) then { _startwindows = 2; };	

	if((_civilianVehicle select _thepia) select 6 == 0) then { _startlights = 0; };
	if((_civilianVehicle select _thepia) select 6 == 0.5) then { _startlights = 1; };	
	if((_civilianVehicle select _thepia) select 6 == 1) then { _startlights = 2; };	

	lbSetCurSel [1501, _startcolor];
	lbSetCurSel [1502, _startfinish];
	lbSetCurSel [1503, _startlights];
	lbSetCurSel [1504, _startwindows];
	lbSetCurSel [1505, _startwheels];
	lbSetCurSel [1506, _startspoiler];

};








_index = lbCurSel (1501);
_status = lbData[1501, _index];
_SELECTEDCOLOR = call compile format["%1", _status];
_SELECTEDCOLOR = getText(configfile >> "CfgIvoryTextures" >> _SELECTEDCOLOR >> "texture");

_index = lbCurSel (1502);
_status = lbData[1502, _index];
_SELECTEDFINISH = call compile format["%1", _status];
_SELECTEDFINISH = _SELECTEDFINISH select 0;
_SELECTEDFINISH = getText(configfile >> "CfgIvoryMaterials" >> _SELECTEDFINISH >> "material");

_index = lbCurSel (1503);
_status = lbData[1503, _index];
_SELECTEDTINT = call compile format["%1", _status];


_index = lbCurSel (1504);
_status = lbData[1504, _index];
_SELECTEDLIGHTS = call compile format["%1", _status];


_index = lbCurSel (1505);
_status = lbData[1505, _index];
_SELECTEDwCOLOR = call compile format["%1", _status];

_index = lbCurSel (1506);
_status = lbData[1506, _index];
_spoiler = call compile format["%1", _status];

if (_SELECTEDwCOLOR == "Default") then {
	_SELECTEDwCOLOR = getArray(configfile >> "CfgVehicles" >> (typeOf spawnedVehicle) >> "hiddenSelectionsTextures");
	_SELECTEDwCOLOR = _SELECTEDwCOLOR select 1;
} else {
	_SELECTEDwCOLOR = getText(configfile >> "CfgIvoryTextures" >> _SELECTEDwCOLOR >> "texture");
};

if (_SELECTEDTINT < 0.1) then { _SELECTEDTINT = 0.1 };
if (_SELECTEDTINT > 0.9) then { _SELECTEDTINT = 0.9 };
if (_selectedLIGHTS < 0.1) then { _selectedLIGHTS = 0.1 };
if (_selectedLIGHTS > 0.9) then { _selectedLIGHTS = 0.9 };

spawnedVehicle setObjectMaterial [0, _SELECTEDFINISH];
spawnedVehicle setObjectTexture	[0, _SELECTEDCOLOR];
spawnedVehicle setObjectTexture	[1, _SELECTEDwCOLOR];

spawnedVehicle setObjectTextureGlobal 	[2,"#(argb,8,8,3)color(0,0,0," + str _SELECTEDTINT + ",ca)"];
spawnedVehicle setObjectTextureGlobal 	[3,"#(argb,8,8,3)color(0,0,0," + str _selectedLIGHTS + ",ca)"];

spawnedVehicle animate 	["spoiler", _spoiler];