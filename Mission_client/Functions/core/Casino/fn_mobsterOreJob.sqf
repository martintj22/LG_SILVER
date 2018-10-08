params ["_vehspawn","_endmission","_mafia","_veh"];

current_cars pushback _veh;
["A brinks truck has appeared at the garage, take it to the Drop Off Point.", true] spawn domsg;

[_vehspawn,"Drop Off Point","Location", player] spawn client_fnc_hudHelper;

endOfmission = _endmission;
mobsterVehicle = _veh;

while {true} do {

	if( player distance _vehspawn < 15 || speed _veh > 10 || isNull _veh ) exitwith {
		[_endmission,"Drop Off Point","Location", player] spawn client_fnc_hudHelper;
	};
	sleep 1;
};

while {true} do {
	if( _veh distance _endmission < 15 || isNull _veh ) exitwith {
		if(myjob != "Mobster") exitwith {[getpos player,"text to display","destroy"] spawn client_fnc_hudHelper;};
		[getpos player,"text to display","destroy"] remoteexec ["client_fnc_hudHelper",_mafia];
	};
	sleep 1;
};
