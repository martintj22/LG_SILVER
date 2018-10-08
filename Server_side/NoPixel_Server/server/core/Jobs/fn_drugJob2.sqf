params ["_type","_number","_player","_pos"];
private ["_vehspawn","_veh","_endmission","_amount"];

if(count allplayers < 5) exitwith { ["Not enough players to add to event..", true] remoteExec["domsg", currentBiker]; };
	
if(isNil "drugcount2") then { drugcount2 = 0; };

if(_type == 1) then { drugcount2 = drugcount2 + _number; } else { drugcount2 = drugcount2 - _number; };

publicVariable "drugcount2";

if(drugcount2 >= 375) then {

		drugcount2 = 0;
		publicVariable "drugcount2";

		_endmission = [1309.54,1164.09,0.00143814];

		_vehspawn = [8863.53,7601.63,0.00143814];

		_veh = createVehicle ["ADM_GMC_Vandura",_vehspawn,[],0,"NONE"];

		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;

		_veh addMagazineCargoGlobal  ["CG_Heroin", 90];

		_veh lock 2;



		[_vehspawn,_endmission,currentBiker,_veh] remoteexec ["client_fnc_mafiaDrugEvent",currentBiker];

} else {

	[format["%1 drugs have been added to the dump. (375 Needed)", drugcount2], true] remoteExec["domsg", currentBiker];

};

