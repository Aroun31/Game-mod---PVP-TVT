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
    *           fn_CheckSpPos.sqf
    *           [_pos, radius, veh delete of array] call BT_fnc_CheckSpPos
    */

            //private _pos            = param[0];
            _this params ["_pos", ["_radius", 5, [0]], ["_BadObj", objNull, [objNull]]];
            private _nearOtherVeh   = nearestObjects [_pos, ["Car", "Air", "Ship", "Armored", "Submarine", "Support", "Tank", "house"], _radius];

            if !(isNull _BadObj) then {
                _nearOtherVeh = _nearOtherVeh - [_BadObj];
            };

            if (str _nearOtherVeh isEqualTo "[]") then [{
                TRUE
                },{
                FALSE
            }];
