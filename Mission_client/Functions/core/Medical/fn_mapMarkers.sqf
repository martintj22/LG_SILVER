private["_name","_markers","_passengers"];

waituntil{visiblemap};

if(mapHint) then {
	["You can bring up map markers by pressing on your windows key.", true] spawn domsg;
	["You may find a log for all notifications above.", true] spawn domsg;
	mapHint = false;
};

if(!(isNil "latestLocation")) then { 

	mapAnimAdd [3, 0.01, latestLocation];
	mapAnimCommit;

	latestLocation = nil;
};

_markers = [];

{
	if (player IN currentMedicDispatch && count (crew _x) > 0 && count (crew _x select {_x IN currentEMS && "ItemGPS" in assignedItems _x}) > 0) then {
		_passengers = " (" + ((crew _x select {_x IN currentEMS && "ItemGPS" in assignedItems _x} apply {name _x + " " + (_x getVariable "badgeNumber")}) joinString ", ") + ")";
	} else { 
		_passengers = "";
	};
	if ( _x getVariable["emsCar",""] != "") then {
		_marker = createMarkerLocal [format["%1%2_EMS_CAR",getplayeruid _x, random 10000],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1%2", _x getVariable "emsCar", _passengers];
		_markers pushBack [_marker,_x];
	};
}foreach vehicles;

{
	if ( _x getVariable["dead",FALSE] ) then {
		_marker = createMarkerLocal [format["%1_dead_marker",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal "";
		_markers pushBack [_marker,_x];
	};
	if ( _x in currentems && "ItemGPS" in assignedItems _x && player IN currentMedicDispatch && _x == vehicle _x) then {
		_marker = createMarkerLocal [format["%1_EMS_UNIT",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1 %2", name _x, _x getVariable "badgeNumber"];
		_markers pushBack [_marker,_x];
	};
} foreach PlayableUnits;


while {visibleMap} do
{
	{
		private["_marker","_unit"];
		_marker = _x select 0;
		_unit = _x select 1;
		
		if(!isNil "_unit") then
		{
			if(!isNull _unit) then
			{
				_marker setMarkerPosLocal (visiblePosition _unit);
			};
		};
		
	} foreach _markers;
	if(!visibleMap) exitWith {};
	uiSleep 0.05;
};
{deleteMarkerLocal (_x select 0);} foreach _markers;	






