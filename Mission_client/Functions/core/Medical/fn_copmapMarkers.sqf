private["_name","_markers","_passengers"];

waituntil{visiblemap};

if(mapHint) then {
	["You can bring up map markers by pressing on your windows key.", true] spawn domsg;
	["You may find a log for all notifications above.", true] spawn domsg;
	mapHint = false;
};

if(!(isNil "latestLocation")) then { 

	mapAnimAdd [1, 0.1, latestLocation];
	mapAnimCommit;

	latestLocation = nil;
};

_markers = [];

{
	if (player IN currentDocDispatch && count (crew _x) > 0 && count (crew _x select {_x IN currentDoc && "ItemGPS" in assignedItems _x}) > 0) then {
		_passengers = " (" + ((crew _x select {_x IN currentDoc && "ItemGPS" in assignedItems _x} apply {name _x + " " + (_x getVariable "badgeNumber")}) joinString ", ") + ")";
	} else { 
		_passengers = "";
	};
	if (player IN currentPoliceDispatch && count (crew _x) > 0 && count (crew _x select {_x IN currentCop && "ItemGPS" in assignedItems _x}) > 0) then {
		_passengers = " (" + ((crew _x select {_x IN currentCop && "ItemGPS" in assignedItems _x} apply {name _x + " " + (_x getVariable "badgeNumber")}) joinString ", ") + ")";
	} else { 
		_passengers = "";
	};
	if ( _x getVariable["tracking",FALSE]) then {
		_marker = createMarkerLocal [format["%1_TRACKING",name _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "b_inf";
		_marker setMarkerTextLocal format["%1",name _x];
		_markers pushBack [_marker,_x];
	};
	if ( _x getVariable["robberCar",FALSE] ) then {
		_marker = createMarkerLocal [format["%1_TRACKED_CAR_ROBBER",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal "Vehicle Theft";
		_markers pushBack [_marker,_x];
	};
	if ( _x getVariable["pdCar",""] != "") then {
		_marker = createMarkerLocal [format["%1%2_PD_CAR",getplayeruid _x, random 10000],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1%2", _x getVariable "pdCar", _passengers];
		_markers pushBack [_marker,_x];
	};
	if ( _x getVariable["docCar",""] != "") then {
		_marker = createMarkerLocal [format["%1%2_DOC_CAR",getplayeruid _x, random 10000],visiblePosition _x];
		_marker setMarkerColorLocal "ColorKhaki";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1%2", _x getVariable "docCar", _passengers];
		_markers pushBack [_marker,_x];
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
	if( _x getVariable["tracking",FALSE]) then  
	{	 
		_rand = round (random(999));
		_marker = createMarkerLocal [format["%1_TRACKING",_rand],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "b_motor_inf";
		_marker setMarkerTextLocal format["%1", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName")];
		_markers pushBack [_marker,_x];	
	};   
	if (_x getVariable["JailTracked",FALSE]) then {
		_marker = createMarkerLocal [format["%1_TRACKED_JAIL_ROBBER",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["INMATE: %1",name _x];
		_markers pushBack [_marker,_x];
	};

	if ( _x getVariable["robber",FALSE] ) then {
		_marker = createMarkerLocal [format["%1_TRACKED_BANK_ROBBER",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal "Bank Robbery";
		_markers pushBack [_marker,_x];
	};
	if ( _x in currentcop && "ItemGPS" in assignedItems _x && player IN currentPoliceDispatch && _x == vehicle _x) then {
		_marker = createMarkerLocal [format["%1_PD_UNIT",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1 %2", name _x, _x getVariable "badgeNumber"];
		_markers pushBack [_marker,_x];
	};

	if ( _x in currentdoc && "ItemGPS" in assignedItems _x && player IN currentPoliceDispatch && _x == vehicle _x) then {
		_marker = createMarkerLocal [format["%1_DOC_UNIT",getplayeruid _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorKhaki";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal format["%1 %2", name _x, _x getVariable "badgeNumber"];
		_markers pushBack [_marker,_x];
	};
	if ( _x in currentems && "ItemGPS" in assignedItems _x && player IN currentPoliceDispatch && _x == vehicle _x) then {
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






