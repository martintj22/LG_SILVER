if(isnil "taskrunning") then { taskrunning = false; };

myjob = "EMS";
taskrunning = true;
[] call client_fnc_hudwork;

_cop = player getvariable "EMS";

//[] call client_fnc_ChangePolice;
//[0] call client_fnc_jobEnd;
