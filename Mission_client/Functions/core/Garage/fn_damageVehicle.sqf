/*
[
["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitRGlass","HitLGlass","HitGlass6","HitLBWheel","HitLMWheel","HitRBWheel","HitRMWheel","",""],
["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","palivo","motor","karoserie","glass1","glass2","glass3","glass4","","","","","","","","","light_l","light_r"],
[1,0.210439,0.45844,0.0758052,0,0,0.0520206,1,1,0.28961,0.344917,0,0,0,0,0,0,0,0,0.228736,0.0294002]
]
*/

// _vehicle is obviously the vehicle we are running the damages to.
// _damages is stored with ****(getallhitpointsdamage _vehicle) select 2;**** to the database
// _fuel is the stored with fuel vehicle;
// _type is either setting the damage or saving, so set or save.


//****(getAllHitPointsDamage _vehicle) select 0;**** returns all the hitpoints of the vehicle

//[_vehicle,_damages,_fuel,"damage"] spawn client_fnc_damageVehicle;

//we remoteexec the vehicle, hit point damages(not the part array), then the vehicle fuel;

params["_vehicle","_damages","_fuel","_type"];

if(_vehicle iskindof "Ship" || _vehicle iskindof "Boat") exitwith {};

if(_type == "save") exitwith { 
	_cardamage = ((getAllHitPointsDamage _vehicle) select 2);
	if(isNil "_cardamage") then { _cardamage = []; };
[_cardamage,fuel _vehicle,_vehicle] remoteexec ["server_fnc_updateCarDamages",2]; 
};

[_vehicle,_fuel] remoteExec ["setfuel"];

if(_damages isEqualTo 0) exitWith {};

_vehicleHitPoints = (getAllHitPointsDamage _vehicle) select 0;

_highestHitpoint = [];
{
	_currentHitPoint = (_vehiclehitpoints select _forEachIndex);
	if(_currentHitpoint IN ["HitFuel","HitEngine","HitHull"]) exitWith {
		if(_x > 0.9) then {
		 _highestHitpoint pushback 0.9; 
		} else {
		 _highestHitpoint pushback _x; 
		};
	};
} foreach _damages;

_vehicle setDamage [(selectMax _highestHitpoint), false]; 

{
	_currentHitPoint = (_vehiclehitpoints select _forEachIndex);
	_damageOnHitPoint = _x;

	if(_damageOnHitPoint > 0.7 && _currentHitpoint IN ["HitFuel","HitEngine","HitHull"]) then { _damageOnHitPoint = 0.7; };

	[_vehicle, [_currentHitPoint, _damageOnHitPoint]] remoteExec["sethitpointdamage"];

} foreach _damages;