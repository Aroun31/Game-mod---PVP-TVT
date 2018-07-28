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
    *               #include "..\..\DA3F_macros.hpp"
    *
	*/

    #define DA3F_Compil(Args)  ([Args]call{call compile format ["%1",param[0, [[""], [""]] ]]})
    #define My_Ctrl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
    #define Cfg_Veh_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgVehicles" >> Class >> SETTING)
    #define Cfg_A3(TYPE,Config,Class,SETTING) TYPE(ConfigFile >> Config >> Class >> SETTING)
    #define Cfg_MissionInfo(TYPE,Class,SETTING) TYPE(missionConfigFile >> "BTSD_Cfg_Mission" >> Class >> SETTING)
    #define ListeWeapons My_Ctrl(180718,1500)
    #define Ressources   (group player) getVariable ["Grp_ressource", 0]
    #define ListeAmmo    My_Ctrl(180718,1501)
    #define ListeOptics My_Ctrl(180718,1502)
    #define ListVehicle My_Ctrl(200718,1500)

    /*
    Check number pos in building
    return array of number position building
*/
        #define GetPosNumBuilding(BUILDING) {private _DA3F_buildingPos = [];private _DA3F_AllPosBuilding = [];\
            if (isNull BUILDING) exitWith {[]};\
                  for "_a" from 0 to 50 do {\
                    _DA3F_buildingPos = BUILDING buildingpos _a;\
                    if !(str _DA3F_buildingPos isEqualTo "[0,0,0]") then {\
                        _DA3F_AllPosBuilding pushBack _a\
                    };\
                };\
                _DA3F_AllPosBuilding\
        }


    #define GetXML(TEXT)    ([TEXT]call{private _textReturn ="";\
    private _textCheckXML = format ["%1", param[0, [[""], [""]] ]];\
    if (isLocalized _textCheckXML) then\
    [{\
        _textReturn = localize _textCheckXML;\
    },{\
        _textReturn =format ["%1", _textCheckXML];\
    }];\
    _textReturn;\
    })