params ["_barrier"];

attachedbarrier = true;

_pia = [
    "np_woodbarrierlongpolice",
    "np_WoodBarrierShortPoliceLightsOn",
    "np_TrafficConeOrange",

    "np_WoodBarrierLongRed",
    "np_WoodBarrierShortRedLightsOn",
    "np_TrafficConeRed",

    "np_MetalFenceGrey"
] find _barrier;

_barrier = [
    "plp_up_WoodBarrierLongPolice",
    "plp_up_WoodBarrierShortPoliceLightsOn",
    "plp_up_TrafficConeOrange",

    "plp_up_WoodBarrierLongRed",
    "plp_up_WoodBarrierShortRedLightsOn",
    "plp_up_TrafficConeRed",
    
    "plp_up_MetalFenceGrey"
] select _pia;

barrier = _barrier createvehicle getpos player;
barrier attachto [player,[0,1.5,1]];
barrier setVectorUp surfaceNormal getpos barrier;
barrier allowDamage false;
