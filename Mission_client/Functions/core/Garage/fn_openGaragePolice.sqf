params["_house"];

createDialog "garage3"; 

ctrlSetText [1000, "Garage"];

_garage = [];

[player, "govtbank"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };

_num = round (random(4));	
if(_num == 0) then { _num = 1; };



if(myJob == "Legal") then {
	_garage pushBack "ivory_isf_1";
};

if(myJob == "Cop") then {
	

	if(packet < 100000) then {
           
		if(player getvariable "cop" >= 1) then { 
			_garage pushback "VVV_Ford_CVPI_training";
			_garage pushback "VVV_Ford_CVPI_black";
			_garage pushback "VVV_dodge_charger_marshals";	
		};
		
		if(player getvariable "cop" >= 3) then { 
			_garage pushback "VVV_dodge_charger_pd";
			_garage pushback "VVV_dodge_charger_highway";	
		};
		
		if(player getvariable "cop" >= 5 && typeOf _house == "Land_PoliceStation") then { 
			_garage pushback "B_UAV_01_F"; 
			_garage pushback "B_Static_Designator_01_F"; 
		    _garage pushback "ivory_isf_unmarked"; 
			_garage pushback "VVV_DodgeDurango_police"; 
		    _garage pushback "VVV_DodgeDurango_highway"; 
		};
	   
		if(player getvariable "cop" >= 7) then { 
			_garage pushback "VVV_dodge_charger_marshals_su";
		};
		
		 if(player getvariable "cop" >= 8) then { 
			_garage pushback "VVV_dodge_charger_marshals_su";
			_garage pushback "VVV_DodgeDurango_highway";
		};
		

		if((player getvariable "cop" > 8|| 8 IN licenseArray || 9 IN licenseArray ) && (typeOf _house == "Land_PoliceStation") ) then { 
			_garage pushback "acj_SWAT"; 
			_garage pushback "B_T_LSV_01_armed_F"; 
		};

		if((player getvariable "cop" > 8 || 10 IN licenseArray || 11 IN licenseArray) && (str _house find "embarcadero" > -1) ) then { 
			_garage pushback "B_Boat_Transport_01_F"; 
			_garage pushback "C_Scooter_Transport_01_F";
			_garage pushback "C_Boat_Civil_01_police_F";
			_garage pushback "B_CBS_WaterShadow730_F";
			_garage pushback "O_Boat_Armed_01_hmg_F";
		};
		
	 	if((player getvariable "cop" > 8 || 12 IN licenseArray || 13 IN licenseArray) && (typeOf _house == "Land_PoliceStation" || str _house find "em_heliport" > -1 ) ) then {
			_garage pushback "MELB_H6M";
			_garage pushback "GR_UH1N_3";
			
		};

	} else {
		
		if(player getvariable "cop" >= 1 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_Ford_CVPI_training";
			_garage pushback "VVV_Ford_CVPI_black";
			_garage pushback "VVV_dodge_charger_marshals";	
		};
		
		if(player getvariable "cop" >= 3 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_dodge_charger_pd";
			_garage pushback "VVV_dodge_charger_highway";			
		};

		if(player getvariable "cop" >= 5 && typeOf _house == "Land_PoliceStation") then { 
			_garage pushback "B_UAV_01_F"; 
			_garage pushback "B_Static_Designator_01_F"; 
			_garage pushback "ivory_evox_unmarked"; 
			_garage pushback "ivory_isf_unmarked"; 
			_garage pushback "ivory_wrx_unmarked"; 
			_garage pushback "ivory_rs4_unmarked";
			_garage pushback "ivory_m3_unmarked";
			_garage pushback "ivory_suburban_unmarked";
		};

		if(player getvariable "cop" >= 6 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_DodgeDurango_police";
			_garage pushback "VVV_DodgeDurango_highway";
			_garage pushback "VVV_dodge_charger_pd_su";
			_garage pushback "VVV_dodge_charger_highway_su";
			_garage pushback "VVV_dodge_charger_marshals_su";
		};

		if(player getvariable "cop" == 10 && typeOf _house == "Land_PoliceStation") then { 
			_garage pushback "ivory_rev_marked"; 
			_garage pushback "ivory_rev_slicktop"; 
			_garage pushback "ivory_rev_unmarked";
		};

		if((player getvariable "cop" > 8 || 8 IN licenseArray || 9 IN licenseArray ) && (typeOf _house == "Land_PoliceStation") ) then { 
			_garage pushback "acj_SWAT"; 
			_garage pushback "B_T_LSV_01_armed_F"; 
			
		};

		if((player getvariable "cop" > 8 || 10 IN licenseArray || 11 IN licenseArray) && (str _house find "embarcadero" > -1) ) then { 
			_garage pushback "B_Boat_Transport_01_F"; 
			_garage pushback "C_Scooter_Transport_01_F";
			_garage pushback "C_Boat_Civil_01_police_F";
			_garage pushback "B_CBS_WaterShadow730_F";
			_garage pushback  "O_Boat_Armed_01_hmg_F";
		};
		
	 	if((player getvariable "cop" > 8 || 12 IN licenseArray || 13 IN licenseArray) && (typeOf _house == "Land_PoliceStation" || str _house find "em_heliport" > -1 ) ) then {
			_garage pushback "MELB_H6M";
			_garage pushback "GR_UH1N_3";
			_garage pushback "EC635_Unarmed";
			_garage pushback "GR_Bell412_3";
		};


	};
};

