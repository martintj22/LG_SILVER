_player = _this select 0; 
 
diag_log ["request medic %1", _player]; 
 
if(count currentEMS == 0) exitwith {}; 
 
[getPos _player, "Downed Person", "Location", currentEMS] remoteExec ["client_fnc_requestMedic"];