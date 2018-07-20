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
    *           fn_SelectCampsByServer.sqf
    *
    */

    if !(isServer) exitWith {};

    private _BTSD_info_Base = Cfg_MissionInfo(getArray,"Map_infos","Markers_Bases");
    private _BTSD_Side      = sideUnknown;
    if ((BTSD_GetBattle select 0) isEqualTo sideUnknown) then {
        _BTSD_Side =  selectRandom [west, east];
    };
    private _BTSD_Group		= if (_BTSD_Side isEqualTo west) then [{
    		BTSD_Grp_Blue
    	},{
    		BTSD_Grp_Red
    }];

            private _BTSD_arrMrk    = [];
            private _BTSD_Role      = "";
            private _BTSD_Mrk       = "";

        if ((BTSD_GetBattle select 1) isEqualTo -1) then [{

        _BTSD_arrMrk    = selectRandom _BTSD_info_Base;
        _BTSD_Role      = _BTSD_arrMrk select 0;
        _BTSD_Mrk       = _BTSD_arrMrk select 1;

            },{

                switch ((BTSD_GetBattle select 1)) do {

                    case 0: {
                        {
                            if ((_x select 0) isEqualTo "Defense") exitWith {
                                _BTSD_Mrk   = _x select 1;
                            };
                        } forEach _BTSD_info_Base;
                    };

                    case 1: {
                        {
                            if ((_x select 0) isEqualTo "Assaillant") exitWith {
                                _BTSD_Mrk   = _x select 1;
                            };
                        } forEach _BTSD_info_Base;
                    };
                };
            }];


    	_BTSD_Group setVariable ["BTSD_Camps", _BTSD_Mrk, TRUE];

    	private _BTSD_Msg = format ["%1 attribué pour les %2", _BTSD_Role, _BTSD_Side];

    	_BTSD_Msg spawn {
    		sleep 3;
    		_this remoteExecCall ["hint"];
    		sleep 10;
    		"" remoteExecCall ["hintSilent"];
    	};