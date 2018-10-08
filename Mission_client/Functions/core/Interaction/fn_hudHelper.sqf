_type = _this select 2;

if(_type == "destroy") exitwith { 
	["location", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; 
	["Job", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; 
};

if(_type == "Location") exitwith { 
	_myposition = _this select 0;
	_mytext = _this select 1;
	_mytime =  [daytime*60*60,"HH:MM"] call BIS_fnc_secondsToString;
	_randomint = time;
	_group = _this select 3;
	
	_nearestMarker = [allMapMarkers, _myposition] call BIS_fnc_nearestPosition;

	if(_myposition distance (getmarkerpos _nearestMarker) <= 25 && _nearestMarker find 'location7656' > -1 ) then {
		
		deleteMarker _nearestMarker;

	};

	[[_myposition, _mytext, _mytime, _randomint, _group,_type,player], {
		params["_myposition","_mytext","_mytime","_randomint","_group","_type","_player"];

		_markername = format["location%1%2",getPlayerUID _player, _randomint];
		_marker = createMarkerlocal [_markername, _myposition];
		_marker setMarkerShapelocal "ICON";
		_marker setMarkerTypelocal "hd_dot";
		_marker setMarkerColorlocal "ColorRed";
		_marker setMarkerTextlocal format ["%1 (%2)", _mytext,_mytime];

		player createDiaryRecord ["Diary", ["Tasks", format["%1 at %2", _mytext,mapGridPosition _myposition]]];

		[_myposition] spawn {
			latestLocation =  _this select 0;
			uiSleep 10;
			latestLocation = nil;
		};

		[_myposition,_player,_group,_randomint,_markername] spawn {
			params["_myposition","_player","_group","_randomint","_markername"];

			waitUntil {sleep 1; player distance _myposition < 20 || count (	allMapMarkers select { _x find _markername > -1} ) == 0 };
			
			if(player distance _myposition <= 25 && myJob IN ["Cop","doc"]) then {
				[150] call client_fnc_addMoneyToBank;

				[format["You have received an extra %1 for arriving on scene.", 150 call client_fnc_numberText], true] spawn domsg;
			};
			
			[[_player, _randomint], { params["_player","_randomint"]; deletemarker format["location%1%2", getPlayerUID _player, _randomint]; }] remoteExec ["bis_fnc_spawn", _group];

		};

		[_markername] spawn { 
			params["_markername"];
			sleep 600; 
			deletemarkerlocal _markername; 
		};
	}] remoteExec["bis_fnc_spawn", _group];

};

if(_type == "Job") exitwith { 
	mypositionJob = _this select 0;
	mytextJob = _this select 1;

	["Job", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; 


	["Job", "onEachFrame", 
	{
		mydistanceJob = floor( getpos player distance mypositionJob );     
		mydistanceJob = format ["%1 | %2m",mytextJob, mydistanceJob];
		drawIcon3D ["\np_dialogs1\draw3dicon\job.paa", [1,1,1,1], mypositionJob, 1, 1, 5, mydistanceJob, 1, 0.036, "PuristaLight"];  
		if(player distance mypositionjob < 20) exitwith { ["Job", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; player say "racebeep1"; };
	}] call BIS_fnc_addStackedEventHandler;

};