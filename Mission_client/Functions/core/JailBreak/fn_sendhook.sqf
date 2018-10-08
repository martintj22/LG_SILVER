// send hook CurrentCursorTarget;

_height = getposATL player;
if((_height select 2) > 15) exitwith { ["You must be on the ground to latch this!", true] spawn domsg; };

tower = nearestObjects [player, ["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F"], 20];

if(count tower > 0) then {
	if(player distance (tower select 0) < 16) then { ["You are too close", true] spawn domsg; };
	godMode = true;
	_speed = 115;
	beginPoint = "vvv_anzuelo" createVehiclelocal getpos player;
	beginpoint setpos getpos player;
	sleep 1;
	_endpos2 = getpos (tower select 0);
	endPoint = "vvv_anzuelo" createVehiclelocal [(_endpos2 select 0), (_endpos2 select 1), (_endpos2 select 2) + 22];
    endpoint setpos [(_endpos2 select 0), (_endpos2 select 1), (_endpos2 select 2) + 22];
	myRope = ropeCreate [beginPoint, [0,0,0], endPoint, [0,0,0]]; 
	sleep 2;
	[] spawn client_fnc_climbrope;
} else {
	["You are not close enough to latch on to a tower!", true] spawn domsg;
};