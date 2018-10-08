_list = [
    "plp_up_WoodBarrierLongPolice",
    "plp_up_WoodBarrierShortPoliceLightsOn",
    "plp_up_TrafficConeOrange",

    "plp_up_WoodBarrierLongRed",
    "plp_up_WoodBarrierShortRedLightsOn",
    "plp_up_TrafficConeRed",
    
    "plp_up_MetalFenceGrey"
];

_destroy = nearestObjects [player, _list, 5]; 
_destroy = _destroy select 0;

_time = 120;
if(_destroy IN barriers) then {
    _time = 10;
};

_check = ["Picking Up", _time, 0, player,'vvv_anim_ticket',nil,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 

waitUntil { scriptDone _check };

if (!client_dotask) exitWith {};

barriers = barriers - [_destroy];

deleteVehicle (_destroy); 

_pia = _list find (typeOf (_destroy));

_barrier = [
    "np_woodbarrierlongpolice",
    "np_WoodBarrierShortPoliceLightsOn",
    "np_TrafficConeOrange",

    "np_WoodBarrierLongRed",
    "np_WoodBarrierShortRedLightsOn",
    "np_TrafficConeRed",

    "np_MetalFenceGrey"
] select _pia;

player addMagazine _barrier; 