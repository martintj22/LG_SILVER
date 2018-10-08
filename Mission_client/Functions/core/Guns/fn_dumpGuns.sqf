_class1 = 
[
	"CUP_launch_RPG7V", 
	"CUP_glaunch_6G30",
	"arifle_mas_ww2_m1g", 
	"arifle_mas_ww2_mos",
	"arifle_mas_ww2_ppsh", 
	"arifle_mas_ww2_sten",
	"RH_tec9",
	"RH_muzi",
	"CUP_smg_bizon",
	"RH_fn57",
	"RH_Deagleg",
	"RH_Deagles"
];

_class2 = 
[
	"CUP_hgun_MicroUzi",
	"CUP_hgun_SA61",
	"RH_g18",
	"RH_tec9",
	"RH_muzi",
	"CUP_hgun_MicroUzi",
	"CUP_hgun_SA61",
	"RH_g18",
	"arifle_mas_ww2_tommy",
	"arifle_mas_ww2_mp40"
];

_class3 = 
[
	"CUP_srifle_CZ550_rail",
	"arifle_mas_ww2_kar98",
	"CUP_srifle_LeeEnfield_rail",
	"CUP_sgun_AA12",
	"CUP_lmg_Mk48_des"
];

_class4 = 
[
	"CUP_hgun_Makarov",
	"CUP_hgun_PB6P9",
	"CUP_hgun_M9",
	"CUP_hgun_TaurusTracker455",
	"hgun_mas_ww2_tt33_F",
	"RH_uspm",
	"RH_kimber"
];

_class5 = 
[
	"hgun_mas_ww2_acp_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_ACPC2_F",
	"hgun_mas_ww2_bhp_F",
	"sab_1911_handgun",
	"CUP_hgun_Compact",
	"hgun_mas_ww2_lug_F"
];
	
_total = 0;
_cashout = 0;

{
	_weapon = _x;
	if(_weapon IN _class1) then { _cashout = _cashout + 145; player removeWeapon _weapon; _total = _total + 1; };
	if(_weapon IN _class2) then { _cashout = _cashout + 125; player removeWeapon _weapon; _total = _total + 1; };
	if(_weapon IN _class3) then { _cashout = _cashout + 110; player removeWeapon _weapon; _total = _total + 1; };
	if(_weapon IN _class4) then { _cashout = _cashout + 90; player removeWeapon _weapon; _total = _total + 1; };
	if(_weapon IN _class5) then { _cashout = _cashout + 70; player removeWeapon _weapon; _total = _total + 1; };	

} forEach weapons player;

if(myjob == "Biker") then { _cashout = _cashout * 2.25 };

[_cashout,true,true] call Client_fnc_addMoneyToPlayer;

["You made %1 from this drug run.",_cashout call client_fnc_numberText, true] spawn domsg;

if(myJob != "Biker") exitwith {};
[1,_total,player,getpos player] remoteExec ["server_fnc_gunJob",2];



