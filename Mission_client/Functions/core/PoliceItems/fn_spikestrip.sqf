private["_nearVehicles","_spikeStrip","_Obj"];

_mydir = (getdir player);
_obj = [player, 3.4, _myDir ] call BIS_fnc_relPos; 	
if(_myDir > 30 && _myDir < 181) then {
	_obj = [player, 4.4, _myDir ] call BIS_fnc_relPos; 
};
if(_myDir > 240 && _myDir < 341) then {
	_obj = [player, 2.2, _myDir ] call BIS_fnc_relPos; 	
};
_spikeStrip = createVehicle ["CG_Spikes_Extended", _obj,[], 0, "CAN_COLLIDE"];
_spot = getPos _spikeStrip;
_spikestrip setdir (_myDir - 180);
_spikeStrip setVectorUp surfaceNormal _spot;
_running = true;

while { !isNull _spikeStrip || player distance _spikestrip > 250 || deadPlayer } do {

	_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],10];

	if(count _nearVehicles > 0) then {

		{
			
			if(speed _x >= 3) then {

				deletevehicle _spikestrip;
				[_x] remoteExecCall ["client_fnc_spikeStripEffect",_x]; 

			};

		} forEach _nearVehicles;

	};

	uiSleep 0.05;

};