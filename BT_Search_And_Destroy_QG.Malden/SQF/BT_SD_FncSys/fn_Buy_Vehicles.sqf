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
    *           fn_Buy_Vehicles.sqf
    *
    */

    disableSerialization;

    _this params[
        ["_BTSD_Ctrl", controlNull, [controlNull]],
        ["_BTSD_idx", -1, [0]]
    ];
    private _group              = (group player);
    private _BTSD_getVehTeam    = _group getVariable ["MaxVehTeam", 0];
    private _className  = _BTSD_Ctrl lbData _BTSD_idx;
    private _prix       = _BTSD_Ctrl lbValue _BTSD_idx;
    private _GetQG      = [side player]call BT_fnc_SearchQG;
    private _pos        = _GetQG modelToWorld [0, 20, 0.1];
    private _vehicle    = objNull;


        if !([_pos, 10, _GetQG] call BT_fnc_CheckSpPos) exitWith {
            hint "Déploiment impossible !\nAucun véhicules/bâtiments ne doit être présent dans un rayon de 30 mètres";
        };

        _vehicle = createVehicle [_className, [0, 0, 500], [], 3, "None"];
        _vehicle setPos _pos;
        _vehicle setDir (getDir _GetQG);
        ["all", _vehicle]call BT_fnc_ClearVeh;
        _BTSD_getVehTeam = _BTSD_getVehTeam + 1;
        _group setVariable ["MaxVehTeam", _BTSD_getVehTeam, TRUE];

