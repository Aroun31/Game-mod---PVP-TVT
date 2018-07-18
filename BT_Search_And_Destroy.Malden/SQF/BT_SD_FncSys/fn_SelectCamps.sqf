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
    *           fn_SelectCamps.sqf
    *
    */

    private _BTSD_info_Base = Cfg_MissionInfo(getArray,"Map_infos","Markers_Bases");
    private _BTSD_Side		= side player;

	private _BTSD_arrMrk 	= selectRandom _BTSD_info_Base;
	private _BTSD_Role 		= _BTSD_arrMrk # 0;
	private _BTSD_Mrk 		= _BTSD_arrMrk # 1;

    	/*_BTSD_Group setVariable ["BTSD_Camps", _BTSD_Mrk, TRUE];*/

/*
    private _BTSD_Group     = if (_BTSD_Side isEqualTo west) then [{

        [{
            BTSD_Grp_Blue setVariable ["BTSD_Camps", _BTSD_Mrk, TRUE];
            (format ["Yolo salut c'est moi : ' %1 ' ", _BTSD_Mrk]) remoteExecCall ["systemChat"];
        }] remoteExecCall ["BT_fnc_execCodeTarget", 2, TRUE];

    },{

        [BTSD_Obj_Map, format ["%1", _BTSD_Mrk], "_DA3F_Target setVariable [""BTSD_Camps"", _DA3F_Args, TRUE];"] remoteExecCall ["BT_fnc_execCodeTarget", 2, TRUE];

    }];
*/

    [(group player), _BTSD_arrMrk, "_DA3F_Target setVariable [""BTSD_Camps"", _DA3F_Args, TRUE];"] remoteExecCall ["BT_fnc_execCodeTarget", 0, TRUE];

    [BTSD_Obj_Map, _BTSD_arrMrk, "_DA3F_Target setVariable [""BTSD_GetCamps"", TRUE, TRUE];"] remoteExecCall ["BT_fnc_execCodeTarget", 0];

    	private _BTSD_Msg = format ["%1 attribué pour les %2", _BTSD_Role, _BTSD_Side];

    	_BTSD_Msg spawn {
    		sleep 1;
    		_this remoteExecCall ["hint"];
    		sleep 10;
    		"" remoteExecCall ["hintSilent"];
    	};