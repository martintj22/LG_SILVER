// attach CurrentCursorTarget;
params["_object"];

_object attachTo [player,[0.1,1.1,0]];
player reveal _object;
attachedplayer = true;

[_object] spawn {

    params["_object"];

    waitUntil {sleep 1; !attachedPlayer};

    { detach _x; } foreach (attachedObjects player);

};