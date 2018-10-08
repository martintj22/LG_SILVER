params["_target","_variable"]; 
private["_target","_variable"];
 
_variable = call compile _variable;

[missionNamespace, ["packet", _variable]] remoteExec ["setVariable", _target];