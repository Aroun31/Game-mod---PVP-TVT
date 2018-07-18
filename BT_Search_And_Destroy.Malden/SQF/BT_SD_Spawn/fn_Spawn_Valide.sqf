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
    *           fn_Spawn_menu.sqf
    *
    */

    private _BTSD_MyCtrl    = param[0, controlNull, [controlNull]];
    private _BTSD_Idc       = ctrlIDC _BTSD_MyCtrl;
    private _grp            = grpNull;
    private _BTSD_unit      = objNull;
    private _BTSD_CheckCamps  = (group player) getVariable ["BTSD_Camps", []];

        _BTSD_CheckCamps params[
            "_BTSD_Role",
            "_BTSD_Mrk_Base"
        ];

    if (_BTSD_Mrk_Base isEqualTo "" && {!(str _BTSD_Idc isEqualTo "2402")}) exitWith {
        systemChat "Spawn introuvable"
    };

        switch (str _BTSD_Idc) do {

            // Base
            case "2400": {
                hint "Spawn base";
                player setpos getMarkerPos _BTSD_Mrk_Base;
            };

            // Team
            case "2401": {
                _grp           = ((units group player) - [player]);
                _BTSD_Idxunit  = _grp findIf {alive _x && (_x distance getMarkerPos "respawn_west") > 300};

                    if (_BTSD_Idxunit isEqualTo -1) exitWith {hint "Votre équipe n'est pas sur le terrain"};

                hint "Spawn team";
                    _BTSD_unit     = _grp select _BTSD_Idxunit;
                player setpos getPos _BTSD_unit;
            };

            // Lobby
            case "2402": {
                failMission "BackLobby";
            };

            default {
                 hint "une erreur c'est produite";
            };
        };

        (ctrlParent _BTSD_MyCtrl) closeDisplay 0;