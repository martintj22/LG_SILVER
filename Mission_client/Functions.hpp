
// Koil



class CfgFunctions 
{
	class Client
	{
		class Casino
		{
			file = "Functions\core\Casino";
			class lottoBuy {};
			class lotteryCheck {};
			class lottoRun {};
			class horseOdds {};
			class horseRace {};
			class horseCheckOdds {};
			class horseProcessBet {};
			class horseWinCheck {};
			class slotsspin {};
			class slotsstart {};
			class casinoRoom {};
			class convertMoney {};
			class robVault {};
			class giveCasinoRoom {};
			class brinkstoboat {};
			class mobsterOreJob {};
			class rentRoom {};
			class dumpOre {};
			class finishOreDrop {};

		};		
		class Phone
		{
			file = "Functions\core\Phone";
			class forceRadioConnection {};
			class phoneSys {};
			class radioConnectCall {};
			class radioCallMenu {};
			class takeplayermoney {};
			class returnwallet {};
			class tracecall {};
			class trackedby {};
			class trackedcall {};
			class requestcurrentcall {};
			class entertappedcall {};
			class findTapped {};
			class giveCallInformation {};
			class updatePhoneBook {};
			class updatePhoneBookPlayers {};
			class updateBG {};
			class loadBG {};
			class saveBG {};
			class updateSkin {};
			class loadSkin {};
			class saveSkin {};			
			class fadePhone {};
			class answerCall {};
			class Answered {};
			class busyAnswer {};
			class callMenuPP {};
			class callMenu {};
			class callProgress {};
			class callSomebody {};
			class changedoc {};
			class changeEMS {};
			class changePolice {};
			class changeFrequency {};
			class checkCall {};
			class currentCallMenu {};
			class dVol {};
			class hangUp {};
			class iVol {};
			class noAnswer {};
			class PhoneDisabled {};
			class resetCall {};
			class ringPlayer {};
			class speakerMode {};
			class stereoRotation {};
			class tryCall {};
			class tryHangup {};
			class openMessages {};
			class clearRadio {};
			class advertiseSend {};
			class chooseUserMessage {};
			class tweetSend {};
			class sendMessage {};
		};

		class PoliceItems {
			file = "Functions\core\PoliceItems";
			class pickupBarrier {};
			class spikestrip {};
			class spikestripeffect {};
			class useBarrier {}; 
			class placeBarrier {};
		};

		class Drugs {
			file = "Functions\core\Drugs";
			class drinkTequila {};
			class drugJob {}; 
			class druginit {};
			class useDrug {};
			class dumpDrugs {};
			class mafiaDrugEvent {};
			class finishDrugRun {};
		};

		class JailBreak {
			file = "Functions\core\JailBreak";
			class jailclothing {};
			class workout {};
			class craftlockpick {};
			class crafthackingdevice {};
			class blowdoor {};
			class climbrope {};
			class disableplayertracking {};
			class enableplayertracking {};
			class sendhook {};
			class hackdoor {};
			class gettimeleft {};
		};

		class HUD {
			file = "Functions\core\Hud";
			class hudbattery {};
			class hudeffects {};
			class huddamaged {};
			class hudhealth {};
			class hudhunger {};
			class hudthirst {};
			class hudunhealthiness {};
			class hudwork {};
		};

		class admin {
			file = "Functions\core\admin";
			class adminexecute {};
			class adminloadplayers {};
			class adminupdateplayer {};
			class adminESP {};
			class nametags {};
		};		

		class police {
			file = "Functions\core\police";
			class trylicense {};
			class setGear {};
			class sendintox {};
			class seizeObjects {};
			class payDTU {};
			class raidshop {};
			class raidhouse {};
			class setlastsave {};
			class raiddump {};
			class seizeproperty {};
			class viewhouse {};
			class viewshop {};
			class viewoffice {};
		};

