params["_object"];
private["_cashadded"];

if(bankrobber != 4) exitwith {};

bankrobber = 1;
closedialog 0;

if(typeof _object == "plp_ct_HighSecMediumBlack") then {

	["Add","Karma", random (15) ,"Stress"] call client_fnc_sustain;

	_cashadded = 12534 + (count currentcop * 824) + random 1;
} else {

	["Add","Karma", random (20) ,"Stress"] call client_fnc_sustain;

	_cashadded = 73323 + (count currentcop * 1131) + random 1;
};

mybank = ObjNull;

[_cashadded,false,true] call Client_fnc_addMoneyToPlayer;
[format["You have stole %1.",_cashadded call client_fnc_numberText], true] spawn domsg;