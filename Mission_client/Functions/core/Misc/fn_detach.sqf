// detach CurrentCursorTarget;
_chairs = ["big_chair_civ","sofagris_civ","sillamedico2_civ","sillademedico_civ","Land_WoodenTable_large_F","vvv_lowmodel_mesaoficina","vvv_lowmodel_jukebox","vvv_lowmodel_comoda1","nopixel_tools_escritorio2","nopixel_tools_lampara2","nopixel_tools_mesa","nopixel_tools_planta"];

_attachedObjects = [];

{
	if(typeof _x IN _chairs) then { ["You cant drop furniture with this function", true] spawn domsg; } else { detach _x; _attachedObjects pushBack _x; };
} forEach attachedObjects player;

if(attachedcar) then {
	attachedcar = false;
};

if(attachedplayer) then {
	attachedplayer = false;
};

{ 
	if (!(_x isKindOf "Man")) then { 
		detach _x; _x setPosATL [getPosATL _x select 0, getPosATL _x select 1, (getPosATL player select 2) + 0.1]; 
		_infor = _x getvariable "information";
		if(!(isnil "_infor")) then {
			_fuel = _infor select 10;
			_damages = _infor select 11;
			[_x,_damages,_fuel,"damage"] spawn client_fnc_damageVehicle;
		};
	};
 } foreach _attachedObjects;




