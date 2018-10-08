
_response = currentcursortarget getvariable "sale";
if (isNil "_response") exitwith { ["Not for sale or already sold!", true] spawn domsg; };
[format["The price of the vehicle is %1.", ((currentcursortarget getvariable "sale") select 0) call client_fnc_numberText], true] spawn domsg;