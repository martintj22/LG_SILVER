if(vehicle player iskindof "Air") then {

	_smoke1 = "SmokeShell" createVehicle position player; _smoke1 attachTo [vehicle player, [2.5,1,-0.9]];
	_smoke4 = "SmokeShell" createVehicle position player; _smoke4 attachTo [vehicle player, [-2.5,1,-0.9]];
	_smoke2 = "SmokeShell" createVehicle position player; _smoke2 attachTo [vehicle player, [4.5,1,-0.75]];
	_smoke5 = "SmokeShell" createVehicle position player; _smoke5 attachTo [vehicle player, [-4.5,1,-0.75]];
	_smoke3 = "SmokeShell" createVehicle position player; _smoke3 attachTo [vehicle player, [-6,1,-0.6]];
	_smoke6 = "SmokeShell" createVehicle position player; _smoke6 attachTo [vehicle player, [6,1,-0.6]];

	uisleep 10;

	detach _smoke1; deletevehicle _smoke1;
	detach _smoke2; deletevehicle _smoke2;
	detach _smoke3; deletevehicle _smoke3;
	detach _smoke4; deletevehicle _smoke4;
	detach _smoke5; deletevehicle _smoke5;
	detach _smoke6; deletevehicle _smoke6;

} else {

	[] spawn client_fnc_jobend;
	["You need an airplane to do this job..", true] spawn domsg;

};