private["_name","_markers"];

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
	if ( _x getVariable["tracking",FALSE]) then {
		_marker = createMarkerLocal [format["%1_TRACKING",name _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "b_inf";
		_marker setMarkerTextLocal format["%1",name _x];
		_markers pushBack [_marker,_x];
	};
} foreach PlayableUnits;


{  
	if( _x getVariable["tracking",FALSE]) then  
	{	 
		_rand = round (random(999));
		_marker = createMarkerLocal [format["%1_TRACKING",_rand],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "b_motor_inf";
		_marker setMarkerTextLocal format["%1", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName")];
		_markers pushBack [_marker,_x];	
	};   
} foreach vehicles;


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

