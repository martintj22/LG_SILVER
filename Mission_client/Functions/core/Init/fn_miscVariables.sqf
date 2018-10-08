/* ## https://community.bistudio.com/wiki/ListOfKeyCodes You're welcome! ## */
nonclimbables = ["Land_GateB","Land_GateA","Land_GateC"];
lastGovtUseWeapon = time;
lastGovtUseCar = time;
BJgameStarted = false;
BJGameStatus = false;
EM_allowed = FALSE;
em_allowed2 = true;
vehspawned = objNull;
theGunner = objNull;
acceptBail = [];
allowdance = false;
extraCash = 0;
adminLevel = 0;
AllowJob = true;
vaultrobber = false;
lastsync = time;
lastforcesync = time;
lastarrest = time;
bankrobber = 1;
mybank = ObjNull;
myjob = "none";
houseinvitation = ObjNull;
RadioConnections = [];
RadioConnected = [];
fires = [];
adminESP = false;
attachedbarrier = false;
barriers = [];
attachedfurniture = false;
paintballhit = false;
paintballing = false;
bedactive = false;
GoldTimer = time;
vehiclePressure = 0;
spikeAntispam = false;
radioGiven = false;
mayor = false;
senator = false;
Psenate = false;
savedcontainer = objNull;
current_cars = [];
endOfmission = [0,0,0];
mafiaVehicle = objNull;
mobsterVehicle = objNull;
bikerVehicle = objNull;
female = false;
dispatch = false;
currentlyUpdating = false;
tryingCall = false;
phonesRinging = false;
client_istazed = false;
phoneDisabled = false;
myCallOwner = player;
myPhoneCall = 0;
attachedcar = false;
attachedplayer = false;
imhealing = false;
mouseMovement = 3;
start_up = true;
mychairs = [];
client_seatbelt = false;
GodMode = false;
DeadPlayer = false;
DeadPhase = 0;
client_firstCombatActive = false;
imfishing = false;
myHealth = 0;
player setvariable["playerInjuriesToUpdate",[0,0,0,0,0,0,0,0,0,0,0],false];
has_job = false;
painIsActive = false;
message1_active = false;
message2_active = false;
message3_active = false;
message4_active = false;
message5_active = false;
message6_active = false;
myupdate = true;
busyPlayer = false;
client_gopro = false;
koildeb = 1;
koildebi = 1;
koildebii = 1;
koildebiii = 1;
koildebiiii = 1;
imRestrained = false;
im_dead = false; 
client_firstCombatActive = false; 
callInProgress = false; 
PhoneDisabled = false; 
client_fadeSound = false; 
ClientInterrupted = false;
ClientArrested = false;
client_pizza = 0; 
client_bro = 0; 
client_num = 0; 
client_crazy = 0; 
client_bonging = false; 
client_nos_count = 0;
mytrees = [];
mymetal = [];
myoil = [];
playertasks = []; 
taskrunning = false;
paycheck = 0;
bombs = [];
hackedcars = [];
TracingPlayers = []; 
speedChecked = false;
myTickets = 0;
myWarrants = 0;
mapHint = true;

client_fnc_cameraflash = compileFinal "
	ppEffect = ppEffectCreate ['ColorCorrections',2500];
	ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
	ppEffect ppEffectCommit 0.1;
	ppEffect ppEffectEnable true;
	ppEffect ppEffectForceInNVG true;
	uiSleep 0.2;
	ppEffectDestroy ppEffect;
";
client_fnc_speedchecked = compileFinal "
	speedChecked = true;
	uisleep 10;
	speedChecked = false;
";

client_fnc_keyBusyPlayer = compileFinal
"
	busyPlayer = true;
	uisleep 1;
	busyPlayer = false;
