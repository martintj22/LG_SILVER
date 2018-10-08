params["_object"];

[player, "grabDrag"] remoteExec ["playAction"];
player forceWalk true;

_object attachTo [player,[0,1,0]];

attachedplayer = true;
player setvariable ["dead",true,true];
uiSleep 5;

[_object] spawn {

    params["_object"];

    waitUntil {
        uiSleep 1; 
        isNull attachedTo _object ||
        isNull(_object) ||
        vehicle player != player
    };

    attachedPlayer = false;
    player setvariable ["dead",nil,true];
    
};

[_object] spawn {

    params["_object"];

    waitUntil {uiSleep 1; !attachedPlayer};

    { detach _x; } foreach (attachedObjects player);

    if(vehicle player == player) then {
        [player, ""] remoteExec ["switchMove"];
    };
    
    player forceWalk false;

};