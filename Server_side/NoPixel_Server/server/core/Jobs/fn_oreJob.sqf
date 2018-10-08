params ["_type","_number","_player","_pos"];
private ["_vehspawn","_veh","_endmission"];


if(isNil "oreCount") then { oreCount = 0; };

if(_type == 1) then { oreCount = oreCount + _number; } else { oreCount = oreCount - _number; };

publicVariable "oreCount";

if(oreCount >= 200) then {

		_vehspawn = [6812.31,4598.71,5.71154];
		_dir = 90;
		_endmission = [6363.42,687.278,0.00143909];

		_veh = createVehicle ["acj_Brinks",[0,0,5401],[],0,"NONE"];
		
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;

		_veh setdir _dir;
		_veh setpos _vehspawn;
		
		_veh addMagazineCargoGlobal  ["np_goldbar", 200];
		_veh lock 2;

		oreCount = 0;
		publicVariable "oreCount";

		[_vehspawn,_endmission,currentMobster,_veh] remoteexec ["client_fnc_mobsterOreJob",currentMobster];

} else {

	[format["%1 gold bars have been added to the reserve. (200 Needed)", oreCount], true] remoteExec["domsg", currentMobster];

};