		class Wanted {
			file = "Functions\core\wanted";
			class payticketend {};
			class revokesend {};
			class revokeupdate {};
			class revoke {};
			class revokelicense {};
			class grantsend {};
			class grantupdate {};
			class grant {};
			class grantlicense {};
			class licenseCheck {};
			class licenseReturn {};
			class licenseRead {};
			class searchlicense {};
			class questionPlayer {};
			class jurycall {};
			class startJury {};
			class wantedredirect {};
			class gencrime {};
			class checkwanted {};
			class processJail {};
			class wantedAdd {};		
			class arrestAdd {};		
			class wantedUser {};		
			class wantedLoad {};	
			class wantedproduce {};	
			class wantedRemove {};
			class loadwantedProcessing {};
			class writeticket {};
			class ticketresult {};	
			class taketicket {};	
			class jailsetup {};
			class wantedinformationupdate {};
			class acceptWarrant {};
			class addAPB {};
			class setBail {};
			class acceptBail {};
			class removeBail {};
			class closeBail {};
		};

		class Mail {
			file = "Functions\core\mail";
			class chooseUserMail {};
			class sendMail {};
			class openMail {};
			class completeMail {};
			class mailSystem {};
		};

		class jobFactions {
			file = "Functions\core\jobs\JobFactions";
			class startDispatch {};
			class startCop {};
			class startMafia {};
			class startBiker {};
			class startMobster {};
			class startMarshal {};
			class startdoc {};
			class startFire {};
			class startDMV {};
			class startDA {};
			class startEMS {};
		};

		class jobs {
			file = "Functions\core\jobs";
			class mylevels {};
			class radioStart {};
			class changeCarRadio {};
			class jobstart {};
			class firestart {};
			class fireDelete {};
			class BATrobbery {};
			class robberyStore {};
			class paintball {};
			class listfurniture {};
			class spawnfurniture {};
			class rentoffice {};
			class completeoffice {};
			class startJob {};
			class selectJob {};
			class spawnJobVehicle {};
			class tipradiopresenter {};
			class finishpayradiopresenter {};
			class jobMarker {};
			class jobEnd {};
			class jobClothing {};
			class repairNear {};
			class startGenericJob {};
		};
		class shop {
			file = "Functions\core\Shopping";

			class updatehousePos {};
			class acceptsharehouse {};
			class sharehouse {};
			class sharehousefinish {};

			class upgradeHouse {};
			class playerselect {};
			class playerselectfinish {};
			class updatePrices {};
			class clothesupdate2 {};
			class clothesUpdate {};
			class storeSetup {};
			class storeSetup2 {};
			class openShop {};
			class purchaseAI {};
			class confirmPurchase {};
			class payShopOwner {};
			class loadstore {};
			class purchase {};
			
		};
		class JobMeth {
			file = "Functions\core\Jobs\JobMeth";
			class usedrugtable {};
			class dropdrugtable {};
			class upmethcooking {};
			class methcooking {};
		};
		class JobLegalAid {
			file = "Functions\core\Jobs\JobLegalAid";
			class startLegalAid {};
			class startJudge {};
			class startLegal {};
		};
		class JobTaxi {
			file = "Functions\core\Jobs\JobTaxi";
			class startTaxi {};
			class startBus {};
		};
		class JobTowTruck {
			file = "Functions\core\Jobs\JobTowTruck";
			class startTowTruck {};
			class startrepair {};
		};		
		class JobNews {
			file = "Functions\core\Jobs\JobNews";
			class startNews {};
			class killcams {};
			class camsetup {};
			class watchcamera {};
		};			
		class JobSecurity {
			file = "Functions\core\Jobs\JobSecurity";
			class startSecurity {};
		};	

