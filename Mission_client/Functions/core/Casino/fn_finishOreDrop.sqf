//[6493.03,949.169,7.26075]
params["_object"];

disableSerialization;

_success = true;
_error = "Success";
_timeLeft = 480;
_task = "Dumping";

21 cutRsc ["RSC_dotask","PLAIN"];
_POPTASK = uiNameSpace getVariable ["RSC_dotask",displayNull];
_POPUP = _POPTASK displayCtrl 9119;
_POPUP ctrlSetStructuredText parseText format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.9'>%1</t> <br/> <t size='2'>%2</t>",_task,_timeLeft];

while{true} do {

	_timeLeft = _timeLeft - 1;
	_POPUP ctrlSetStructuredText parseText format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.9'>%1</t> <br/> <t size='2'>%2</t>",_task,_timeLeft];
	if(_timeLeft == 0) exitwith {};

	if((getposATL player) distance theGunner > 250) exitwith { _success = false; _error = "Movement Error"; };
	if(!_success) exitwith {};		
	if(ClientInterrupted) exitwith { _success = false; _error = "Client Interrupted"; player switchmove ""; };
	if(DeadPlayer) exitwith { _success = false; _error = "Dead Player"; };	

	uisleep 1;

};


_POPUP ctrlSetStructuredText parseText format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.9'>%1</t> <br/> <t size='1'>%2</t>",_task,_error];
player say "slideout";
_POPUP ctrlSetStructuredText parseText format["",_task,_timeLeft];

if(!_success) exitwith {}; 

_oreArray = ["np_goldbar2"];

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
		if(_localProtection != globalProtection) exitwith { [1,"Van Drop Off"] spawn client_fnc_anticheat; };

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

deletevehicle theGunner;
_price = (_totalvalue*1000);

[format["%1 will be transferred to the casino vault as soon as the pirates have confirmed the grade of the gold.", _price call client_fnc_numberText], true] remoteExec ["domsg",currentMobster];

[_price] spawn {

	params["_price"];

	uiSleep (400+(random 400));

	["casinoVault", _price, "Add",true] remoteexec ["server_fnc_setValue",2];
	["casinoVault", format["%1 (%2) has transferred %3 into the casino vault from the boat.", name player, getplayeruid player, _price call client_fnc_numberText]] remoteexec ["server_fnc_log",2];

	[format["%1 has been transferred to the casino vault.", _price call client_fnc_numberText], true] remoteExec ["domsg",currentMobster];

};
