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
    *           init_SidePlayer.sqf
    *
    */



    // For all

        BTSD_Vip            = FALSE;
        BTSD_NrbKill        = 0;
        BTSD_NextOk         = FALSE;
        DA3F_IsAction       = FALSE;
        BTSD_BuildActif     = FALSE;
        DA3F_Cash           = 0;
        DA3F_CombatTime     = 0;
        DA3F_FirstViewActiv = FALSE;

        player setVariable ["BTSD_Jail", FALSE, TRUE];
        player setVariable ["BTSD_Coma", 0, FALSE];
        private _pathTexture   = format ["images\Camo\Camo_%1_0%2.jpg", toUpper(str(side player)), ceil(random 2)];
            player forceAddUniform "U_B_survival_uniform";
            player setObjectTextureGlobal [0, _pathTexture];
    // by side
    switch (side player) do {
        case west: {
        /* en attente */
        };

        case east: {
        /* en attente */
        };
    };

    // Translate system

        missionNamespace setVariable ["DA3F_RecTranslateConv", []];
        DA3F_DestiTranslate = objNull;

    // -- End Trans. Sys


        ChechSafeZone_fnc = {
            _mrk_ZoneSafe = ["Mrk_safeZone_Medic_area"];
            params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

                {
                    if (_unit distance getMarkerPos _x <= 130) exitWith {
                        deleteVehicle _projectile;
                          DA3F_WeaponPlayer = currentWeapon player;
                          player action ["SwitchWeapon", player, player, 100];
                          player switchCamera cameraView;
                         hint "ATTENTION\n\nTir interdit dans une zone de cessé le feu !";
                    };
                } forEach _mrk_ZoneSafe;
        };

        player addMPEventHandler ["MPKilled", "_this call BT_fnc_MpKilledUnit"];
        player addEventHandler ["Killed", "_this call BT_fnc_UnitKilled"];
        player addEventHandler ["Respawn", "_this spawn BT_fnc_UnitRespawn"];
        player addEventHandler ["FiredMan", "_this call ChechSafeZone_fnc"];
        player addEventHandler ["FiredNear", "_this spawn BT_fnc_SwitchFirstPerson"];
        player addEventHandler ["HandleDamage", "_this call BT_fnc_handleDamage"];

    //    player addEventHandler ["Fired",{(_this select 6)setShotParents [vehicle bob, bob]}];

        BTSD_NextOk     = TRUE;