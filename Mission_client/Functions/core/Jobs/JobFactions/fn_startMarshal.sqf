if(isnil "taskrunning") then { taskrunning = false; };

myjob = "Marshal";
taskrunning = true;
[] call client_fnc_hudwork;
_cop = player getvariable "Marshal";

//[] call client_fnc_ChangePolice;
//[0] call client_fnc_jobEnd;