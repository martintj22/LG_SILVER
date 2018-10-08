if(isnil "taskrunning") then { taskrunning = false; };

myjob = "doc";
taskrunning = true;
[] call client_fnc_hudwork;
_cop = player getvariable "doc";

//[] call client_fnc_ChangeDoc;
//[0] call client_fnc_jobEnd;
