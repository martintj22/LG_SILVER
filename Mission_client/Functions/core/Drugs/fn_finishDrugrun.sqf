private["_vehicle"];
_oreArray = ["CG_Heroin"];

if(isNil "globalProtection") then { globalProtection = 0; };
if(globalProtection != 0) exitwith { ["Error - Already processing", true] spawn domsg; };
_localProtection = 0;

if(myJob == "Mafia") then {
	_vehicle = mafiaVehicle;
};
if(myJob == "Biker") then {
	_vehicle = bikerVehicle;
};

_thecargo = getmagazineCargo _vehicle;

clearmagazinecargoGlobal _vehicle;

_holder = _vehicle;

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

_mafiaCash = 0;

_mafiacash = _totalValue * 600;

[_mafiaCash,false,true] call Client_fnc_addMoneyToPlayer;
["Add","Karma",random(30),"Stress"] call client_fnc_sustain;

[format["You have gained %1 from the drug run.", _mafiaCash call client_fnc_numberText], true] spawn domsg;


deletevehicle _vehicle;