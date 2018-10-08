_information = _this;
_myStatuses = player getvariable "statuses";
_myStatuses set [12, _information]; 
player setVariable ["statuses",_mystatuses,false];

lastsync = time; 
[player, "statuses", (player getvariable "statuses")] remoteExec ["Server_fnc_setVariable",2];

["House is now shared upon login", true] spawn domsg;

houseinvitation = objNull;