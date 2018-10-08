bedactive = true;
params["_result"];
private["_hospitalbed"];
if(_result) then { _hospitalbed = currentcursortarget; } else { _hospitalbed = "A3L_HospitalBed2015" createvehicle [0,0,1000]; };


_hospitalbed attachto [player,[0,1.4,0.5]];
_hospitalbed allowdamage false;