 params["_sender"];
 
[format["This person has %1 in his bank account.", (player getVariable "cashinbank") call client_fnc_numberText], true] remoteExec ["domsg", _sender];