		class JobFarming {
			file = "Functions\core\Jobs\JobFarming";
			class cropDusting {};
			class cropDustingSpray {};
			class farmingPlots {};
			class fishTrawling {};
		};					
		class JobGarbage {
			file = "Functions\core\Jobs\JobGarbage";
			class collectGarbage {};
			class startGarbage {};
		};
		class Medical
		{
			file = "Functions\core\Medical";
			class putoutfire {};
			class spawnbed {};
			class dropbed {};
			class copmapmarkers {};
			class marker {};
			class bleed{};
			class bandagetarget {};
			class bandagewound {};
			class loadcargo {};
			class loadbasket {};
			class lowerbasket {};
			class raisebasket {};
			class unloadbasket {};
			class givedisease {};
			class spreaddisease {};
			class mapmarkers {};
			class chooseUser {};
			class damageChance {};
			class doInjuriesUpdate {};
			class findPlayers {};
			class findPlayersALL {};
			class fixProblem {};
			class healTime {};
			class medicUpdater {};
			class totalPain {};	
			class sendrevive {};		
			class revived {};
		};
		class Mayor
		{
			file = "Functions\core\Mayor";
			class paymayor {};
			class setmayor {};
			class lockvote {};
			class loadvote {};
			class settax {};
			class paytax {};
			class paybill {};
			class mayorsetup {};
			class loadassassin {};
		};	

		class Crafting
		{
			file = "Functions\core\crafting";
			class craftMenu {};
		};

		class ATM
		{
			file = "Functions\core\ATM";
			class wallet {};
			class atmDeposit {};
			class atmTransfer {};
			class atmWithdraw {};
			class openStash {};
			class openATM {};
			class openMafiaATM {};
			class openMobsterATM {};
			class openGovtATM {};
			class openCasinoVault {};
			class openBikerATM {};
			class findplayersatm {};
		};

		class CarAuction
		{
			file = "Functions\core\Garage\sellCars";
			class AuctionDialog {};
			class AuctionSellCar {};
			class AuctionCheckPrice {};
			class AuctionPurchaseCar {};
			class AuctionSellerFinish {};
		};

		class Garage
		{
			file = "Functions\core\Garage";
			class damageVehicle {};
			class carEvent {};
			class carEventEnd {};
			class careventendpolice {};
			class announceCivilians {};
			class findplayerskeys {};
			class choosekeyuser {};
			class givekeys {};
			class carUpdate {};
			class racetimes {};
			class lock {};
			class openF1 {};
			class opengaragepolice {};
			class finishLicense {};
			class processplates {};
			class changeplates {};
			class spawnvehicle {};
			class numberplate {};
			class fetchCarList {};
			class pushveh {};
			class garageRepair {};
			class fetchCar {};
			class fetchCar2 {}; // single car no information added - f1 races etc
			class openGarage {};
			class storeCar {};
			class openCarYard {};
			class initvehicle {};
			class IvoryInitVehicle {};
			class ivorylicensevehicle {};
			class upgradeShop {};
			class manual {};
			class upgradeShopBuy {};
			class carShop {};
			class carshopbuy {};
		};

		class Init
		{
			file = "Functions\core\Init";
			class loadInventory {};
			class miscVariables {};
			class loadingscreen {};
			class karmaPhoneInit {};
		};

		class Interaction
		{
			file = "Functions\core\Interaction";
			class hudHelper {};
			class initInteractions {};
			class interactionAction {};
			class openInteraction {};
		};
		class Farming
		{
			file = "Functions\core\Farming";
			class goldFarming {};
			class packgoldbar {};
			class scangold {};
			class rarePelt {};
			class plantweed {};
			class dropweedplot {};
			class upweedgrowing {};
			class weedgrowing {};
			class processBricks {};
			class poleFishing {};
			class dynamiteFishing {};
			class cutTree {};
			class packLogs {};
			class refineLogs {};
			class refineFish {};
			class refinepelts {};
			class refineOil {};
			class refineMetal1 {};
			class mineMetal {};
			class sellore {};
			class searchCrates {};
			class sellfish {};

		};
		class EventHandlers
		{
			file = "Functions\core\EventHandlers";
			class rotateLight {};
			class HandleDamage {};
			class HandleKilled {};
			class HandleFired {};
			class HandleFiredNear {};
			class forceFPS {};
			class HandleKeys {};
			class HandleKeysUp {};
			class HandleMouse {};
			class fetchitemtype {};
			class inventoryOpened {};
			class removeitem {};
			class fuckyoucgandprorpandothershitmods {};
		};

