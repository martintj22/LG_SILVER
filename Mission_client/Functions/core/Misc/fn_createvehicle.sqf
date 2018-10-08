if(myjob IN ["Cop","EMS","Fire"]) then {
	[] SPAWN {
		[0] call client_fnc_jobEnd;
		uisleep 10;
		[player, "getunitloadout", getunitloadout player] remoteExec ["Server_fnc_setVariable",2];
	};
};

["Kicking due to restart or Admin!", true] spawn domsg;

sleep 20;

_object = _this select 0;

_object createvehicle position player;