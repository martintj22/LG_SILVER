[] spawn {

private["_pos1","_pos2"];

if(count allplayers < 50) exitwith {};
["A loot supply package will drop in 2 minutes!", true] remoteExec ["domsg",-2];

UISLEEP 60;

["A loot supply package will drop in 1 minute!", true] remoteExec ["domsg",-2];

UISLEEP 60;

["A loot supply package has been dropped on the island!", true] remoteExec ["domsg",-2];
_error = false;
_n=0;
while{true} do {
	_pos1 = 0 + random (8000);
	_pos2 = 0 + random (8000);
	_isWater = surfaceIsWater [_pos1,_pos2,0];
	if (!_isWater) exitwith {};
	_n = _n + 1;
	if(_n > 30) exitwith { _error = true; };
	uisleep 0.05;
};
if(_error) exitwith {};





_markerstr1 = createMarker ["lootdrop",[_pos1,_pos2]];
_markerstr1 setMarkerShape "RECTANGLE";
_markerstr1 setmarkercolor "ColorRed"; 
_markerstr1 setMarkerSize [200,200];

_markerstr2 = createMarker ["openfire",[_pos1,_pos2]];
_markerstr2 setMarkerShape "ICON";
_markerstr2 setMarkerType "hd_dot";
_markerstr2 setmarkertext "OPEN FIRE AREA";

_luckisaskill = "plp_ct_woodboxlightbig" createVehicle [0,0,2000];

_luckisaskill setPos [_pos1,_pos2,1350];

_chance = random(100);

if(_chance > 98) then {

	_luckisaskill addWeaponCargoGlobal ["hlc_rifle_ak47",1];
	_luckisaskill addMagazineCargoGlobal ["hlc_30Rnd_762x39_b_ak",20];

};

if(_chance < 99 && _chance > 85) then {
	_luckisaskill addItemCargoGlobal ["CG_OilCanister",random(15)];
};

if(_chance < 86 && _chance > 65) then {
	_luckisaskill addItemCargoGlobal ["np_ironbar1",random(25)];
	_luckisaskill addItemCargoGlobal ["NP_Wood",random(55)];
};

if(_chance < 66 && _chance > 45) then {
	_luckisaskill addItemCargoGlobal ["np_silverbar1",random(20)];
};

if(_chance < 46 && _chance > 35) then {
	_luckisaskill addItemCargoGlobal ["np_copperbar1",random(25)];
	_luckisaskill addItemCargoGlobal ["NP_Wood",random(55)];
};

if(_chance < 36 && _chance > 15) then {
	_luckisaskill addItemCargoGlobal ["TRYK_balaclava_BLACK_NV",random(2)];
	_luckisaskill addItemCargoGlobal ["TRYK_bandana_NV",random(2)];
	_luckisaskill addItemCargoGlobal ["TRYK_Shemagh_shade_WH_N",random(2)];
};

if(_chance < 16) then {
	_luckisaskill addItemCargoGlobal ["vvv_character_batman",3];
	_luckisaskill addItemCargoGlobal ["vvv_traje_dallas",3];
	_luckisaskill addItemCargoGlobal ["vvv_character_sub_zero",3];
};

_luckisaskill SPAWN KK_fnc_paraDrop;

_n = 0;

	while{true} do {

		_flrObj = "F_40mm_Yellow" createvehicle [_pos1,_pos2,300]; 
		_smoke = "SmokeShellBlue" createVehicle [_pos1,_pos2,300];
		_smoke setVelocity [0,0,-5];
		_flrObj setVelocity [0,0,-5];

		uisleep 15;

		if(_n == 20) exitwith {};
		_n = _n + 1;

	};





sleep 600;

deleteMarker "lootdrop";

deleteMarker "openfire";

};

