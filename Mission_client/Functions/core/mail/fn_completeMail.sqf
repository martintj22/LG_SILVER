["You've got Mail!", true] spawn doquickmsg;

awaitingmail append mail;

mail = awaitingmail;

awaitingmail = [];

[player,"Hej! Du har ny mail som venter på dig. Du kan hente den fra enten posthuset eller dit hjem","Silver Lake"] remoteExec ["server_fnc_sendMessage",2];