params["_target"];

private["_crew"];
_crew = crew _target;
_veh = _target;

if((side player == civilian && (_veh in current_cars)) || myjob == "Cop" || myJob == "EMS" || myJob == "Fire") then {
	
	{
		[_x] remoteExecCall ["client_fnc_pulloutVeh",_x];
	} foreach _crew;

};