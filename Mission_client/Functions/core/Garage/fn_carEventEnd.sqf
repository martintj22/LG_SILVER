params["_vehicle"];
private["_pos"];

_vehicle setvariable ["robberCar",true,true];
_vehicle setvariable ["hotcar",nil,true];




if(local _vehicle) then {
	_vehicle lock 0;
} else {
	[_vehicle,0] remoteExecCall ["client_fnc_lock",_vehicle];
};

["A hot vehicle has been stolen and is placed on the map for Police", true] remoteexec ["domsg",-2];

while{true} do {
	_pos = [RANDOM(10000),RANDOM(10000),0];
	_isWater = surfaceIsWater (_pos);
	if(!_isWater) exitwith {  };	
	uisleep 2;
};

["In 5 minutes your destination will be revealed.", true] spawn domsg;
uisleep 60;

["In 4 minutes your destination will be revealed.", true] spawn domsg;
uisleep 60;

["In 3 minutes your destination will be revealed.", true] spawn domsg;
uisleep 60;

["In 2 minutes your destination will be revealed.", true] spawn domsg;
uisleep 60;

["In 1 minutes your destination will be revealed.", true] spawn domsg;
uisleep 60;

["The vehicle drop off point has been marked on the map - get there in 5 minutes.", false] spawn doquickmsg;


_markername = format["DropOff%1",getPlayerUID player];
_marker = createMarkerlocal [_markername, _pos];
_marker setMarkerShapelocal "ICON";
_marker setMarkerTypelocal "hd_dot";
_marker setMarkerColorlocal "ColorBlue";
_marker setMarkerTextlocal "Drop Off Vehicle Location";	

_count = 0;
while{true} do {
	uisleep 1;
	if(_count > 300) exitwith { ["You took too long!", true] spawn domsg; };
	if(player distance _pos < 25 && driver (_vehicle) == player) exitwith { 
		["You have been awarded the vehicle!", true] spawn domsg; 
		_player = player; 
		_rims = "default"; 
		_windows = 0; 
		_Lights = 0; 
		_owner = getplayeruid player; 
		_licensePlate = "Testing"; 

		_statuses = 1; 
		[_licensePlate, typeof _vehicle, "white", "matte", _rims, 0, 0, _owner, 1, "Add", _player] remoteExec ["Server_fnc_garageUpdate",2];

	};
	_count = _count + 1; 
};



_vehicle setvariable ["robberCar",nil,true];

deletemarkerlocal _markername;