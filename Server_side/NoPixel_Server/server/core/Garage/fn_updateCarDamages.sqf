//License to check in db - status, 1 is available 0 not - object being the vehicle, player the player who owns the vehicle.
//["who cares",0,cursorobject,player] remoteExec ["Server_fnc_updateCarStatus",2];
//[_license,1,_vehicle,player] remoteExec ["Server_fnc_updateCarStatus",2];


params["_damages","_fuel","_license"];

if(isNil "_license") exitwith {}; // spawned car or some shit

_updatestr = format ["updateCarDamages:%1:%2:%3", _fuel, _damages, _license];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;


