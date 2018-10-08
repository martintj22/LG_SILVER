params ["_type","_number","_player","_pos"];
private ["_vehspawn","_veh","_endmission"];

if(count allplayers < 10) exitwith { ["Der skal være mere end 10 players for at starte et drug run.", true] spawn domsg;};
	
if(isNil "drugcount") then { drugcount = 0; };

if(_type == 1) then { drugcount = drugcount + _number; } else { drugcount = drugcount - _number; };

if(drugcount > 100) then {

	drugcount0 = 0;

	_endmission = [9792.52,3033.02,0.00204182];

	_vehspawn = [8863.53,7601.63,0.00143814];

	_veh = createVehicle ["ADM_GMC_Vandura",_vehspawn,[],0,"NONE"];

	[_veh, ["white","glossy"]] remoteexec ["client_fnc_ivoryInitVehicle",2];

	_veh addMagazineCargoGlobal  ["CG_Heroin", 20 ];

	_veh lock 2;

	[_vehspawn,_endmission,currentMafia,_veh] spawn client_fnc_mafiaDrugEvent;

};