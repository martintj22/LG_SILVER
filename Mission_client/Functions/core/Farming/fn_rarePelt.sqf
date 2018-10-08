["Processing", true] spawn domsg;

if(isNil "peltProtection") then { peltProtection = 0; };

if ("NP_kPelt" IN (magazines player)) then {

	peltProtection = peltProtection + 1;

	 _chance = round(random(100));
	player removeitem "np_kpelt";
	["Here is a box I found, search it!",false] spawn domsg;



	if(_chance > 70) then {
		_luckisaskill = "plp_ct_woodboxlightbig" createVehicleLocal (getpos player); 
		player disablecollisionwith _luckisaskill;
		_nvgArray = ["TRYK_Headset_NV","TRYK_bandana_NV","TRYK_Headphone_NV","TRYK_G_Shades_Black_NV","TRYK_G_Shades_Blue_NV","TRYK_TAC_EARMUFF_SHADE"];
		_nvg = selectRandom _nvgArray;
		_luckisaskill setpos (getposATL player);	
	    _luckisaskill addItemCargoGlobal [_nvg, 2];	
	} else {
		_rods = ["epic_fishing_rod","platinum_fishing_rod","legendary_fishing_rod","gold_fishing_rod"];
		_myrod = _rods call BIS_FNC_SELECTRANDOM;
		_luckisaskill = "plp_ct_woodboxlightbig" createVehicleLocal (getpos player); 
		player disablecollisionwith _luckisaskill;
		_luckisaskill setpos (getposATL player);	
	    _luckisaskill addWeaponCargoGlobal [_myrod,1];
	};
	[] spawn { sleep 1; peltprotection = 0; };

	if(peltProtection > 1) then { removeuniform player; removevest player; removebackpack player; peltprotection = 0; };

	_loadout = getunitloadout player;
	
	[player, "getunitloadout", _loadout] remoteExec ["Server_fnc_setVariable",2]; 

} else {
	["I only trade for rare pelts.",false] spawn domsg;
};