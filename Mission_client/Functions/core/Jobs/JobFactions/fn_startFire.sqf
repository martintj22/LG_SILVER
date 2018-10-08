if(isnil "taskrunning") then { taskrunning = false; };

myjob = "Fire";
taskrunning = true;
[] call client_fnc_hudwork;

_cop = player getvariable "Fire";

//[] call client_fnc_ChangePolice;
//[0] call client_fnc_jobEnd;
