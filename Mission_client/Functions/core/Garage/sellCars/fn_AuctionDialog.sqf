closedialog 0;

_check = currentcursortarget getvariable "information";

if(isNil "_check") exitwith { ["You do not own this vehicle.", true] spawn domsg; }; //no information so its not local owner.

createdialog "carPrice";