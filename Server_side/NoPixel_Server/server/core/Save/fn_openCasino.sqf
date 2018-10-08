_type = _this select 0;

if(_type == 0) then { 
    casinoOpen = false;
} else {
    casinoOpen = true;
};

publicVariable "casinoOpen";