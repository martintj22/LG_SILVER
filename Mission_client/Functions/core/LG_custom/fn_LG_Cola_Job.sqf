publicVariable "colaSkib"
publicVariable "colaStart"
publicVariable "colaMat"

if(colaStart == 1) then 
{ 
colaStart = colaStart +1;
publicVariable "colaStart"

["Der ligger en arbejds bil i garagen!", true] spawn domsg;


sleep 45;  
["Et skib nede på havnen er ankommet med produkter hent dem og transporter dem op til Cola Frabrikken  !", true] spawn domsg;  

colaSkip = colaSkip +1;
sleep 300;

if(colaSkib = 0)
{
    ["Skibet sejler om 2.min skynd dig!", true] spawn domsg;
    sleep 120;
    if(colaSkib= 0){
        ["Skibet er sejlet du er fyret!!", true] spawn domsg;
        [] spawn client_fnc_jobend;
    }
    else {
        ["Du nåede det flot klaret!", true] spawn domsg;
    }
} 

if(colaMat = 1)
{
    ["Smid produkterne i maskinen", true] spawn domsg;
    sleep 120;
} 

}
  else
    {
        ["Du er fyret makker!!!", true] spawn domsg;  
    };
