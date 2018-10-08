params["_them","_theirUID"];

if(player getvariable "houselevel" != 3) exitwith { ["You can only share houses at level 3", true] spawn domsg; };

_theirName = name _them;

[format["%1 would like to share a house with you. Windows key and accept if you want to proceed with in the next 60 seconds - you can only share with one person.",_theirName], true] spawn domsg;

houseinvitation = _them;

[] spawn {
	uisleep 60;
	houseinvitation = objNull;	
};

//dialog