#include "..\..\DA3F_macros.hpp"
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
    *           fn_PosStartQG.sqf
    *
    */

    private _BTSD_NameQG_West 	= Cfg_MissionInfo(getText,"west","Name_Var_Qg");
    private _BTSD_NameQG_East 	= Cfg_MissionInfo(getText,"east","Name_Var_Qg");

    private _BTSD_PosWest 		= Cfg_MissionInfo(getArray,"west","PosStartQg");
    private _BTSD_PosEast		= Cfg_MissionInfo(getArray,"east","PosStartQg");

    private _compileW			= format ["%1 setVehiclePosition [%2, [], 10, ""None""];", _BTSD_NameQG_West, _BTSD_PosWest];

    private _compileE			= format ["%1 setVehiclePosition [%2, [], 10, ""None""];", _BTSD_NameQG_East, _BTSD_PosEast];

    	{
    		DA3F_Compil(_x);
    	} forEach [_compileW, _compileE];

