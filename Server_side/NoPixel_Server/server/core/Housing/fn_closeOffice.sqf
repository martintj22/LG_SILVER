params["_office","_player"];

[missionNamespace, ["myoffice", [0,0,0]]] remoteExec ["setVariable", _player]; 
deleteMarker format ['%1OFFICE',getplayeruid _player];

rentedshops = rentedshops - [_office];