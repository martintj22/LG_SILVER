params["_newParam"];

if(isNil "bleedingEffect") then { bleedingEffect = 0; };

if(bleedingEffect < 0) then { bleedingEffect = 0};
if(bleedingEffect > 180) exitwith {};
if(bleedingEffect > 0) exitwith { bleedingEffect = bleedingEffect + _newParam; };
bleedingEffect = _newParam;
while {bleedingEffect > 0} do {
	
	999 cutRsc ["HUDbleed","PLAIN"]; 

	uisleep 3;

	if (((client_level_array select 14) / 100) > -1 && ((client_level_array select 14) / 100) < 2 ) then { ["Remove",0.05] call Client_Fnc_DoHealth; };

	if (((client_level_array select 14) / 100) > 1 && ((client_level_array select 14) / 100) < 3 ) then { ["Remove",0.15] call Client_Fnc_DoHealth; };

	if (((client_level_array select 14) / 100) > 2 ) then { ["Remove",0.25] call Client_Fnc_DoHealth; };

	bleedingEffect = bleedingEffect - 3;

};