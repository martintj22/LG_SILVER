disableSerialization;
createdialog "revoke_Menu";

params["_licenses","_playername"];

_display = findDisplay 9999; 
_list = _display displayCtrl 9001;

if(0 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Driver's License";
	_list lbSetdata [(lbSize _list)-1,str(0)];
};

if(1 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Class 1 Weapons License";
	_list lbSetdata [(lbSize _list)-1,str(1)];
};

if(2 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Mining License";
	_list lbSetdata [(lbSize _list)-1,str(2)];
};

if(3 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Logging License";
	_list lbSetdata [(lbSize _list)-1,str(3)];
};

if(4 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Fishing License";
	_list lbSetdata [(lbSize _list)-1,str(4)];
};

if(5 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Truck License";
	_list lbSetdata [(lbSize _list)-1,str(5)];
};

if(6 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Pilot's License";
	_list lbSetdata [(lbSize _list)-1,str(6)];
};

if(7 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Oil Trade License";
	_list lbSetdata [(lbSize _list)-1,str(7)];
};

if(8 IN _licenses && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD SWAT Leader";
	_list lbSetdata [(lbSize _list)-1,str(8)];
};

if(9 IN _licenses && (player getVariable "cop" == 10 || 8 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD SWAT";
	_list lbSetdata [(lbSize _list)-1,str(9)];
};

if(10 IN _licenses && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD Scuba Leader";
	_list lbSetdata [(lbSize _list)-1,str(10)];
};

if(11 IN _licenses && (player getVariable "cop" == 10 || 10 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD Scuba";
	_list lbSetdata [(lbSize _list)-1,str(11)];
};

if(12 IN _licenses && (player getVariable "cop" == 10) && myJob == "Cop") then {
	_list lbAdd "PD Air Leader";
	_list lbSetdata [(lbSize _list)-1,str(12)];
};

if(13 IN _licenses && (player getVariable "cop" == 10 || 12 IN licenseArray) && myJob == "Cop") then {
	_list lbAdd "PD Air";
	_list lbSetdata [(lbSize _list)-1,str(13)];
};

if(14 IN _licenses && (player getVariable "doc" == 10) && myJob == "doc") then {
	_list lbAdd "DoC CRT Leader";
	_list lbSetdata [(lbSize _list)-1,str(14)];
};

if(15 IN _licenses && (player getVariable "doc" == 10 || 14 IN licenseArray) && myJob == "doc") then {
	_list lbAdd "DoC CRT";
	_list lbSetdata [(lbSize _list)-1,str(15)];
};

if(16 IN _licenses && (player getVariable "doc" == 10) && myJob == "doc") then {
	_list lbAdd "DoC Air Leader";
	_list lbSetdata [(lbSize _list)-1,str(16)];
};

if(17 IN _licenses && (player getVariable "doc" == 10 || 16 IN licenseArray) && myJob == "doc") then {
	_list lbAdd "DoC Air";
	_list lbSetdata [(lbSize _list)-1,str(17)];
};

if(18 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Boat License";
	_list lbSetdata [(lbSize _list)-1,str(18)];
};

if(19 IN _licenses && (myJob == "Mobster")) then {
	_list lbAdd "Casino Membership";
	_list lbSetdata [(lbSize _list)-1,str(19)];
}; 

if(20 IN _licenses && (myJob == "Legal" && player getVariable "legal" >= 6)) then {
	_list lbAdd "Bar Certification";
	_list lbSetdata [(lbSize _list)-1,str(20)];
}; 

if(21 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Bus License";
	_list lbSetdata [(lbSize _list)-1,str(21)];
}; 

if(22 IN _licenses && myJob == "Cop") then {
	_list lbAdd "Class 2 Weapons License";
	_list lbSetdata [(lbSize _list)-1,str(22)];
}; 

if(23 IN _licenses && (player getVariable "ems" == 10) && myJob == "EMS") then {
	_list lbAdd "FD Air Leader";
	_list lbSetdata [(lbSize _list)-1,str(23)];
};

if(24 IN _licenses && (player getVariable "ems" == 10 || 23 IN licenseArray) && myJob == "EMS") then {
	_list lbAdd "FD Air";
	_list lbSetdata [(lbSize _list)-1,str(24)];
};

if(25 IN _licenses && (player getVariable "ems" == 10) && myJob == "EMS") then {
	_list lbAdd "FD Scuba Leader";
	_list lbSetdata [(lbSize _list)-1,str(25)];
};

if(26 IN _licenses && (player getVariable "ems" == 10 || 25 IN licenseArray) && myJob == "EMS") then {
	_list lbAdd "FD Scuba";
	_list lbSetdata [(lbSize _list)-1,str(26)];
};

if(27 IN _licenses && (myJob == "Legal" && player getVariable "legal" >= 6)) then {
	_list lbAdd "Paralegal License";
	_list lbSetdata [(lbSize _list)-1,str(27)];
}; 