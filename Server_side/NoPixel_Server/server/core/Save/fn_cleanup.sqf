_chance = random 100;

if(isNil "carArray") then { carArray = []; };

if(isNil "carPosition") then { carPosition = []; };

{  
	if (typeof _X == "Sign_Circle_F") exitwith { deletevehicle _x; };	
	_nearc = nearestObjects[getPos _x,["Man"],55];
	if( ( (count _nearc) == 0 && (count crew _x) == 0 && isNull driver vehicle _x && isNull attachedTo _x) || getdammage _x > 0.9) then  
	 {  
	 	if(_x in carArray) then {

	 		_pia = cararray FIND _x;
	 		_location = carposition SELECT _pia;
	 		cararray deleteAT _pia; carposition deleteAT _pia;
	 		if(_x distance _location < 5) then { 
 
	 		_information = _x getVariable "information";
	 		if(!isNil "_information") then {
				_license = _information select 0;
				_newdamage = ((getAllHitPointsDamage _x) select 2);
				_newfuel = fuel _x;
				[_newdamage,_newfuel,_license] remoteexec ["server_fnc_updateCarDamages",2];
			};

	 			deletevehicle _x; 
	 			
	 		};
	 	} else {
	 		cararray pushback _x;
	 		carposition pushback getpos _x;
	 	};

	 };   
} foreach vehicles;

_fireLocations = [
	[7078.03,2458.97,0.00143814],
	[8144.45,2722.83,0.00143814],
	[6297.41,2258.22,0.00129509],
	[1006.11,684.793,0.00128055],
	[1026.12,7603.83,0.00143814],
	[8665.71,7022.39,0.00143814],
	[8811.38,7631.46,0.00143814],
	[9542.11,8871.72,0.00143909],
	[9544.25,7038.7,0.00144196],
	[9586.66,6246.01,0.0018158],
	[7971.18,5096.54,0.00143814],
	[6712.37,4624.75,0.00143909],
	[3309.07,4556.19,0.00144196],
	[3113.87,4616.96,0.0014267],
	[2551.75,1455.78,0.00144196]
];
_fire = _fireLocations call bis_fnc_selectRandom;
[_fire] spawn server_fnc_fireStart;

_dateHour = date select 3;
if (6 < _dateHour && _dateHour< 18) then {
    setTimeMultiplier 12;
} else {
    setTimeMultiplier 24;
};


_list = (allMissionObjects "WeaponHolder") + 
	(allMissionObjects "GroundWeaponHolder") + 
	(allMissionObjects "WeaponHolderSimulated") + 
	(allMissionObjects "SmokeShell") +
	(allMissionObjects "CraterLong") +
	(allMissionObjects "CraterShort") +
	(allMissionObjects "StaticWeapon") +
	(allMissionObjects "test_EmptyObjectForFireBig") +
	(allMissionObjects "Default");

{
	_nearestc = _x nearEntities ["man", 50];
	if(((count _nearestc) == 0)) then 
	{
		deleteVehicle _x;
	};
} forEach _list;

