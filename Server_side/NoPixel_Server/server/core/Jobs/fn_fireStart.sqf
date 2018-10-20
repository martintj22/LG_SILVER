params ["_location"]; 
diag_log ["starting fire %1", _location]; 
if(count currentEMS > 0) then { 
	[_location] remoteexec ["client_fnc_fireStart",-2]; 
	[_location] remoteexec ["client_fnc_jobMarker", currentEMS];
	["911: FOR ALL UNITS! ON THE MAP WAS A LATE FIRE!.", true] remoteExec ["domsg", currentEMS];
}; 