if(myJob == "doc") then {

	if(packet < 100000) then {

	
		if(player getVariable "doc" >= 1 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_dodge_charger_doc_su";
		};
		
		if(player getVariable "doc" >= 3 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "A3L_jailBus";
		};

	 	if((player getvariable "doc" == 10 || 16 IN licenseArray || 17 IN licenseArray) && (typeOf _house == "Land_PoliceStation" || str _house find "em_heliport" > -1 ) ) then {
			_garage pushback "MELB_H6M";
		};

	} Else {

		if(player getVariable "doc" >= 1 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_dodge_charger_doc_su";
		};

		if(player getVariable "doc" >= 3 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "A3L_jailBus";
		};

		if(player getvariable "doc" >= 6 && typeOf _house == "Land_PoliceStation") then {
			_garage pushback "VVV_dodge_charger_doc_su";
		};

	 	if((player getvariable "doc" == 10 || 16 IN licenseArray || 17 IN licenseArray) && (typeOf _house == "Land_PoliceStation" || str _house find "em_heliport" > -1 ) ) then {
			_garage pushback "MELB_H6M";
			_garage pushback "EC635_Unarmed";
			_garage pushback "GR_Bell412_3";
		};

	};

};
if(myJob == "EMS") then {

	if(player getvariable "ems" >= 1 && (typeof _house IN ['Land_buildingshospital1'])) then {
		_garage pushback "NP_Jonzie_Ambulance1";
	};
	
	if(player getvariable "ems" >= 2 && (typeof _house IN ['Land_buildingshospital1'])) then {
		_garage pushback "NP_Jonzie_Ambulance2";
	};
	
	if(player getvariable "ems" >= 3 && (typeof _house IN ['Land_buildingsfiredept1'])) then {
		_garage pushback "vvv_fire_truck";
	};
	
	if(player getvariable "ems" >= 4 && (typeof _house IN ['Land_buildingsfiredept1'])) then {
		_garage pushback "ivory_suburban_ems";
	};

	if(player getvariable "ems" >= 6 && (typeof _house IN ['Land_buildingsfiredept1','Land_buildingshospital1'])) then {
		_garage pushback "VVV_DodgeDurango_medic";
		_garage pushback "VVV_dodge_charger_medic";
	};

	if((player getvariable "ems" == 10 || 25 IN licenseArray || 26 IN licenseArray) && (str _house find "embarcadero" > -1) ) then { 
		_garage pushback "B_CBS_WaterShadow730_F";
		_garage pushback "B_Boat_Transport_01_F";
		_garage pushback "C_Scooter_Transport_01_F";
		_garage pushback "C_Boat_Civil_01_rescue_F";
		_garage pushback "B_T_Lifeboat";
	};

	if((player getvariable "ems" == 10 || 23 IN licenseArray || 24 IN licenseArray) && (typeof _house IN ['Land_buildingshospital1'] || str _house find "em_heliport" > -1)  ) then {
		_garage pushback "C_hh60j_unarmed_F";
		_garage pushback "GR_Bell412_1";
	};
	
};

if(myJob == "Mafia") then {
	_garage pushback "ivory_c_2";
	_garage pushback "VVV_Aston_Martin_1964_DB5";

	if(player getvariable "mafia" >= 6) then { 
	_garage pushback "VVV_Bentley_Arnage";
	};
};



if(myJob == "Mobster") then {
	_garage pushback "ivory_m3_2";
	_garage pushback "VVV_Cadillac_CTSV";

	if(player getvariable "mobster" >= 6) then { 
		_garage pushback "acj_Brinks";
	};
};

if(myJob == "Biker") then {
	_garage pushback "Acj_Harley_Davidson_Sons_Of_Anarchy";
	
	if(player getvariable "biker" >= 6) then { 
		_garage pushback "tortura_civ";
	};
};

if(Mayor) then {
	_garage pushback "shounka_limo_civ_noir";
};

else then {
	_garage pushback "nopixel_GMC_Campervan";
};

if(myJob == "DMV") then {
	_garage pushback "VVV_Alfa_Romeo_59";
	_garage pushback "VVV_Chevrolet_Impala";

	if(player getvariable "DMV" >= 6) then { 
	_garage pushback "ivory_r8_spyder";
	};
};

{
	_class = _x;
	_vehicleName = [_x] call Client_fnc_getVehicleName; 

	_veh = lbAdd [1500, format["%1",_vehicleName] ];
	lbSetData [1500, _veh, format["%1",Str(_x)]];

}forEach _garage;

lbSetCurSel [1500, 0];

packet=nil;