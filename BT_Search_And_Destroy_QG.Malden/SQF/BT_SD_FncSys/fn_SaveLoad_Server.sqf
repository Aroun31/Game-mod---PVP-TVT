#include "..\..\DA3F_macros.hpp"
    /*
    *
    *       Project :
    *              Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SaveLoad_Server.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               ["save"]call BT_fnc_SaveLoad_Server;
    *               ["load"]call BT_fnc_SaveLoad_Server;
    *
    *               ["save"] remoteExecCall ["BT_fnc_SaveLoad_Server", 2];
    *               ["load"] remoteExecCall ["BT_fnc_SaveLoad_Server", 2];
    *
	*/



//_infos = [[capture flag], [varNameGrpWest,Count ressources grp], [varNameGrpEast,Count ressources grp]]

    private _BT_LocalServerSave = profileNamespace getVariable ["BTSD_SaveServer", []];

    if (_BT_LocalServerSave isEqualTo "[]") exitWith {
        profileNamespace getVariable ["BTSD_SaveServer", []];
    };

/*
    private _type           = param[0, "", [""]];
    private _BTSD_VarName   = format ["%1_SAVE", missionName];

    if (_type isEqualTo "") exitWith {};


        switch (_type) do {

            case "save": {
            private _BTSD_AllFlags  = Cfg_MissionInfo(getArray,"RandProps","AllFlags");

            private _infos          = [];
            private _AllFlagsInfos  = [];
            private _victory        = FALSE;
            private _cntFlag        = 0;
            private _cntFlagW       = 0;
            private _cntFlagE       = 0;
            private _compil         = "";
            _cntFlag = count _BTSD_AllFlags;

            {
                _compil     = format ["%1 getVariable [""FlagSide"", []];", _x];
                _varInfos   = DA3F_Compil(_compil);

                        _AllFlagsInfos pushBack [_x, _varInfos];
            } forEach _BTSD_AllFlags;
            _infos pushBack _AllFlagsInfos;
            _infos pushBack [BTSD_Grp_Blue, (BTSD_Grp_Blue getVariable ["Grp_ressource", 0])];
            _infos pushBack [BTSD_Grp_Red, (BTSD_Grp_Red getVariable ["Grp_ressource", 0])];
            profileNamespace setVariable [_BTSD_VarName, _infos];
            saveProfileNamespace;
            };

            case "load": {

                private _load = profileNamespace setVariable [_BTSD_VarName, []];

                if (str _load isEqualTo "[]") exitWith {
                        [BTSD_Grp_Blue, 1500, "add"]call BT_fnc_ressources;
                        [BTSD_Grp_Red, 1500, "add"]call BT_fnc_ressources;
                };

                {
                    _x params["_flag", "_infos"];
                    _infos params ["_Camp", "_Mrk"];

                    _flag setVariable ["FlagSide", _infos, TRUE];

                        switch (_Camp) do {
                            case west: {
                                _Mrk setMarkerColor "colorBlufor";
                                _Mrk setMarkerAlpha 0.75;
                            };
                            case east: {
                                _Mrk setMarkerColor "colorOpfor";
                                _Mrk setMarkerAlpha 0.75;
                            };
                        };
                } forEach (_load param[0]);

                {
                    _x params ["_grp", "_ressources"];
                        [_grp, _ressources, "add"]call BT_fnc_ressources;
                } forEach (_load param[1]);

                {
                    _x params ["_grp", "_ressources"];
                        [_grp, _ressources, "add"]call BT_fnc_ressources;
                } forEach (_load param[2]);

            };
        };
*/
        //this setVariable ["FlagSide", [sideUnknown, "BTSD_Mrk_Capture_08"], true];
