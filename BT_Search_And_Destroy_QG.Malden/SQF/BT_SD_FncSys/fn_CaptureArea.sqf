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
    *           fn_CaptureArea.sqf
    *
    */

        private _DA3F_Drapeau       = _this param[0, objNull, [objNull]];
        private _DA3F_Args          = _this param[3, [], [[]]];
        private _BTSD_wait          = FALSE;
        private _DA3F_Mrk_Area      = _DA3F_Args param[0, "", [""]];
        private _BTSD_TimeCapture   = Cfg_MissionInfo(getNumber,"RandProps","TimeCapture");
        private _BTSD_Side          =  (_DA3F_Drapeau getVariable ["FlagSide", []])param[0];
        if (_BTSD_Side isEqualTo (side player)) exitWith {
            hint "Votre équipe tient déjà cette zone";
        };
        private _BTSD_Colors        = switch (side player) do {
            case west: {"colorBlufor"};
            case east: {"colorOpfor"};
        };

                _BTSD_wait = ["Capture de la zone", _BTSD_TimeCapture]spawn BT_fnc_Progress;
                waitUntil {scriptDone _BTSD_wait};
                if !(alive player) exitWith {};

        _DA3F_Mrk_Area setMarkerColor _BTSD_Colors;
        _DA3F_Mrk_Area setMarkerAlpha 0.75;

        [player, _DA3F_Drapeau, format["_DA3F_Args setVariable [""FlagSide"", [(side _DA3F_Target), %1], true];", _DA3F_Mrk_Area]] remoteExecCall ["BT_fnc_execCodeTarget",0];

        "Un zone a été capturé" remoteExecCall ["hintSilent"];

        []spawn BT_fnc_CheckVictoryCapture;

        private _AddRessource = Cfg_MissionInfo(getNumber,"RandProps","BT_CaptureRess");

        [player, _AddRessource, "add"]call BT_fnc_ressources;
        ["save"] remoteExecCall ["BT_fnc_SaveLoad_Server", 2];