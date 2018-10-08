if(count currentnewsman == 0) exitwith {};
//camsetup 
target = currentNewsMan call BIS_fnc_selectRandom; 
publicvariable "target";

if(!isNil "cam") then {
	[] remoteexec ["client_fnc_killcams",-2];
};

if(isNil "neck") then {
	neck = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "neck";
};

if(isNull neck) then {
	neck = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "neck";
};

if(isNil "pilot") then {
	pilot = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "pilot";
};

if(isNull pilot) then {
	pilot = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "pilot";
};

if(isNil "sometarget") then {
	sometarget = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "sometarget";	
};

if(isNull sometarget) then {
	sometarget = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	publicvariable "sometarget";
};	

detach neck;
detach pilot;
detach sometarget;
[] remoteexec ["client_fnc_watchcamera",-2];

