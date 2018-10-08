["You rented the office!", true] spawn domsg;

player setvariable ["office",currentcursortarget,false];
myoffice = getpos currentcursortarget;
[250] call Client_fnc_removeCash;
closedialog 0;