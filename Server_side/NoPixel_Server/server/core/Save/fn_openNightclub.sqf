_type = _this select 0;

if(_type == 0) then { 
    nightclubOpen = false;
} else {
    nightclubOpen = true;
};

publicVariable "nightclubOpen";