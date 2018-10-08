params["_target"];

if ( count(weapons _target) > 0 ) then {
    ["This person has one or more weapons.", true] spawn domsg;
} else {
    ["This person has no weapons.", true] spawn domsg;
};