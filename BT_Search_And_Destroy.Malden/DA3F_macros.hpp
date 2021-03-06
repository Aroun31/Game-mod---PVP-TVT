	/*
    *
    *       Project :  
    *              Search & Destroy
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           DA3F_macros.hpp
    *
    *       EXEMPLES :
    *               #include "DA3F_macros.hpp"
    *
	*/

    #define DA3F_Compil(Args)  ([Args]call{call compile format ["%1",param[0, [[""], [""]] ]]})
    #define My_Ctrl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
    #define Cfg_Veh_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgVehicles" >> Class >> SETTING)
    #define Cfg_A3(TYPE,Config,Class,SETTING) TYPE(ConfigFile >> Config >> Class >> SETTING)
    #define Cfg_MissionInfo(TYPE,Class,SETTING) TYPE(missionConfigFile >> "BTSD_Cfg_Mission" >> Class >> SETTING)
    #define ListeWeapons My_Ctrl(180718,1500)
    #define ListeAmmo My_Ctrl(180718,1501)
    #define ListeOptics My_Ctrl(180718,1502)