params["_target"];

[format['This vehicle has a tint percentage of %1%2.', call compile (_target getVariable 'ivory_windowtint')*100, "%"], true] spawn domsg;