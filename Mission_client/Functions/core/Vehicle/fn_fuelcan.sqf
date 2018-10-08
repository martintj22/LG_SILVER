params["_object"];

[_object,1] remoteExec ["setfuel"];

player removeItem "np_fuelcan";

["You have refueled that vehicle.", true] spawn domsg;