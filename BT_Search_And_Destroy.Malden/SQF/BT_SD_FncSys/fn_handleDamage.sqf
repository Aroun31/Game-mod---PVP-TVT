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
    *           fn_handleDamage.sqf
    *
    */

    params [
        ["_unit",objNull,[objNull]],
        ["_part","",[""]],
        ["_damage",0,[0]],
        ["_source",objNull,[objNull]],
        ["_projectile","",[""]],
        ["_index",0,[0]]
    ];

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        //currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] &&
        if (_projectile in ["B_9x21_Ball_Tracer_Yellow", "B_556x45_dual"]) then {
            _damage = 0;

            _unit spawn {
            private _BTSD_CheckCamps    = [];
            private _BTSD_Nrb           = player getVariable ["BTSD_Coma", 0];

            if (isNil "DA3F_IsAssom") then {
                DA3F_IsAssom = false;
            };

            if (DA3F_IsAssom) exitWith {}; // No Spam effect !!

            if (_BTSD_Nrb isEqualTo 2) exitWith {
                hint "Vous voilà en prison";
                _this setpos (getMarkerPos "BTSD_Mrk_Jail");
                removeallWeapons player;

                {
                    player removeMagazine _x;
                } forEach (magazines player);
                sleep 120;

                _BTSD_CheckCamps  = (group player) getVariable ["BTSD_Camps", []];

                    private _BTSD_Mrk_Base = _BTSD_CheckCamps params[1];

                player setpos getMarkerPos _BTSD_Mrk_Base;
                hint "Libéré de prison";
            };

                DA3F_IsAssom = true;
            cutText ["","WHITE IN",0];
                _this setUnconscious true;
                sleep .3;
                _BTSD_Nrb = _BTSD_Nrb + 1;

                player setVariable ["BTSD_Coma", _BTSD_Nrb, FALSE];

                    cutText ["Vous venez d'être assomé","BLACK OUT",4];

                 "dynamicBlur" ppEffectEnable true; // enables ppeffect
                 "dynamicBlur" ppEffectAdjust [5]; // intensity of blur
                 "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                 enableCamShake true; // enables camera shake
                 addCamShake [10, 10, 10]; // sets shakevalues
                 // Coupe la touche echap
                 (findDisplay 46) displaySetEventHandler ["KeyDown", "if ((_this select 1) isEqualTo 1) then {true}"];
                sleep (3 + random 3); // temps pendant le quel le joueur est au sol
                cutText ["Vous retrouvez vos esprits..", "PLAIN DOWN", 4];
                 "dynamicBlur" ppEffectEnable true; // enables ppeffect
                 "dynamicBlur" ppEffectAdjust [0]; // intensity of blur
                 "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                 // reattribution du key_handler.sqf
                 (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call BT_fnc_Keysboard"];
                    resetCamShake;
                _this setUnconscious false;
                DA3F_IsAssom = false;
            };
        };
    };
};
_damage;