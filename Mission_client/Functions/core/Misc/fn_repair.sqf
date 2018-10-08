params["_object"];

if(myjob == "Repairman") exitwith { _object setdamage 0; };

if(_object gethit "motor" > 0.9 && _object iskindof "car") exitwith { 

	_engines = {_x == "CG_Engine"} count magazines player;
	if(_engines > 0) exitwith { 
		_object setdamage 0; 
		_chance = random ( 100 );
		if(_chance > 85) then {
			player removeitem "cg_engine"; 
			["You consumed your engine repair kit on the vehicle.", true] spawn domsg;
		};
	};
	_repaired = false;
	_checkNear = nearestObjects [player, [], 30];
	{
		if(str _x find "tallerdepinturaabandonado" > -1) exitwith { _object setdamage 0; _repaired = true; };
	}foreach _checkNear;

	if(_repaired) exitwith {};

	["You need a repairman, a tow to a garage or an engine to fix this - its too damaged!", true] spawn domsg; 
};

_wheels = {_x == "CG_wheel"} count magazines player;

if(_wheels > 0) exitwith {

	_wheelHPs = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel"];
	_wheelHPs = _wheelHPs apply {[_object getHitPointDamage _x, _x]};
	_wheelHPs sort false;
	_wheelHPs = _wheelHPs apply {_x select 1};

	{

		if ( _object getHitPointDamage _x > 0 ) exitWith {

			[_object,[_x,0]] remoteExec ["setHitPointDamage"];

			_chance = 10;
			if(random(100) < _chance) then {
				player removeitem "CG_wheel";
				["You have replaced the wheel on the vehicle and the repair kit broke.", true] spawn domsg;
			} else {
				["You have replaced the wheel on the vehicle.", true] spawn domsg;
			};

		};

	} forEach _wheelHPs;
	
};

["You need a wheel to fix this vehicle.", true] spawn domsg;