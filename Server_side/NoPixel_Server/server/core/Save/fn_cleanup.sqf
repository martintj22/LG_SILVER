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

