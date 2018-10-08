_Sub = _this select 0;

if(_sub > casinoVault) then { _sub = casinoVault; };

["casinoVault",_Sub, "Remove",true] remoteexec ["server_fnc_setValue",2];
