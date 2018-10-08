params["_type"];

{ deleteMarkerLocal _x; } forEach (allmapmarkers select { _x find "tempmarker" > -1});

if(_type == "Home" || _type == "All") then {
    _marker = createMarkerLocal [format["tempmarker_%1",random 10000], myhouse];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_dot";
    _marker setMarkerColorLocal "ColorGreen";
    _marker setMarkerTextLocal "My Home";

};

if(_type == "Shop") then {
    _marker = createMarkerLocal [format["tempmarker_%1",random 10000], getMarkerPos format["%1",(getPlayerUID player)]];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_dot";
    _marker setMarkerColorLocal "ColorGreen";
    _marker setMarkerTextLocal (markerText format["%1",(getPlayerUID player)]);

};

if(_type == "Office") then {
    if(myoffice isEqualTo [0,0,0]) exitWith {};

    _marker = createMarkerLocal [format["tempmarker_%1",random 10000], getMarkerPos format["%1OFFICE",(getPlayerUID player)]];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_dot";
    _marker setMarkerColorLocal "ColorGreen";
    _marker setMarkerTextLocal (markerText format["%1OFFICE",(getPlayerUID player)]);

};

if(_type == "Bank") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_CommonwealthBank","Land_Bank_DED_House_01_F"],30000]);
};

if(_type == "Dunkin") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["land_cg_dunkinbronuts"],30000]);
};

if(_type == "Verizon") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_Market_DED_Market_03_F"],30000]);
};

if(_type == "Gas") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_fs_roof_F"],30000]);
};

if(_type == "Gun") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";
;
	} forEach (nearestobjects[player,["Land_buildingGunStore1"],30000]);
};

if(_type == "General") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_Coffee_DED_Coffee_02_F","Land_Coffee_DED_Coffee_01_F"],30000]);
};

if(_type == "Carshop") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_ModernShowroom"],30000]);
};

if(_type == "Garage") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach [[6937.6,2101.18,0.00143909],[6286.46,1314.53,0.00143814],[7600.27,6318.44,0.00143814],[8681.84,7012.18,0.00143814],[8948.54,7528.86,0.00143814]];
};

if(_type == "Airshop") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_Hangar_F"],30000]);
};

if(_type == "Boatshop") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach [[6901.94,1798.77,0.00163126],[9910.15,5076.94,-2.38744],[9341.46,9769.64,0.00143892],[8624.63,7676.45,0.00115418],[5694.15,2490.83,0.000938892],[4530.26,479.45,0.00191319],[6798.4,4555.32,0.00150335],[5560.22,3887.12,0.00149846],[5425.68,3007.17,0.00143886],[4839.05,2369.54,0.00143862]];
};

if(_type == "Pizzaria") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["land_cg_dexters"],30000]);
};

if(_type == "Bar") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_buildingBar1","Land_Pub_A"],30000]);
};

if(_type == "McDildos") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_Market_DED_Market_01_F"],30000]);
};

if(_type == "Barber") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_buildingBarbers1"],30000]);
};

if(_type == "Centrelink") then {
	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getpos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";

	} forEach (nearestobjects[player,["Land_Centrelink"],30000]);
};

if(_type == "Shops" || _type == "All") then {
	{

        if((getMarkerColor format["%1",(getPlayerUID _x)] IN ["ColorBlack"])) then {

			_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getMarkerPos format["%1",(getPlayerUID _x)]];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "hd_dot";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTextLocal (markerText format["%1",(getPlayerUID _x)]);
		};

	} forEach playableUnits;
};

if(_type == "Offices" || _type == "All") then {
	{
		
        if((getMarkerColor format["%1OFFICE",(getPlayerUID _x)] IN ["ColorBlack"])) then {

			_marker = createMarkerLocal [format["tempmarker_%1",random 10000], getMarkerPos format["%1OFFICE",(getPlayerUID _x)]];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "hd_dot";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTextLocal (markerText format["%1OFFICE",(getPlayerUID _x)]);
		};
	} forEach playableUnits;
};

if(_type == "Processing" || _type == "All") then {
    _arr = [
        ["Oil Refining",[6326.59,2253.8,0.00143814]],
        ["Ore Refining",[6216.28,759.687,0.00143909]],
        ["Log Refining",[3929.69,1465.03,0.00144958]],
        ["Pelt Curing",[3767.85,1849.06,0.00145721]],
        ["Heroin/Cocaine Processing",[2564.27,1472.04,0.00144196]],
        ["Bars/Wood/Oil Selling",[8644.31,6861.77,0.00143623]],
        ["Fish Processing",[9803.09,3003,0.00113201]],
		["Open Wood Logging", [4785.26,3111.01,0.00126648]],
		["Open Mining", [3853.3,2694.51,0.00106621]],
        ["Rare Item Trading", [5447.27,5165.15,0.002213]],
        ["Fish Selling", [4734.05,2411.46,0.00143862]],
        ["Housing Upgrading",[7924.76,2724.39,0.00143814]],
		["Drug Brick Searching", [9220.34,6501.14,0.00143814]]
    ];

	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], _x select 1];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTextLocal (_x select 0);

	} forEach _arr;
};

if(_type == "Misc" || _type == "All") then {
    _arr = [
        ["Silver Lake Court System", [9324.43,5360.77,0.00143814]],
        ["SLPD Silver Lake City", [8297.44,3002.32,0.00143814]],
        ["DoC Silver Lake", [5576.06,6191.3,0.00143433]],
        ["Silver Rush Hotel & Casino", [6759.92,4623.62,0.00142527]],
        ["Noir Nightclub", [6290.39,1352.67,0.00143814]],
        ["SLFD Silver Lake North", [9574.12,4165.42,0.00143814]],
        ["SLFD Colchester", [8524.93,6642.69,-0.269258]],
        ["Silver Lake City Concert Hall", [6736.5,1780.16,0.00144172]],
		["Muscle Beach Gym", [7728.48,2193.45,0.00143886]],
		["Impound Lot", [7604.7,6315.58,0.00143814]],
		["Bank of Silver Lake", [6887.89,2298.34,0.00143814]]
    ];

	{
		_marker = createMarkerLocal [format["tempmarker_%1",random 10000], _x select 1];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTextLocal (_x select 0);

	} forEach _arr;
};

waitUntil { sleep 1; !visibleMap };

{ deleteMarkerLocal _x; } forEach (allmapmarkers select { _x find "tempmarker" > -1});