[] spawn {
if(count allplayers < 50) exitwith {};
	private["_pos"];
	_civveh = [

		["VVV_Fortransi_civ",8900], 
		["VVV_Alfa_Romeo_59",9900], 
		["VVV_Alfa_Romeo_Spider_Duetto",9900], 
		["VVV_Chevrolet_Blazer",9999],	
		["VVV_Audi_RS6_Avant_C6",14000], 
		["vvv_Chevrolet_Impala",15900], 
		["ivory_gt500",22000],	
		["VVV_Audi_A4",24000], 
		["VVV_Audi_Q7",24000], 
		["vvv_DOD_RamSRT_civ",24000], 
		["VVV_Cadillac_DTS",31000], 
		["VVV_Aston_Martin_DB9",32000], 
		["VVV_Cadillac_Escalade",32000], 
		["ivory_evox",35000],	
		["VVV_Cadillac_CTSV",35000],	
		["VVV_Chevrolet_Cone0",36000], 
		["VVV_Aston_Martin_Rapide",36000], 
		["ivory_supra",37000],	
		["ivory_r34",39000],
		["VVV_Aston_Martin_DB5",42000],
		["ivory_wrx",46000],
		["ivory_m3",46000],	
		["VVV_Cadillac_XLR_V",46000],	
		["ivory_c",59000],	
		["ivory_elise",59000],		
		["VVV_Bentley_Arnage",75000],
		["ivory_isf",75000],		
		["VVV_Bentley_Continental_SS",75000], 
		["VVV_Chevrolet_Corvette_Cone",100000], 
		["VVV_Audi_TT_RS_Coupe",120000],	
		["ivory_supra_topsecret",140000],	
		["ivory_lfa",165000],
		["ivory_mp4",195000],
		["ivory_veyron",290000],
		["ivory_f1",450000]
	];

	while{true} do {
		_pos = [random(10000),random(10000),0];
		_isWater = surfaceIsWater (_pos);
		if(!_isWater) exitwith {  };	
		uisleep 2;
	};

	_spawnedCar = _civveh call BIS_FNC_SELECTRANDOM;

	_spawnedCar = (_spawnedCar select 0) createvehicle _pos;

	_spawnedCar setvariable ["hotcar",true,true];
	_spawnedCar lock 2;

	_markerstr = createMarker ["hotcarmarker",_pos];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType "hd_dot";
	_markerstr setmarkertext "HOT CAR LOCATION";
	["A hot vehicle has been placed on the map"] remoteexec ["client_fnc_announceCivilians",-2];

	uisleep 600;

	deletemarker "hotcarmarker";
};