";
client_fnc_blindfolded = compileFinal
"
	blindfolded = true;
	""colorCorrections"" ppEffectEnable true;			
	""colorCorrections"" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
	""colorCorrections"" ppEffectCommit 0.3;
	oldheadgear = headgear player;
	removeHeadGear player;
	player addheadgear ""mgsr_headbag"";

	while{ blindfolded } do {
		if(headgear player != ""mgsr_headbag"") exitwith { 
			blindfolded = false;
			""colorCorrections"" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
			""colorCorrections"" ppEffectCommit 3;
			""colorCorrections"" ppEffectEnable false;	
		};
		sleep 1;
	};
	blindfolded = false;
	""colorCorrections"" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
	""colorCorrections"" ppEffectCommit 3;
	""colorCorrections"" ppEffectEnable false;	
";

client_fnc_unblindfolded = compileFinal
"
	blindfolded = false;
	""colorCorrections"" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
	""colorCorrections"" ppEffectCommit 3;
	""colorCorrections"" ppEffectEnable false;	
	removeHeadGear player;
	player addheadgear oldheadgear;
";

client_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

client_fnc_restrained = compileFinal
"
	attachedplayer = false;
	imRestrained = true;
	player switchmove """";
	uisleep 0.05;
	[player,""Acts_AidlPsitMstpSsurWnonDnon_loop""] remoteExec [""client_fnc_animSync""];

	while{imRestrained} do {

		if (animationstate player != ""Acts_AidlPsitMstpSsurWnonDnon_loop"" && !deadplayer && vehicle player == player) then {
			[player,""Acts_AidlPsitMstpSsurWnonDnon_loop""] remoteExec [""client_fnc_animSync""];
			uisleep 1;
		};
		if(vehicle player != player) then {
			if(driver (vehicle player) == player) then {
				player action[""eject"",vehicle player]
			};
		};

		uisleep 1;
	};
";

client_fnc_unrestrained = compileFinal
"
	imRestrained = false;
	player switchMove """";
	player setVariable ['surrender', nil, false];
";

KK_fnc_forceRagdoll = compileFinal
"
	if (vehicle player != player || godMode) exitWith {};
	private ""_rag"";
	godMode = true;
	player allowdamage false;
	_rag = ""Land_Can_V3_F"" createVehicleLocal [0,0,0];
	_rag setMass 1e10;
	_rag attachTo [player, [0,0,0], ""Spine3""];
	_rag setVelocity [0,0,5];
	detach _rag;
	0 = _rag spawn {
		deleteVehicle _this;
		uisleep 1;
		godMode = false;
		player allowdamage true;
	};
";

