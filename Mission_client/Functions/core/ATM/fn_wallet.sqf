disableSerialization;
//9001 
_cash = player getVariable "cashinhand";
_bank = player getVariable "cashinbank";
_display = findDisplay 9999; 

_text = _display displayCtrl 9993;

_bank = _bank call client_fnc_numberText;

_text ctrlSetStructuredText parseText format["%1",_bank];

_text = _display displayCtrl 9994;

_cash = _cash call client_fnc_numberText;

_text ctrlSetStructuredText parseText format["%1",_cash];

_list = _display displayCtrl 9001;

_licenses = licenseArray;

if(0 IN _licenses) then {
	_list lbAdd "Driver's License";
};

if(1 IN _licenses) then {
	_list lbAdd "Class 1 Weapons License";
};

if(2 IN _licenses) then {
	_list lbAdd "Mining License";
};

if(3 IN _licenses) then {
	_list lbAdd "Logging License";
};

if(4 IN _licenses) then {
	_list lbAdd "Fishing License";
};

if(5 IN _licenses) then {
	_list lbAdd "Truck License";
};

if(6 IN _licenses) then {
	_list lbAdd "Pilot's License";
};

if(7 IN _licenses) then {
	_list lbAdd "Oil Trade License";
};

if(8 IN _licenses) then {
	_list lbAdd "PD SWAT Leader Certification";
};

if(9 IN _licenses) then {
	_list lbAdd "PD SWAT Certification";
};

if(10 IN _licenses) then {
	_list lbAdd "PD Scuba Leader Certification";
};

if(11 IN _licenses) then {
	_list lbAdd "PD Scuba Certification";
};

if(12 IN _licenses) then {
	_list lbAdd "PD Air Leader Certification";
};

if(13 IN _licenses) then {
	_list lbAdd "PD Air Certification";
};

if(14 IN _licenses) then {
	_list lbAdd "DoC CRT Leader Certification";
};

if(15 IN _licenses) then {
	_list lbAdd "DoC CRT Certification";
};

if(16 IN _licenses) then {
	_list lbAdd "DoC Air Leader Certification";
};

if(17 IN _licenses) then {
	_list lbAdd "DoC Air Certification";
};

if(18 IN _licenses) then {
	_list lbAdd "Boat License";
};

if(19 IN _licenses) then {
	_list lbAdd "Casino Membership";
};

if(20 IN _licenses) then {
	_list lbAdd "Bar Certification";
};

if(21 IN _licenses) then {
	_list lbAdd "Bus License";
};

if(22 IN _licenses) then {
	_list lbAdd "Class 2 Weapons License";
};

if(23 IN _licenses) then {
	_list lbAdd "FD Air Leader Certification";
};

if(24 IN _licenses) then {
	_list lbAdd "FD Air Certification";
};

if(25 IN _licenses) then {
	_list lbAdd "FD Scuba Leader Certification";
};

if(26 IN _licenses) then {
	_list lbAdd "FD Scuba Certification";
};

if(27 IN _licenses) then {
	_list lbAdd "Paralegal License";
};
