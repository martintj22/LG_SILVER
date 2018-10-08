params["_target"];

[150] call client_fnc_addMoneyToBank;

[format["You have received an extra %1 for reviving the person.", 150 call client_fnc_numberText], true] spawn domsg;

[player] remoteExec ["client_fnc_revived",_target];