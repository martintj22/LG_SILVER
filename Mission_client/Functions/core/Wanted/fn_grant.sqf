private["_licenseName"];

_add = call compile format["%1",(lbData[9001,(lbCurSel 9001)])];
["Add","license",_add] remoteexec ["client_fnc_sustain",currentcursortarget];
closedialog 0;

if(_add == 0) then {
	_licenseName = "Driver's License";
};

if(_add == 3) then {
	_licenseName = "Class 1 Weapons License";
};

if(_add == 2) then {
	_licenseName = "Mining License";
};

if(_add == 3) then {
	_licenseName = "Logging License";
};

if(_add == 4) then {
	_licenseName = "Fishing License";
};

if(_add == 5) then {
	_licenseName = "Truck License";
};

if(_add == 6) then {
	_licenseName = "Pilot's License";
};

if(_add == 7) then {
	_licenseName = "Oil Trade License";
};

if(_add == 8) then {
	_licenseName = "PD SWAT Leader Certification";
};

if(_add == 9) then {
	_licenseName = "PD SWAT Certification";
};

if(_add == 10) then {
	_licenseName = "PD Scuba Leader Certification";
};

if(_add == 11) then {
	_licenseName = "PD Scuba Certification";
};

if(_add == 12) then {
	_licenseName = "PD Air Leader Certification";
};

if(_add == 13) then {
	_licenseName = "PD Air Certification";
};

if(_add == 14) then {
	_licenseName = "DoC CRT Leader Certification";
};

if(_add == 15) then {
	_licenseName = "DoC CRT Certification";
};

if(_add == 16) then {
	_licenseName = "DoC Air Leader Certification";
};

if(_add == 17) then {
	_licenseName = "DoC Air Certification";
};

if(_add == 18) then {
	_licenseName = "Boat License";
};

if(_add == 19) then {
	_licenseName = "Casino Membership";
};

if(_add == 20) then {
	_licenseName = "Bar Certification";
};

if(_add == 21) then {
	_licenseName = "Bus License";
};

if(_add == 22) then {
	_licenseName = "Class 2 Weapons License";
};

if(_add == 23) then {
	_licenseName = "FD Air Leader Certification";
};

if(_add == 24) then {
	_licenseName = "FD Air Certification";
};

if(_add == 25) then {
	_licenseName = "FD Scuba Leader Certification";
};

if(_add == 26) then {
	_licenseName = "FD Scuba Certification";
};

if(_add == 27) then {
	_licenseName = "Paralegal License";
};


["license", format["%1 (%2) granted a(n) %3 to %4 (%5).", name player, getplayeruid player, _licenseName, name currentcursortarget, getplayeruid currentcursortarget]] remoteExec ["server_fnc_log",2];