client_fnc_animSync = compileFinal
"
	private[""_unit"",""_anim""];
	_unit = param [0,ObjNull,[Objnull]];
	_anim = param [1,"""",[""""]];
	if(isNull _unit) exitWith {};
	_unit switchMove _anim;
";


doquickmsg = compileFinal
"
	disableSerialization;
	_message = _this select 0;
	_sound = _this select 1;
	if(_sound) then { player say ""slideout""; };
	20 cutRsc [""RSC_DOMSG7"",""PLAIN""];
	_POPUPCLASS7 = uiNameSpace getVariable [""RSC_DOMSG7"",displayNull];
	_POPUP = _POPUPCLASS7 displayCtrl 13377;
	_POPUP ctrlSetStructuredText parseText format[""%1"",_message];
";

cantbet = false;
starthorses = {
	cantbet = true;
	31 cutRsc ["RSC_horsey1","PLAIN"];
	32 cutRsc ["RSC_horsey2","PLAIN"];
	33 cutRsc ["RSC_horsey3","PLAIN"];
	34 cutRsc ["RSC_horsey4","PLAIN"];	
	35 cutRsc ["RSC_horsey5","PLAIN"];	
	36 cutRsc ["RSC_horsey6","PLAIN"];	
	37 cutRsc ["RSC_horsey7","PLAIN"];
};

endhorses = {
	cantbet = false;
	31 cutfadeout 3; 
	32 cutfadeout 3; 
	33 cutfadeout 3; 
	34 cutfadeout 3; 
	35 cutfadeout 3; 
	36 cutfadeout 3; 
	37 cutfadeout 3;
};

horsey1 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;

	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey1",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69691;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};

horsey2 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;

	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey2",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69692;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};



horsey3 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;
	_blah = 5;
	
	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey3",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69693;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];	

	while {_blah > 0} do {

		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [ _old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;

	};
};

horsey4 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;

	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey4",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69694;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};

horsey5 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;
	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey5",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69695;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};


horsey6 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;
	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey6",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69696;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};

horsey7 = {
	disableSerialization;
	_distance = _this select 0;
	_lastknown = _this select 1;
	_horsename = _this select 2;
	_POPUPCLASS1 = uiNameSpace getVariable ["RSC_horsey7",displayNull];
	_POPUP = _POPUPCLASS1 displayCtrl 69697;
	_POPUP ctrlSetStructuredText parseText format[" | %1",_horseName];
	_blah = 5;
	while {_blah > 0} do {
		_pos = ctrlPosition _POPUP;
		_old = (_pos select 0);
		_POPUP ctrlSetPosition [_old + (_distance * 0.0025), _pos select 1, _pos select 2, _pos select 3];
		_POPUP ctrlCommit 0;
		uisleep 0.05;
		_blah = _blah - 1;
	};
};






domsg = {
	disableSerialization;
	_message = _this select 0;
	
	player createDiaryRecord ["Diary", ["Notifications", _message]];

	_sound = _this select 1;
	while{true} do {
		if(!message1_active) exitwith {
			if(_sound) then { player say "slideout"; };
			11 cutRsc ["RSC_DOMSG1","PLAIN"];
			_POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOMSG1",displayNull];
			message1_active = true;
			_POPUP = _POPUPCLASS1 displayCtrl 13371;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message1_active = false;
		};

		if(!message2_active) exitwith {
			if(_sound) then { player say "slideout"; };
			12 cutRsc ["RSC_DOMSG2","PLAIN"];
			_POPUPCLASS2 = uiNameSpace getVariable ["RSC_DOMSG2",displayNull];
			message2_active = true;
			_POPUP = _POPUPCLASS2 displayCtrl 13372;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message2_active = false;
		};

		if(!message3_active) exitwith {
			if(_sound) then { player say "slideout"; };
			13 cutRsc ["RSC_DOMSG3","PLAIN"];
			_POPUPCLASS3 = uiNameSpace getVariable ["RSC_DOMSG3",displayNull];
			message3_active = true;
			_POPUP = _POPUPCLASS3 displayCtrl 13373;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message3_active = false;
		};	

		if(!message4_active) exitwith {
			if(_sound) then { player say "slideout"; };
			14 cutRsc ["RSC_DOMSG4","PLAIN"];
			_POPUPCLASS4 = uiNameSpace getVariable ["RSC_DOMSG4",displayNull];
			message4_active = true;
			_POPUP = _POPUPCLASS4 displayCtrl 13374;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message4_active = false;
		};	

		if(!message5_active) exitwith {
			if(_sound) then { player say "slideout"; };
			15 cutRsc ["RSC_DOMSG5","PLAIN"];
			_POPUPCLASS5 = uiNameSpace getVariable ["RSC_DOMSG5",displayNull];
			message5_active = true;
			_POPUP = _POPUPCLASS5 displayCtrl 13375;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message5_active = false;
		};	

		if(!message6_active) exitwith {
			if(_sound) then { player say "slideout"; };
			16 cutRsc ["RSC_DOMSG6","PLAIN"];
			_POPUPCLASS6 = uiNameSpace getVariable ["RSC_DOMSG6",displayNull];
			message6_active = true;
			_POPUP = _POPUPCLASS6 displayCtrl 13376;
			_POPUP ctrlSetStructuredText parseText format["%1",_message];
			sleep 8.5;
			_blah = 20;
			while{_blah > 0} do {
				_pos = ctrlPosition _POPUP;
				_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
				_POPUP ctrlCommit 0;
				uisleep 0.05;
				_blah = _blah - 1;
			};
			message6_active = false;
		};
		
		sleep 0.05;
	};
};

//event handlers - lets drive it off one event instead of multiple, okay? okay.





player addEventHandler["put", {

	
		if(myJob != "Cop" && myJob != "EMS") then {
			_loadout = getunitloadout player;
			_isPack = getNumber(configFile >> "CfgVehicles" >> (_this select 2) >> "isBackpack");
			_attempt = isClass (ConfigFile >> "CfgWeapons" >> (_this select 2));
			if(_attempt || _isPack == 1 || _this select 2 IN ["Fish_Mackerel_7", "Fish_Tuna_7", "Fish_Trout_Rare", "Fish_Shark_Rare","NP_DrugTable","NP_GrowingPlot","CG_Dynamite","CG_C4","CG_Engine","CG_wheel","CG_HackingTool","CG_Lockpick","CG_MetalWire","NP_drillitem","NP_Wood","np_copperbar1","np_ironbar1","np_silverbar1","CG_OilCanister","NP_kPelt"]) then {	[player, "getunitloadout", _loadout] remoteExec ["Server_fnc_setVariable",2]; };
		};
		if(uniform player == "" && female) then {
		player forceadduniform "female_default_1";
		if(_this select 2 == "female_default_1") then {
		_container = _this select 1;
		_thecargo = getitemCargo _container;
		clearitemcargoglobal _container;
		_process = _thecargo select 0;
		_container = createVehicle ["groundWeaponHolder", getpos player, [], 0, "can_collide"];
			if(!isnil "_process") then {
				_count = 0;
				{
				_ItemCount = _myweapons select 1;
				_itemNumber = _ItemCount select _count;
					if(_x != "female_default_1") then {
						_container addItemCargoGlobal [_x,_itemnumber];
					}; 
				_count = _count + 1;
				} foreach _process;
			};
		};
	};
}];
 


player addEventHandler["Fired",{_this call client_fnc_handleFired;}];
//player addEventHandler["FiredNear",{_this call client_fnc_handlefiredNear;}];
player addEventHandler["handleDamage", { _this spawn Client_fnc_handleDamage; false } ];

client_ID_PlayerTags = ["client_PlayerTags","onEachFrame","client_fnc_nametags"] call BIS_fnc_addStackedEventHandler; 

turboVehicleList = [ 

"ivory_190e_tuned3",

"ivory_rs4_tuned3",

"ivory_c_tuned3",

"ivory_e36_tuned3",

"ivory_m3_tuned3",

"ivory_evox_tuned3",

"ivory_r34_tuned3",

"ivory_isf_tuned3",

"ivory_lfa_tuned3",

"ivory_elise_tuned3",

"ivory_gt500_tuned3",

"ivory_supra_tuned3",

"ivory_gti_tuned3",

"ivory_wrx_tuned3" ];




upgradeVehicleList = [ "ivory_190e_tuned1",

"ivory_rs4_tuned1",

"ivory_c_tuned1",

"ivory_e36_tuned1",

"ivory_m3_tuned1",

"ivory_evox_tuned1",

"ivory_r34_tuned1",

"ivory_isf_tuned1",

"ivory_lfa_tuned1",

"ivory_elise_tuned1",

"ivory_gt500_tuned1",

"ivory_supra_tuned1",

"ivory_gti_tuned1",

"ivory_wrx_tuned1",






"ivory_190e_tuned2",

"ivory_rs4_tuned2",

"ivory_c_tuned2",

"ivory_e36_tuned2",

"ivory_m3_tuned2",

"ivory_evox_tuned2",

"ivory_r34_tuned2",

"ivory_isf_tuned2",

"ivory_lfa_tuned2",

"ivory_elise_tuned2",

"ivory_gt500_tuned2",

"ivory_supra_tuned2",

"ivory_gti_tuned2",

"ivory_wrx_tuned2",





"ivory_190e_tuned3",

"ivory_rs4_tuned3",

"ivory_c_tuned3",

"ivory_e36_tuned3",

"ivory_m3_tuned3",

"ivory_evox_tuned3",

"ivory_r34_tuned3",

"ivory_isf_tuned3",

"ivory_lfa_tuned3",

"ivory_elise_tuned3",

"ivory_gt500_tuned3",

"ivory_supra_tuned3",

"ivory_gti_tuned3",

"ivory_wrx_tuned3" ];




