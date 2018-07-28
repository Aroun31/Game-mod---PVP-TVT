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
    *           fn_SearchQG.sqf
    *		[west - east]call BT_fnc_SearchQG;
    */

    private _BTSD_GetSide 	= param[0, sideUnknown, [sideUnknown]];
    private _BTSD_VehQG     = objNull;
    private _BTSD_Var_Qg 	= "";

	    if (_BTSD_GetSide isEqualTo sideUnknown) exitWith {
	    	_BTSD_VehQG
	    };

    {

    	if ((typeOf _x) in ["B_Truck_01_box_F", "B_Truck_01_mover_F"]) then {

    		_BTSD_Side 	= _x getVariable ["BTSD_SideQG", sideUnknown];

    		if (_BTSD_Side isEqualTo _BTSD_GetSide) exitWith {
                 _BTSD_Var_Qg = Cfg_MissionInfo(getText,str(_BTSD_Side),"Name_Var_Qg");
	    		_BTSD_VehQG = switch (_BTSD_Side) do {
	    		    case west: {_x};
	    		    case east: {_x};
	    		};
                _BTSD_VehQG setVehicleVarName _BTSD_Var_Qg;
                _compil = format ["%1 = %2", _BTSD_Var_Qg, _BTSD_VehQG];
                DA3F_Compil(_compil);
    		};
    	};
    } forEach (allMissionObjects "car");

    _BTSD_VehQG