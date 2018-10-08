params ["_object","_type"];
private ["_vehspawn","_veh","_endmission","_boat"];

if(_type == 1) then {
	_boat = "b_boat_armed_01_minigun_f";
} else {
	_boat = "C_Rubberboat";
};

_oreArray = ["np_goldbar"];

if(isNil "globalProtection") then { globalProtection = 0; };
if(globalProtection != 0) exitwith { ["Error - Already processing", true] spawn domsg; };
_localProtection = 0;

_thecargo = getmagazineCargo mobsterVehicle;

clearmagazinecargoGlobal mobsterVehicle;

_holder = mobsterVehicle;

_process = _thecargo select 0; 
_ItemCount = _thecargo select 1;

_totalValue = 0;

if(!isnil "_process") then {
	_count = 0;
	{ 

		_localProtection = _localprotection + 1;
		globalProtection = globalProtection + 1;
		if(_localProtection != globalProtection) exitwith { [1,"Boat Drop Off"] spawn client_fnc_anticheat; };

		_itemNumber = _ItemCount select _count;
		 if !(_x IN _oreArray) then {
			_holder addMagazineCargoGlobal [_x,_itemnumber];
			_count = _count + 1;
			uisleep 0.05;
		} else {
			_n = _oreArray FIND _x;

			_totalValue = _itemNumber;

			_count = _count + 1;
			playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl player, 31, 1, 15];
			uisleep 1.5;
		};
	} foreach _process; 
};

globalProtection = 0;

_vehspawn = [6508.71,958.539,2.1914];

_veh = createVehicle [_boat,_vehspawn,[],0,"NONE"];
_veh setpos _vehspawn;
[_veh, 2] remoteExec["lock"];
current_cars pushBack _veh;

_roll1 = [0,0,0];
_roll2 = [0,0,0];	
if(random(5) > 3) then { _roll1 = 8311.28 + random(800); } else { _roll1 = 8311.28 - random(800);  };
if(random(5) > 3) then { _roll2 = 946.567 + random(800); } else { _roll2 = 946.567 - random(800);  };
_endmission = [_roll1,_roll2,0];

theGunner = createVehicle ["Lexx_ContainerShip_Black_Loaded_H",_endmission,[],0,"NONE"];
theGunner setpos _endmission;
[theGunner, 2] remoteExec["lock"];
publicVariable "theGunner";

theGunner setVehicleAmmo 0;

[_vehspawn,_endmission,currentMobster,_veh] remoteexec ["client_fnc_mobsterOreJob",currentMobster];
_veh addMagazineCargoGlobal  ["np_goldbar2", _totalValue ];

deletevehicle mobsterVehicle;

if(_type == 1) then {
	["En stærkt bevæbnet båd er set i Silver Lake.", true] remoteExec ["domsg", currentcop];
	["En stærkt bevæbnet båd er set i Silver Lake.", true] remoteExec ["domsg", currentcop];
	["En stærkt bevæbnet båd er set i Silver Lake.", true] remoteExec ["domsg", currentcop];
	["En stærkt bevæbnet båd er set i Silver Lake.", true] remoteExec ["domsg", currentcop];
	["En stærkt bevæbnet båd er set i Silver Lake.", true] remoteExec ["domsg", currentcop];
};