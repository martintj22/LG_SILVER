private ["_myOre","_level_check"];
_rock = cursorobject;

if(player getVariable["JailTracked",FALSE] && cursorobject distance player < 25) exitwith { 
	playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl player, 3, 1, 15]; 

	if (random(45) > 41 && secondsLeft > 45) then { 

	_removeamount = 0.45;

	if (((client_level_array select 15) / 100) > -1 && ((client_level_array select 15) / 100) < 2 ) then { _removeamount = 0.7; };

	if (((client_level_array select 15) / 100) > 1 && ((client_level_array select 15) / 100) < 3 ) then { _removeamount = 1; };

	if (((client_level_array select 15) / 100) > 2 ) then { _removeamount = 1.4; };


		if(player distance [5545.74,6291.12,0.00143433] > 1500) then { 
			secondsLeft = secondsLeft - round(45 * _removeamount); ["Your time has been lowered by 45 seconds", true] spawn domsg; 
			["govtBank",150, "Add"] remoteExec["server_fnc_setValue",2];  
			["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, 150 call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
		} else { 
			secondsLeft = secondsLeft - round(25 * _removeamount); ["Your time has been lowered by 25 seconds", true] spawn domsg; 
			["govtBank",70, "Add"] remoteExec["server_fnc_setValue",2];  
			["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, 70 call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
		};	
	}; 

};

if((getposATL player) distance (getposATL _rock) > 25) exitwith {};
if ((str _rock find ": w_sharprock" > -1 || str _rock find ": bluntrock" > -1 || str _rock find "Cover_" > -1) && player distance [2123.79,8750.29,0.00143909] < 3000) then {   
	if(_rock IN myoil) exitwith { ["There are no resources in this rock!", true] spawn domsg; };
	_sound = round(random 5);
	switch(_sound) do {
		case 0: {
			playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 1: {
			playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 2: {
			playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 3: {
			playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 4: {
			playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		default {
			playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl player, 3, 1, 15];
		};		 				 				 		
	};
	 _CutChance = round(random 10);

	if(_CutChance > 8) then {	

		myoil pushback _rock;
		[_rock] spawn {
			params["_rock"];
			uisleep 600;
			myoil = myoil - [_rock];
		};

		_level_check = (client_level_array select 11);
		if(_level_check > -1 && _level_check < 300) then { player additem "CG_OilBarrel"; };
		if(_level_check > 299 && _level_check < 600) then { player additem "CG_OilBarrel"; player additem "CG_OilBarrel"; };
		if(_level_check > 599) then { player additem "CG_OilBarrel"; player additem "CG_OilBarrel"; player additem "CG_OilBarrel"; };

		["You found an oil deposit!", true] spawn domsg;
	};	

};

if ( (str _rock find ": w_sharprock" > -1 || str _rock find ": bluntrock" > -1 || str _rock find "Cover_" > -1) && player distance [3925.83,2800.64,0.00206757] < 1000 ) then {   
	if(_rock IN mymetal) exitwith { ["There are no resources in this rock!", true] spawn domsg;  };
	_sound = round(random 5);
	switch(_sound) do {
		case 0: {
			playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 1: {
			playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 2: {
			playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 3: {
			playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		case 4: {
			playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl player, 3, 1, 15];
		};
		default {
			playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl player, 3, 1, 15];
		};		 				 				 		
	};
	 _findchance = round(random 20);

	if(_findchance < 2) then {			
		["Add","Karma",1,"Strength"] call client_fnc_sustain;
	};

	if(_findchance > 9) then {	
		mymetal pushback _rock;
		[_rock] spawn {
			params["_rock"];
			uisleep 600;
			mymetal = mymetal - [_rock];
		};
		 _myOre = "np_copperore1";
		 if(_findchance < 14 && _findchance > 9) then { _myOre = "np_copperore1"; };
		 if(_findchance < 19 && _findchance > 15) then { _myOre = "np_ironore1"; };
		 if(_findchance > 18) then { _myOre = "np_silverore1"; };

		_level_check = (client_level_array select 11);
		if(_level_check > -1 && _level_check < 300) then { player additem _myOre; };
		if(_level_check > 299 && _level_check < 600) then { player additem _myOre; };
		if(_level_check > 599) then { player additem _myOre; };

		


		["You found some ore!", true] spawn domsg;
	};	
};	
