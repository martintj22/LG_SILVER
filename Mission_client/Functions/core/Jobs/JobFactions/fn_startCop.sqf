if(isnil "taskrunning") then { taskrunning = false; };

myjob = "Cop";
taskrunning = true;
[] call client_fnc_hudwork;
_cop = player getvariable "cop";

//[] call client_fnc_ChangePolice;
//[0] call client_fnc_jobEnd;
