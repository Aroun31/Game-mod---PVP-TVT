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
    *           fn_DeployedQG.sqf
    *
    */

    private _BTSD_VehQG         = param[0, objNull, [objNull]];
    private _BTSD_unit          = param[1, objNull, [objNull]];
    private _BTSD_ClassName     = typeOf _BTSD_VehQG;
    private _BTSD_VehRemplace   = "B_Truck_01_mover_F";

        if (isNull _BTSD_VehQG) exitWith {};

            private _BTSD_DmgQG         = damage _BTSD_VehQG;
            private _BTSD_FuelQG        = fuel _BTSD_VehQG;
            private _BTSD_DirQG         = getDir _BTSD_VehQG;
            private _BTSD_PosQG         = getpos _BTSD_VehQG;
            private _arrUnits           = [];
            private _BTSD_side          = _BTSD_VehQG getVariable ["BTSD_SideQG", sideUnknown];

                _BTSD_VehQG setVariable ["BTSD_Act_1", nil, true];
                _BTSD_VehQG setVariable ["BTSD_VehCheck", false, true];
                _BTSD_wait = ["Déploiment du QG", 0.1]spawn BT_fnc_Progress;
                waitUntil {scriptDone _BTSD_wait};
                if !(alive player) exitWith {};

                if !([getpos _BTSD_VehQG, 30, _BTSD_VehQG] call BT_fnc_CheckSpPos) exitWith {
                    hint "Déploiment impossible !\nAucun véhicules/bâtiments ne doit être présent dans un rayon de 30 mètres";
                };

                deleteVehicle _BTSD_VehQG;
            private _BTSD_VehDepolyed   = _BTSD_VehRemplace createVehicle [0, 0, 500];
            _BTSD_VehDepolyed allowDamage false;
            _BTSD_VehDepolyed setpos _BTSD_PosQG;
            _BTSD_VehDepolyed setdir _BTSD_DirQG;
            _BTSD_VehDepolyed setVariable ["BTSD_SideQG", _BTSD_side, true];
            _BTSD_VehDepolyed setVariable ["BTSD_InfoVeh", [_BTSD_DmgQG,_BTSD_FuelQG], true];
            [_BTSD_VehDepolyed]spawn BT_fnc_VictoryOrNot;

                {
                    if ((side player) isEqualTo (side _x)) then {
                        _arrUnits pushBack _x;
                    };
                } forEach allUnits;


                _BTSD_VehDepolyed setVariable ["BTSD_OriginalQG", _BTSD_ClassName, true];

                [_BTSD_VehDepolyed, ["<t color='#00F0F0'>Arsenal<t/>", {
                    [ "Open", [ true ] ] call BIS_fnc_arsenal;
                }]] remoteExec ["addAction", _arrUnits];

                [_BTSD_VehDepolyed, ["<t color='#F0F000'>véhicules<t/>", BT_fnc_VehicleShop]] remoteExec ["addAction", _arrUnits];

                [_BTSD_VehDepolyed, ["<t color='#FF0000'>Replier le QG<t/>", BT_fnc_RepackQG]] remoteExec ["addAction", _arrUnits];

    // ["className",[pos modeltoworld],dir]
    private _BTSD_ObjBase       = Cfg_MissionInfo(getArray,str(side player),"BTSD_ObjBase");

    private _NewPos = [];
    private _recObj = [];
    private _obj    = objNull;

        {
            _x params ["_className", "_pos", "_dir"];
            _NewPos = _BTSD_VehDepolyed modelToWorld _pos;
            _obj    = _className createVehicle [0, 0, 500];
            _obj allowDamage false;
            _obj setpos _NewPos;
            _obj setDir _dir;
            _recObj pushBack _obj;
        } forEach _BTSD_ObjBase;

        _BTSD_VehDepolyed setFuel 0;
        _BTSD_VehDepolyed setVariable ["BTSD_ObjDeployed", _recObj, TRUE];
        _BTSD_VehDepolyed allowDamage true;

    (format ["%1\n\nVient de déployer le QG", name _BTSD_unit]) remoteExecCall ["hint", _BTSD_side];

        ["all", _BTSD_VehDepolyed]call BT_fnc_ClearVeh;