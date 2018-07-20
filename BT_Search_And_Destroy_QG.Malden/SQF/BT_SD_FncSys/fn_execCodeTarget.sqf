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
    *           fn_execCodeTarget.sqf
    *
    *       [player,_DA3F_unit,"Code No Comiled"] remoteExecCall ["BT_fnc_execCodeTarget",0];
    */


        params[
            ["_DA3F_Target", objNull, [objNull, grpNull]],
            "_DA3F_Args",
            "_DA3F_Code"
        ];

        //(format ["return : ' %1 ' %2 - %3", _DA3F_Code, _DA3F_Args, _DA3F_Target]) remoteExecCall ["systemChat"];

    call compile format ["%1", _DA3F_Code];


/*
    //private _BTSD_Code_Exec = param[0, {}, [{}]];
        params[
            ["_BTSD_Code_Exec", "", [{}, ""]],
            ["_BTSD_Args", "", [""]]
        ];

        if (_BTSD_Code_Exec isEqualTo "") exitWith {systemChat "exec erreur"};

        [_BTSD_Code_Exec, _BTSD_Args] call {
            _finalCode = format ["%1", _BTSD_Code_Exec, _BTSD_Args];
            systemChat format ["Code exec ! -- code :: %1", _BTSD_Code_Exec];
       };
*/