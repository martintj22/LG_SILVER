params ["_vehicle","_owedPlayers","_owedInformation","_object"];
private["_owner"];
_carowner = _vehicle select 8;
_owner = _carowner call BIS_fnc_getUnitByUid;


//copy from car shop - cunt.
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

if(_owner IN _owedPlayers) then {

	_pia = _owedplayers FIND _owner;

	_amount = (_owedinformation SELECT _pia) SELECT 1;

	_typeofVeh = (_vehicle select 1);
	_licensePlate = (_vehicle select 0);
	_value = 0;

	{
		if((_x select 0) == _typeofVeh) then { _value = (_x select 1) * 0.65; };
	}foreach _civilianVehicle;

	if(_value == 0) exitwith { ["Value of vehicle is 0", true] spawn domsg; };

	_amount = _amount - _value;
	if(_amount < 0) then { _amount = 0; };

	["set","MafiaMoney",_amount] remoteExec ["client_fnc_sustain",_owner];

	//add funds to mafia bank

	["mafiaBank", _value, "Add"] remoteexec ["server_fnc_setValue",2];


	[_licensePlate, _vehicle, nil, nil, nil, nil, nil, nil, nil, "Remove", _owner] remoteExec ["Server_fnc_garageUpdate",2];
	
	deletevehicle _object;
	//delete from database

} else {
	["The owner of this vehicle is not in debt to the Mafia.", true] spawn domsg;	
};