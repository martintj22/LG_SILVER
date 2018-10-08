
/*
	File: fn_spikeStripEffect.sqf
	
	
	Description:
	Doesn't work without the server-side effect but shifted part of it clientside
	so code can easily be changed. Ultimately it just pops the tires.
*/

params [["_vehicle", objNull, [objNull]]];

if(isNull _vehicle) exitWith {}; //Bad vehicle type

[_vehicle, ["HitLFWheel",1]] remoteExec ["setHitPointDamage"];
[_vehicle, ["HitLF2Wheel",1]] remoteExec ["setHitPointDamage"];
[_vehicle, ["HitRFWheel",1]] remoteExec ["setHitPointDamage"];
[_vehicle, ["HitRF2Wheel",1]] remoteExec ["setHitPointDamage"];