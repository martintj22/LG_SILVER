if(!isNil "houselight") then { deletevehicle houselight; };
houselight = "#lightpoint" createVehiclelocal getpos (_this select 0);  
houselight setLightBrightness 0.5;  
houselight setLightAmbient [0.55, 0.55, 0.55];  
houselight setLightColor [0.0, 0, 0.0];  
houseLight setLightAttenuation [11,0,0,0,15,22];

_count = 0;
_houselight = houselight;
while {true} do {
	sleep 10;
	_count = _count + 1;
	if(isNull _houselight) exitwith {};
	if(_count > 600) exitwith { deletevehicle _houselight; };
	if(player distance (_this select 0) > 100) exitwith { deletevehicle _houselight; };
};	
