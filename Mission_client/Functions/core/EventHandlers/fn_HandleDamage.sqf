/*
Handle Damage by Koil
*/
params ["_unit","_selectionName","_damage","_source","_projectile","_hitPartIndex"];

if(deadPlayer) exitwith { 
	
	if (deadPhase == 1) then {
		_unit setVariable ["tf_voiceVolume", 0, true];
		[_unit, "UnconsciousReviveDefault"] remoteExec["switchMove"];
		deadPhase = 2;

		for [{_x=1},{_x<=25},{_x=_x+1}] do {   
		
			[] call client_Fnc_huddamaged; 
		
		};
		
		[] spawn {

			cutText ["YOU ARE NOW UNCONSCIOUS. YOU ARE NOT ABLE TO TALK.","PLAIN"]; 
			sleep 10;
			0 cutFadeOut 5;

		};
	};

	false 
	
};

if(godMode) exitwith { false };

if(!isNull _source) then {

	if(typeof _source == "NP_DrugTable") then { _damage = 0; };

	if(_source != _unit) then {

		if (vehicle _unit == _unit) then
		{
			_vehicle = vehicle _source;
		    if ( _vehicle isKindOf "Air" || _vehicle isKindOf "Car" || _vehicle isKindOf "Boat" ) then
		    {
		    	if(typeof _vehicle == "B_MRAP_01_hmg_F") exitwith {};
				_speed = speed _vehicle;
				[] spawn KK_fnc_forceRagdoll;
				if(_speed < 70) then { _damage = 0.1; }; 
				if(_speed < 25) then { _damage = 0; }; 
				if(_speed > 69) then { _damage = _speed / 100; };
		    };
		};

		_curWep = currentWeapon _source;

		if(paintballing && _source != player && _curWep in ["Weapon_angel_F","Weapon_angel_rasta_F","Weapon_egosl_F","Weapon_angel_kitty_F","Weapon_invert_mini_dye_F","Weapon_tippmann_x7_F","Weapon_tippmann_x7_UMP_F"] && !paintballhit) then {
			paintballhit = true;
			if(!godmode && _selectionName == "") then {
				godmode = true;
				[2] remoteexec ["client_fnc_paintball",_source];
			};
			[] SPAWN {
				sleep 1;
				godmode = false;
			};
			_damage = 0;
		};

		if(_curWep in ["CG_CROSS","CG_BATON","CG_TELBAT","CG_BAT","CG_SHOVEL"] && vehicle player == player) exitwith {
			[_unit,_source] spawn client_fnc_blunthit;
			_damage = 0;
		};

		if(_curWep in ["cg_scythe","CG_PICKAXE","cg_hatchet","cg_machete"] && vehicle player == player && !(_source getVariable["JailTracked",FALSE])) exitwith {
			[_unit,_source] spawn client_fnc_sharphit;
			_damage = 0;
		};

		if(_curWep == "arifle_SDAR_F" && vehicle player == player && vehicle _source == _source) exitwith {
			[_unit,_source] spawn client_fnc_tazed;
			_damage = 0;	
		};

		if(_curWep == "Taser" && vehicle player == player && vehicle _source == _source) exitwith {
			if(player distance _source < 10 && uniform player != "nopixel_character_swat") then {
				[_unit,_source] spawn client_fnc_tazed;
			};
			_damage = 0;	
		};

	} else {
		_isWater = surfaceIsWater (getPosASL player);
		if(_isWater) then { player setOxygenRemaining 1; _damage = 0.05; };		
	};
};

if(paintballing && _source != player && currentWeapon _source in ["Weapon_angel_F","Weapon_angel_rasta_F","Weapon_egosl_F","Weapon_angel_kitty_F","Weapon_invert_mini_dye_F","Weapon_tippmann_x7_F","Weapon_tippmann_x7_UMP_F"] ) exitwith { false };



/* wtf is this lmao

if(client_unhealthiness < 60 || client_meth > 0 || client_heroin > 0 || client_cocaine > 0 || client_marijuana > 0) then {
	_damage = _damage / 2;
};

*/



if(_selectionName == "") then {


		if(!isNull _source) then {

			if(isPlayer _source && _source != player) then {

				// if(_damage > 1 && _damage < 1.5) then { _damage = 0.75; }; testing this 

				if(uniform player == "nopixel_character_swat") exitWith { _damage = _damage / 3; };

				if(client_meth > 0) exitWith { _damage = _damage / 2; };

				if (((client_level_array select 11) / 100) > 2 ) exitWith { _damage = _damage / 1.7; };
				
				if (((client_level_array select 11) / 100) > 1 && ((client_level_array select 11) / 100) < 3 ) exitWith { _damage = _damage / 1.5; };

				if (((client_level_array select 11) / 100) > -1 && ((client_level_array select 11) / 100) < 2 ) exitWith { _damage = _damage / 1.2; };

			};

			[] spawn Client_fnc_huddamaged;
		};

	["Remove",_damage,_source] spawn Client_Fnc_DoHealth;
	
} else {

	if(!isNull _source && isPlayer _source && _source != _unit && _damage > 0.05) then {	
		if(clientarrested && currentweapon player == "") then { _damage = 0; } else { [_damage,_selectionName,_source] spawn client_fnc_damageChance; };
		//[] call fnc_firstPersonForced;
	} else {
		_source = player;
		if(_damage > 0.85) then { [_damage,_selectionName,_source] spawn client_fnc_damageChance; };
	};

};

false