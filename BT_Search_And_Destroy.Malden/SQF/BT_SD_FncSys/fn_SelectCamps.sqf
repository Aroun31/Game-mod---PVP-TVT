//#include "..\..\DA3F_macros.hpp"
    /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F-BT] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SelectCamps.sqf
    *           []call BT_fnc_SelectCamps;
    *
    */

    private _BTSD_Config    = missionConfigFile >> "BTSD_Cfg_Mission";
    private _BTSD_Side		= side player;

    private _BTSD_MrkDefe   = getText (_BTSD_Config >> "Defense" >> "Mrk_Bases");
    private _BTSD_MrkAssa   = getText (_BTSD_Config >> "Assaillant" >> "Mrk_Bases");
    private _BTSD_ArrRet    = [];


    //systemChat str [_BTSD_MrkAssa, _BTSD_MrkDefe];

        _BTSD_ArrRet = switch (_BTSD_Side) do {
        //    case west: {[_BTSD_MrkDefe,"Defense"]};
        //    case east: {[_BTSD_MrkAssa,"Assaillant"]};

            case east: {[_BTSD_MrkDefe,"Defense"]};
            case west: {[_BTSD_MrkAssa,"Assaillant"]};

        };

    _BTSD_ArrRet