		class Misc
		{
			file = "Functions\core\Misc";
			class jumpscript {};
			class giveLicense {};
			class grabBody {};
			class license {};
			class getName {};
			class getRemoteVar {};
			class dance {};
			class getTint {};
			class evidence {};
			class checkBank {};
			class lockCasino {};
			class lockNightclub {};
			class IED {};
			class IEDdetonate {};
			class IEDdisplay {};
			class IEDdefuse {};
			class IEDveh {};
			class hackCar {};
			class hackCarDisable {};
			class hackCarDisplay {};
			class frisk {};
			class lootsetup {};
			class lootdrop {};
			class closedialogs {};
			class robfinish {};
			class trackPlayer {};
			class trackvehicle {};
			class untrackvehicle {};
			class sellvehicle {};
			class impoundvehicle {};
			class vehinforeturn {};
			class pee {};
			class pee2 {};
			class teargas {};
			class vomit {};
			class gunholster {};
			class seatbelts {};
			class lockpick {};
			class ejectdriver {};
			class pulloutveh {};
			class pulloutplayers {};
			class knockout {};
			class knockedout {};
			class destroyGroundHolders {};
			class promote {};
			class promotionstart {};
			class promotionfirst {};
			class hideobjectnear {};
			class createvehicle {};
			class setvariable {};
			class medicRequest {};
			class requestMedic {};
			class surrender {};
			class setcasinorate {};
			class fullHeal {};
			class getDoor {};
			class startFresh {};
			class getMagazineName {};
			class getWeaponName {};
			class deathscreen {};
			class getVehicleName {};
			class hintMP {};
			class nearMarker {};
			class playAnim {};
			class playSound {};
			class sortArray {};
			class doHealth {};
			class hudElements {};
			class survival {};
			class sustain {};
			class setLevel {};
			class doTask2 {};
			class doTask {};
			class billboardsetup {};
			class repair {};
			class stealRims {};
			class attach {};
			class detach {};
			class PatDown {};		
			class putincar {};
			class restrain {};
			class unrestrain {};
			class startpatdown {};	
			class checkPulse {};	
			class blindfold {};
			class houselight {};
			class houselock {};
			class unblindfold {};
			class attemptKO {};
			class successKO {};	
			class tazed {};
			class sharphit {};
			class blunthit {};
		};
		class Money
		{
			file = "Functions\core\Money";
			class securefunds {};
			class bankrobbery {};
			class repairdrill {};
			class takecash {};
			class updateloanmenu {};
			class acceptLoan {};
			class takeLoan {};
			class setOwed {};
			class mafiaOwed {};
			class loanUpdate {};
			class numberText {};
			class addcashmayor {};
			//class addBank {};
			//class addcash {};
			class addMoneyToBank {};
			class addMoneyToPlayer {};
			class addMoneyToStash {};
			class checkMoney {};
			class giveLoan {};
			class giveLoanSubmit {};			
			class giveCash {};
			class giveCashSubmit {};
			class removeBank {};
			class removeCash {};
			class removeStash {};
		};
		class Vehicle
		{
			file = "Functions\core\Vehicle";
			class playermapmarkers {};
			class trackingme {};
			class disabletrackingme {};
			class dorace {};
			class dorally {};
			class kickoutwindows {};			
			class confirmfillvehicle {};
			class fillvehicle {};
			class fuelcan {};
			class useKey {};
			class addafuckingcar {};
		};
	};
};