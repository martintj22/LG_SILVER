disableSerialization;
createdialog "giveCert_Menu";

params["_licenses","_playername"];

_display = findDisplay 9999; 
_list = _display displayCtrl 9001;

if(!(8 IN _licenses) && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD SWAT Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(8)];
};

if(!(9 IN _licenses) && (player getVariable "cop" == 10 || 8 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD SWAT Certification";
	_list lbSetdata [(lbSize _list)-1,str(9)];
};

if(!(10 IN _licenses) && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD Scuba Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(10)];
};

if(!(11 IN _licenses) && (player getVariable "cop" == 10 || 10 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD Scuba Certification";
	_list lbSetdata [(lbSize _list)-1,str(11)];
};

if(!(12 IN _licenses) && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD Air Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(12)];
};

if(!(13 IN _licenses) && (player getVariable "cop" == 10 || 12 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD Air Certification";
	_list lbSetdata [(lbSize _list)-1,str(13)];
};

if(!(14 IN _licenses) && (player getVariable "doc" == 10) && myJob == "Cop") then {
	_list lbAdd "DoC CRT Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(14)];
};

if(!(15 IN _licenses) && (player getVariable "doc" == 10 || 14 IN licenseArray) && myJob == "doc") then {
	_list lbAdd "DoC CRT Certification";
	_list lbSetdata [(lbSize _list)-1,str(15)];
};

if(!(16 IN _licenses) && (player getVariable "doc" == 10) && myJob == "doc") then {
	_list lbAdd "DoC Air Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(16)];
};

if(!(17 IN _licenses) && (player getVariable "doc" == 10 || 16 IN licenseArray) && myJob == "doc") then {
	_list lbAdd "DoC Air Certification";
	_list lbSetdata [(lbSize _list)-1,str(17)];
};

if(!(19 IN _licenses) && (myJob == "Mobster")) then {
	_list lbAdd "Casino Membership";
	_list lbSetdata [(lbSize _list)-1,str(19)];
};

if(!(20 IN _licenses) && (myJob == "Legal" && player getVariable "legal" >= 6)) then {
	_list lbAdd "Bar Certification";
	_list lbSetdata [(lbSize _list)-1,str(20)];
};

if(!(23 IN _licenses) && (player getVariable "ems" == 10) && myJob == "EMS") then {
	_list lbAdd "FD Air Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(23)];
};

if(!(24 IN _licenses) && (player getVariable "ems" == 10 || 23 IN licenseArray) && myJob == "EMS") then {
	_list lbAdd "FD Air Certification";
	_list lbSetdata [(lbSize _list)-1,str(24)];
};

if(!(25 IN _licenses) && (player getVariable "ems" == 10) && myJob == "EMS") then {
	_list lbAdd "FD Scuba Leader Certification";
	_list lbSetdata [(lbSize _list)-1,str(25)];
};

if(!(26 IN _licenses) && (player getVariable "ems" == 10 || 25 IN licenseArray) && myJob == "EMS") then {
	_list lbAdd "FD Scuba Certification";
	_list lbSetdata [(lbSize _list)-1,str(26)];
};

if(!(27 IN _licenses) && (myJob == "Legal" && player getVariable "legal" >= 6)) then {
	_list lbAdd "Paralegal License";
	_list lbSetdata [(lbSize _list)-1,str(27)];
};