if(isnil "taskrunning") then { taskrunning = false; };

myjob = "DA";
taskrunning = true;
[] call client_fnc_hudwork;

//[0] call client_fnc_jobEnd;